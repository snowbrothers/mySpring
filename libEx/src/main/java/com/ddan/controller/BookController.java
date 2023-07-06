package com.ddan.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/library/*")
@Log4j
public class BookController {

	@GetMapping("bookList")
	public String getList() {
		
		
		return "bookList";
	}
	
}
