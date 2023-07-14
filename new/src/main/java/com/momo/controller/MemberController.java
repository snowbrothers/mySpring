package com.momo.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.momo.service.MemberService;
import com.momo.vo.Member;

@Controller
public class MemberController extends CommonRestController{
	
	@Autowired
	MemberService service;
	
	/**
	 * 로그인 페이지로 이동
	 * @return
	 */
	@GetMapping("/login")
	public String login() {
		
		System.err.println("MemberController 호출 ==================================");
		
		return "login";
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		// 세션삭제
		session.invalidate();
		
		return "login";
	}
	
	
	/**
	 * Map
	 * @param member
	 * @param model
	 * @return
	 */
	@PostMapping("/loginAction")
	public @ResponseBody Map<String, Object> loginAction(@RequestBody Member member
			, Model model
			,HttpSession session) {
		
		
		System.out.println("id : " + member.getId());
		System.out.println("pw : " + member.getPw());
		
		member = service.login(member);
		//model.addAttribute("message", member.getId() + "환영합니다.");
		
		if(member != null) {
			
			session.setAttribute("member", member);
			session.setAttribute("userId", member.getId());
			
			return responseMapMsg(REST_SUCCESS, "로그인 되었습니다.");
			
		} else {
		
			return responseMapMsg(REST_FAIL, "아이디와 비밀번호를 확인해주세요");
		}
		
	}
	
	@PostMapping("/idCheck")
	public @ResponseBody Map<String, Object> idCheck(@RequestBody Member member){
		
		int res = service.idCheck(member);
		
		if(res == 0) {
			return responseMapMsg(REST_SUCCESS, "사용가능한 아이디 입니다.");
		}else {
			return responseMapMsg(REST_FAIL, "이미 사용중인 아이디 입니다.");
		}
		
		// count = 1 -> 실패
		// insert, update, delete > 0 => true
		
		
		
		
	}
	
	@PostMapping("/register")
	public @ResponseBody Map<String, Object>
							register(@RequestBody Member member){
		
		
		try {

			int res = service.insert(member);
			return responseWriteMap(res);
			
		}catch (Exception e) {
			
			e.printStackTrace();
			return responseMapMsg(REST_FAIL, "회원가입 중 예외사항 발생..");
		}
		
	}
	
}















