package com.momo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.momo.service.BoardService;
import com.momo.vo.BoardVO;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/board/*")
@Log4j
public class BoardController {

	@Autowired
	BoardService boardService;
	
	@GetMapping("list")
	public void getList(Model model) {
		
		 List<BoardVO> list = boardService.getListXml();
		 log.info("=============================");
		 log.info(list);
		 log.info("=============================");
		 model.addAttribute("list",boardService.getListXml());
		
	}
	
	@GetMapping("view")
	public void getOne(int bno, Model model) {
		
		 model.addAttribute("board",boardService.getOne(bno));
		
	}
	
	@GetMapping("write")
	public void write(Model model) {
		
		
		
	}
	
	@PostMapping("write")
	public String writeAction(BoardVO board, Model model) {
		
		log.info("");
		
		model.addAttribute(boardService.insert(board));
		
		// 페이지 전환 
		return "redirect:/board/list";
	}
	
	@GetMapping("delete")
	public String delete(int bno, Model model) {
		
		model.addAttribute(boardService.delete(bno));
		
		return "redirect:/board/list";
	}
	
	// 수정하기
	@GetMapping("edit")
	public void edit(int bno, Model model) {
		
		 model.addAttribute("board",boardService.getOne(bno));
		
		 System.err.println("수정하기 get 실행");
	}
	
	@PostMapping("edit")
	public String editAction(BoardVO board, Model model) {
		
		model.addAttribute("board",boardService.update(board));
		
		System.err.println("수정하기 post 실행");
		
		return "redirect:/board/view?bno="+board.getBno();
	}
	
	
}
