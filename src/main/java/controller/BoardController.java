package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.BoardDAO;
import util.Paging;
import util.Util;
import vo.BoardVO;

@Controller
public class BoardController {

	@Autowired
	HttpServletRequest request;

	BoardDAO board_dao;
	public void setBoard_dao(BoardDAO board_dao) {
		this.board_dao = board_dao;
	}

	//전체게시글 조회
	@RequestMapping("/board_list.do")
	public String selectList(Model model, String page){

		int nowPage = 1;
		
		if( page != null ) {
			nowPage = Integer.parseInt(page);
		}
		
		//한 페이지에 표시될 게시물의 시작과 끝 번호를 계산
		//?page=2
		int start = ( nowPage - 1 ) * Util.Board.BLOCKLIST + 1;
		int end = start + Util.Board.BLOCKLIST - 1;
		
		//map에 시작번호와 끝번호를 저장
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);		
		
		List<BoardVO> list = board_dao.selectList(map);
		model.addAttribute("board_list", list);

		//전체게시물 수 조회
		int row_total = board_dao.getRowTotal();
		
		//하단에 표기될 페이지 메뉴 생성
		String pageMenu = Paging.getPaging(
				"board_list.do", nowPage, row_total, 
				Util.Board.BLOCKLIST, 
				Util.Board.BLOCKPAGE);
		
		model.addAttribute("pageMenu", pageMenu);
		
		//show라는 이름으로 저장된 값을 제거
		/*
		 * if(request.getSession().getAttribute("show") != null)
		 * request.getSession().removeAttribute("show");
		 */

		return Util.Board.VIEW_PATH + "board_list.jsp";		
	}

	//새글 작성을 위한 페이지로 전환
	@RequestMapping("/board_form.do")
	public String insert_form() {
		return Util.Board.VIEW_PATH + "board_write.jsp";
	}

	//새 글 쓰기
	@RequestMapping("/board_insert.do")
	public String insert( BoardVO vo ) {
	
		String ip = request.getRemoteAddr();

		vo.setIp(ip);
	System.out.println(vo.getName());
		
		int res = board_dao.insert(vo);

		return "redirect:board_list.do";		
	}

	//게시글 상세보기
	@RequestMapping("/view.do")
	public String view(Model model, int idx) {

		//상세보기를 위한 게시물 한건 조회
		BoardVO vo = board_dao.selectOne(idx);
		model.addAttribute("vo", vo);

		HttpSession session = request.getSession();
		String show = (String)session.getAttribute("show");

		if(show == null) {
			//조회수 증가를 위한 업데이트 메서드
			board_dao.update_readhit(idx);
			session.setAttribute("show", "");
		}

		return Util.Board.VIEW_PATH + "board_view.jsp";

	}

	//댓글 작성을 위한 페이지로 전환
	@RequestMapping("/reply_form.do")
	public String replyForm(Model model, int idx, int ref, int page) {

		model.addAttribute("idx", idx);
		model.addAttribute("ref", ref);
		//model.addAttribute("page", page);
		return Util.Board.VIEW_PATH + "board_reply.jsp?page="+page;

	}

	//댓글쓰기
	@RequestMapping("/reply.do")
	public String reply( BoardVO vo, String page ) {

		//ip가져오기
		String ip = request.getRemoteAddr();
		vo.setIp(ip);

		BoardVO baseVO = board_dao.selectOne(vo.getIdx());
		
		//댓글작성을 위한 기준글의 step이상인 값은 +1처리를 해 주자
		board_dao.update_step( baseVO );
		
		//댓글이 들어갈 위치를 설정
		vo.setStep(baseVO.getStep()+1);
		vo.setDepth(baseVO.getDepth()+1);
		vo.setId(baseVO.getId());
		//댓글추가
		board_dao.reply(vo);
		
		return "redirect:board_list.do?page="+page;
	}
	
	//게시글 삭제(된 것 처럼) 업데이트
	@RequestMapping("/board_del.do")
	@ResponseBody
	public String del( int idx ) {
		
		BoardVO vo = board_dao.selectOne(idx);
		
		vo.setSubject("삭제된 게시글 입니다");
		vo.setName("unknown");
		
		int res = board_dao.delete(vo);
		
		if( res == 1 ) {
			return "yes";
		}else {
			return "no";
		}
		
	}
}


























































