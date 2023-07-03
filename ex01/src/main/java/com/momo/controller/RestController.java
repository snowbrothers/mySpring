package com.momo.controller;



import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.momo.vo.Member;

@Controller
public class RestController {
	/**
	 * 리턴타입에 어노테이션 추가.
	 * 
	 * 인터페이스 개발시 많이 사용ㅌ
	 * @param member
	 * @return
	 */
	@GetMapping("rest")
	public @ResponseBody Member rest(Member member) {
		System.out.println("실행되지롱");
		return member;
	}
	
	@GetMapping("restResponseEntity")
	public ResponseEntity<String> rest1(){
		HttpHeaders header = new HttpHeaders(); 
		header.add("content-type", "application/json;charset=UTF-8");
	
		String msg = "{\"name\":\"머머\"}";
		ResponseEntity<String> rs = 
							new ResponseEntity<String>(msg, header, HttpStatus.OK);
		
	return rs;
}
	
}