package com.momo.ex04;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MemController {

	// 파일 경로를 반환해줄 것 이기 때문에 String 타입으로 지정
		
		@GetMapping("login")
		public String login() {

			
			return "login";
	}
	
}
