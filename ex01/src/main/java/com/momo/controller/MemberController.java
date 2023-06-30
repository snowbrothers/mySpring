package com.momo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.momo.service.MemberService;
import com.momo.vo.Member;

@Controller
public class MemberController {
	
	@Autowired
	MemberService service;

	/**
	 * 로그인 페이지로 이동
	 * @return 
	 */
	@GetMapping("/login")
	public String login() {
		
		
		return "login";
	}
	
	
	@PostMapping("/loginAction")
	public String loginAction(Member member, Model model) {
		
		// 파라메터 자동수집 ..
		// 수집된 파라메터 출력
		System.out.println(member.getId());
		System.out.println(member.getPw());
		
		service.login(member, model);
		
		// model.addAttribute("message","Hello, World");
		
		return "main";
		
	}
	
}
