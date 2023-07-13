package com.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("home/boardRe/*")
public class BoardController {

	@GetMapping("list")
	public String getList() {
		
		
		return "board2/list";
	}
	
}
