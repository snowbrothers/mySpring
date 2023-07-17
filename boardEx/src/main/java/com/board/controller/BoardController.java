package com.board.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.board.service.BoardService;
import com.board.vo.BoardVo;

@Controller
@RequestMapping("boardRe/*")
public class BoardController {

	@Autowired
	BoardService boardService;
	
	@GetMapping("list")
	public Map<String, Object> getList(Model model) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		
		List<BoardVo> list = new ArrayList<BoardVo>();
		list = boardService.getList(model);
		
		map.put("list",list);
	
		
		return map;
				
	}
	
}
