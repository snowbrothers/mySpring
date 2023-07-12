package com.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class MemberController {

	
	// 아래 주소와 같은 매핑 주소를 입력하면
	@GetMapping("/login")
	public String login() {
		
		// return 되는  jsp 파일로 이동..
		// 호출되는 주소는 WEB-INF/views/common/login.jsp << 가 호출됨.
		// 앞뒤로 url 추가.
		return "/common/login";
	}
	
	@PostMapping("/loginAction")
	public String loginAction() {
		// 만약 받아온 결과를 db 에서 조회.. 
		// 1) 결과값 존재 -> 게시판 페이지로 이동
		// 2) 결과값 없음 -> 로그인 정보확인 메세지 출력
		System.out.println("========================== loginAction 실행");
		
		return "/board/list";
	}
}
