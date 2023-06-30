package com.momo.ex03;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

// 1. 컨트롤러 등록 필수
@Controller
public class MemberController {

	@GetMapping("login")
	public String login() {
		
		// 반환할 jsp 파일의 이름
		return "login";
	}
	
}
