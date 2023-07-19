package com.board.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.board.service.BoardService;
import com.board.vo.BoardVo;

@Controller
@RequestMapping("/board2/*")
public class BoardController {

	@Autowired
	BoardService boardService;
	
	@GetMapping("list")
	public String getList(BoardVo vo
							, Model model) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		
		List<BoardVo> list = new ArrayList<BoardVo>();
		list = boardService.getList();
		String msg = "map전달확인";
		
		model.addAttribute("list", list);
		model.addAttribute("msg",msg);
		
		map.put("list",list);
		
		map.put("msg",msg);
	
		return "/board2/list";
				
	}
	
	public String insert(BoardVo vo) {
		
		return "";
	}
	
	/**
	 * requestMapping에 /board/ 가 설정 되어 있으므로
	 * /board/write
	 * @param model
	 */
	@GetMapping("write")
	public void write(Model model) {
		
	}
	
}
