package com.momo.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.momo.mapper.MemberMapper;
import com.momo.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberMapper memberMapper;

	@Autowired
	BCryptPasswordEncoder encoder;
	
	@Override
	public Member login(Member paramMmeber) {

		// 사용자 정보 조회....
		
		Member member = memberMapper.login(paramMmeber);
		
		if(member != null) {
			// 사용자가 입력한 비밀번호가 일치하는지 확인
			// 사용자가 입력한 비밀번호, 데이터 베이스에 암호화 되어 저장된 비밀번호
			boolean res = encoder.matches(paramMmeber.getPw()
							, member.getPw());
			
			if(res) {
				
				// 사용자 권한 조회
				member.setRole(memberMapper.getMemberRole(member.getId()));
				
				return member;
			}
		}
		
		
		return null;
	}

	@Override
	public int insert(Member member) {
		
		// return 값이 1 보다 크면 id 등록된것.
		
		// 비밀번호 암호화.
		
		
		// 암호화 후 / 암호화 된 비밀번호를 다시 member 객체에 set
		member.setPw(encoder.encode(member.getPw()));
		
		return memberMapper.insert(member);
	}

	@Override
	public int idCheck(Member member) {
		
		// return 값이 1 보다 크면 id 중복체크 완료 ;
		
		return memberMapper.idCheck(member);
	}

	
	@Autowired
	ApiExamMemberProfile apiExam;
	
	@Override
	public void naverLogin(HttpServletRequest request, Model model) {
		
		// callback처리 -> access_token 토큰 얻어오는작업 
		try {
			// callback 처리 => access_token
			Map<String, String> callbackRes = callback(request);
		
			String access_token = callbackRes.get("access_token");
			
			// access_token -> 사용자 정보 조회
			Map<String, Object> responseBody = 
								apiExam.getMemberProfile(access_token);
			
			Map<String, String> response =
								(Map<String, String>) responseBody.get("response");
        	
			System.out.println("============================ naverLogin");
        	System.out.println("name : " + response.get("name"));
        	System.out.println("id : " + response.get("id"));
        	System.out.println("========================================");
        	
        	// 세션에 저장
        	model.addAttribute("id", response.get("id"));
        	model.addAttribute("name", response.get("name"));
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public Map<String, String> callback(HttpServletRequest request) throws Exception{
		
		String clientId = "kMpAeqzzDn_neSLaFX2C";//애플리케이션 클라이언트 아이디값";
	    String clientSecret = "hmibsoUSmq";//애플리케이션 클라이언트 시크릿값";
	    String code = request.getParameter("code");
	    String state = request.getParameter("state");
	    try {
	    String redirectURI = URLEncoder.encode("http://localhost:8080/login/naver_callback", "UTF-8");
	    String apiURL;
	    apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
	    apiURL += "client_id=" + clientId;
	    apiURL += "&client_secret=" + clientSecret;
	    apiURL += "&redirect_uri=" + redirectURI;
	    apiURL += "&code=" + code;
	    apiURL += "&state=" + state;
	    String access_token = "";
	    String refresh_token = "";
	    System.out.println("apiURL="+apiURL);
	    
	      URL url = new URL(apiURL); // url 요청
	      HttpURLConnection con = (HttpURLConnection)url.openConnection();
	      con.setRequestMethod("GET");
	      int responseCode = con.getResponseCode();
	      BufferedReader br;
	      System.out.print("responseCode="+responseCode);
	      if(responseCode==200) { // 정상 호출
	        br = new BufferedReader(new InputStreamReader(con.getInputStream()));
	      } else {  // 에러 발생
	        br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
	      }
	    
	      String inputLine;
	      StringBuffer res = new StringBuffer();
	      while ((inputLine = br.readLine()) != null) {
	        res.append(inputLine);
	      }
	      br.close();
	      if(responseCode==200) {
	        System.out.println("token 요청 : " + res.toString());
	        
	        // json 문자열을 Map 으로 변환
	        Map<String, String> map = new HashMap<String, String>();
	        ObjectMapper objectMapper = new ObjectMapper();
	        map = objectMapper.readValue(res.toString(), Map.class); 
	        return map;
	      
	      } else {
	    	  throw new Exception("callback 반환코드:" + responseCode);
	      }
	    
	    } catch (Exception e) {
	      System.out.println(e);
	      throw new Exception("callback 처리중 예외사항이 발생 하였습니다.");
	    }
		
	}
}
