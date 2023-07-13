package com.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.board.service.BoardService;
import com.board.vo.BoardVo;

@Controller
@RequestMapping("home/boardRe/*")
public class BoardController {

	@Autowired
	BoardService boardService;
	
	@GetMapping("list")
	public List<BoardVo> getList() {
		
		boardService.getList();
		
		return "board2/list";
	}
	
}
