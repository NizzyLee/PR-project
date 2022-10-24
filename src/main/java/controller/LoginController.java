package controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import dao.CalendarDAO;
import dao.KakaoDAO;
import dao.LoginDAO;
import dao.MemoDAO;
import util.Paging;
import util.Util;
import vo.BoardVO;
import vo.CalendarVO;
import vo.KakaoVO;
import vo.MemberVO;
import vo.MemoVO;

@Controller
public class LoginController {

	LoginDAO login_dao;

	public void setLogin_dao(LoginDAO login_dao) {
		this.login_dao = login_dao;
	}
	MemoDAO memo_dao;

	public void setMemo_dao(MemoDAO memo_dao) {
		this.memo_dao = memo_dao;
	}

	@RequestMapping("/PRLogin_form.do") // 시작 페이지 로그인 폼
	public String PRLogin_form() {
		return "/WEB-INF/views/Member/PRLogin_form.jsp";
	}

	@RequestMapping("/login.do") // 로그인 시 id와 비밀번호가 맞는지 확인 및 user 세션에 저장
	@ResponseBody
	public String loginCheck(MemberVO vo, HttpServletRequest request) {
		
		MemberVO baseVO = login_dao.select(vo);
	
		String resultStr = "";

		// email이 존재하지 않는 경우
		if (baseVO == null) {
			resultStr = "[{'res':'no_email'}, {'email':'no'}]";
			return resultStr; // no_id를 콜백메서드로 전달
		}

		// 비밀번호 불일치
		if (!baseVO.getPwd().equals(vo.getPwd())) {
			resultStr = String.format("[{'res':'no_pwd'}, {'email':'no'}]");
			return resultStr; // no_pwd를 콜백메서드로 전달
		}

		// email과 비밀번호에 문제가 없다면 세션에 MemberVO 객체를 저장
		// 세션에 저장된 데이터는 현재 프로젝트의 모든 jsp에서 사용이 가능

		HttpSession session = request.getSession();
		session.setAttribute("user", baseVO);

		resultStr = String.format("[{'res':'clear'}, {'email':'%s'}]", vo.getEmail());
		return resultStr; // 로그인 성공시 clear를 콜백메서드로 전달

	}

	@RequestMapping("/logout.do") // 로그아웃
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("user");
		return "redirect:PRmain.do";
	}

	@RequestMapping("/PRinsert_form.do") // 회원가입 폼
	public String insert_form() {
		return "/WEB-INF/views/Member/PRJoin_form.jsp";
	}

	@RequestMapping("/PRinsert.do") // 회원가입 시 DB에 회원가입 정보 저장
	public String insert(MemberVO vo) {

		int res = login_dao.insert(vo);
		return "/WEB-INF/views/Member/PRLogin_form.jsp";
	}

	@RequestMapping("/email_check.do") // 회원가입 시 id 중복 체크
	@ResponseBody
	public String id_check(MemberVO vo, HttpServletRequest request) {

		int baseVO = login_dao.email_check(vo);
		String resultStr = "";

		// id가 존재하는경우
		if (baseVO == 1) {
			resultStr = "no";
			return resultStr; // no를 콜백메서드로 전달
		} else if (baseVO == 0) {
			resultStr = "yes";
			return resultStr; // no를 콜백메서드로 전달
		} else {
			resultStr = "null";
			return resultStr;
		}

	}

	
	  @RequestMapping(value = { "/", "/PRmain.do" }) // 메인 달력 public
	  public String Main(Model model, String page) {
		
		  int nowPage = 1;
			
			if( page != null ) {
				nowPage = Integer.parseInt(page);
			}
		  
			int start = ( nowPage - 1 ) * Util.Board.BLOCKLIST + 1;
			int end = start + Util.Board.BLOCKLIST - 1;
			
			//map에 시작번호와 끝번호를 저장
			Map<String, Integer> map = new HashMap<String, Integer>();
			map.put("start", start);
			map.put("end", end);	
			
			List<MemoVO> list = memo_dao.selectList(map);
			model.addAttribute("list", list);
			
			//전체게시물 수 조회
			int row_total = memo_dao.getRowTotal();
			
			//하단에 표기될 페이지 메뉴 생성
			String pageMenu = Paging.getPaging(
					"PRmain.do", nowPage, row_total, 
					Util.Board.BLOCKLIST, 
					Util.Board.BLOCKPAGE);
			
			model.addAttribute("pageMenu", pageMenu);
			
			
			/*
			 * List<MemoVO> list = memo_dao.selectList(vo); // System.out.println("gfggg");
			 * model.addAttribute("list", list); // 바인딩
			 */			  
		  return "/WEB-INF/views/Member/PRmain.jsp";
	  	}
	 
	    // 본인인증 컨트롤러
	    @RequestMapping("/phoneAuth.do")
	    @ResponseBody
	    public String sendSMS(@RequestParam("phone") String phone) { // 휴대폰 문자보내기
	       int randomNumber = (int)((Math.random()* (9999 - 1000 + 1)) + 1000);//난수 생성
	       
	       MemberVO baseVO = login_dao.memtelcheck(phone);

	       String resultStr = "";
	       if (baseVO == null) {
	    	   login_dao.certifiedPhoneNumber(phone,randomNumber);
	          resultStr = Integer.toString(randomNumber);
	       }else {
	          resultStr = "yes_tel";
	       }

	       return resultStr;
	    }
}
