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
import vo.CalendarVO;
import vo.KakaoVO;
import vo.MemberVO;

@Controller
public class KaKaoController {
	
	KakaoDAO kakao_dao;

	public void setKakao_dao(KakaoDAO kakao_dao) {
		this.kakao_dao = kakao_dao;
	}
	
	// 카카오 소셜 로그인 컨트롤러
	@RequestMapping(value = "/getKakaoAuthUrl")
	public @ResponseBody String getKakaoAuthUrl(
			HttpServletRequest request) throws Exception {
		String reqUrl = 
				"https://kauth.kakao.com/oauth/authorize"
				+ "?client_id=ca6e5e4d992f77245193882d02128290"
				+ "&redirect_uri=http://localhost:8080/oauth_kakao"
				+ "&response_type=code";
		
		return reqUrl;
	}

	// 카카오 연동정보 조회
		@RequestMapping(value = "/oauth_kakao", produces = "application/text; charset=utf8")
		public String oauthKakao(
				@RequestParam(value = "code", required = false) String code
				, Model model, KakaoVO vo) throws Exception {

			System.out.println("코드" + code);
	        String access_Token = getAccessToken(code);
	        System.out.println("###access_Token#### : " + access_Token);
	        
	        
	        HashMap<String, Object> userInfo = getUserInfo(access_Token);
	        System.out.println("###access_Token#### : " + access_Token);
	        System.out.println("###userInfo#### : " + userInfo.get("email"));
	        System.out.println("###nickname#### : " + userInfo.get("nickname"));
	        System.out.println("###gender#### : " + userInfo.get("gender"));
	        
	        //String encodedParam = URLEncoder.encode((String)userInfo.get("nickname"), "UTF-8");
	        
	        vo.setEmail((String)userInfo.get("email"));
	        vo.setNickname((String)userInfo.get("nickname"));
	        vo.setGender((String)userInfo.get("gender"));
	        
	        System.out.println(vo.getEmail());
	        System.out.println(vo.getNickname());
	        System.out.println(vo.getGender());
	        
	        System.out.println(userInfo);
	        
	        return "redirect:PRinsert_form.do?email="+ vo.getEmail() + "&nickname=" + URLEncoder.encode(vo.getNickname(), "UTF-8") + "&gender=" + vo.getGender(); //본인 원하는 경로 설정
		}
		

		 //토큰발급
		public String getAccessToken (String authorize_code) {
	        String access_Token = "";
	        String refresh_Token = "";
	        String reqURL = "https://kauth.kakao.com/oauth/token";

	        try {
	            URL url = new URL(reqURL);

	            HttpURLConnection conn = (HttpURLConnection) url.openConnection();

	            //  URL연결은 입출력에 사용 될 수 있고, POST 혹은 PUT 요청을 하려면 setDoOutput을 true로 설정해야함.
	            conn.setRequestMethod("POST");
	            conn.setDoOutput(true);

	            //	POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
	            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
	            StringBuilder sb = new StringBuilder();
	            sb.append("grant_type=authorization_code");
	            sb.append("&client_id=ca6e5e4d992f77245193882d02128290");  //본인이 발급받은 key
	            sb.append("&redirect_uri=http://localhost:8080/oauth_kakao");     // 본인이 설정해 놓은 경로
	            sb.append("&code=" + authorize_code);
	            bw.write(sb.toString());
	            bw.flush();

	            //    결과 코드가 200이라면 성공
	            int responseCode = conn.getResponseCode();
	            System.out.println("responseCode : " + responseCode);

	            //    요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
	            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	            String line = "";
	            String result = "";

	            while ((line = br.readLine()) != null) {
	                result += line;
	            }
	            System.out.println("response body : " + result);

	            //    Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
	            JsonParser parser = new JsonParser();
	            JsonElement element = parser.parse(result);

	            access_Token = element.getAsJsonObject().get("access_token").getAsString();
	            refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();

	            System.out.println("access_token : " + access_Token);
	            System.out.println("refresh_token : " + refresh_Token);

	            br.close();
	            bw.close();
	        } catch (IOException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        }

	        return access_Token;
	    }

		//유저정보조회
	    public HashMap<String, Object> getUserInfo (String access_Token) {

	        //    요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
	        HashMap<String, Object> userInfo = new HashMap<String, Object>();
	        String reqURL = "https://kapi.kakao.com/v2/user/me";
	        try {
	            URL url = new URL(reqURL);
	            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	            conn.setRequestMethod("GET");

	            //    요청에 필요한 Header에 포함될 내용
	            conn.setRequestProperty("Authorization", "Bearer " + access_Token);

	            int responseCode = conn.getResponseCode();
	            System.out.println("responseCode : " + responseCode);

	            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

	            String line = "";
	            String result = "";

	            while ((line = br.readLine()) != null) {
	                result += line;
	            }
	            System.out.println("response body : " + result);

	            JsonParser parser = new JsonParser();
	            JsonElement element = parser.parse(result);

	            JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
	            JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();

	            String nickname = properties.getAsJsonObject().get("nickname").getAsString();
	            String email = kakao_account.getAsJsonObject().get("email").getAsString();
	            String gender = kakao_account.getAsJsonObject().get("gender").getAsString();
	            
	            
	            userInfo.put("accessToken", access_Token);
	            userInfo.put("nickname", nickname);
	            userInfo.put("email", email);
	            userInfo.put("gender", gender);

	        } catch (IOException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        }

	        return userInfo;
	    }
	    
	    
}
