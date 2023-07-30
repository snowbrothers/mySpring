package com.board.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.board.service.BoardService;
import com.board.vo.BoardVo;

@Controller
@RequestMapping("/board2/*")
public class BoardController {

	
	@GetMapping("recView")
	public void viewPage() {
		
	}
	
	@GetMapping("msg")
	public void msg() {
		
	}
	
	@GetMapping("message")
	public void message(Model model) {
		
	}
	
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
	
	
	
	/**
	 * requestMapping에 /board/ 가 설정 되어 있으므로
	 * /board/write
	 * @param model
	 */
	@GetMapping("write")
	public void write(Model model) {
		
	}
	
	@PostMapping("write")
	public String writeAction(BoardVo board
								, Model model
								, RedirectAttributes rttr) {
		
		System.out.println("writeAction() 실행 ===================================================");
		
		try {
			
			// TODO: handle exception
			int res = boardService.insert(board);
			
			String msg = "";
			
			if(res>0) {
				
				msg = board.getBno() + "번 등록 되었습니다.";
				
				rttr.addFlashAttribute("msg",msg);
				
				return "redirect:/board2/list";
				
			}else{
				
				msg = "등록중 예외사항이 발생 하였습니다.";
				model.addAttribute("msg", msg);
				
				return "/board2/message";
			} 
		}catch (Exception e) {
			
			return "/board2/message";
		}
		
			
	} 
	
	@GetMapping("view")
	public void view(@RequestParam("bno") int bno
						, Model model) {
		
		System.out.println(bno + " view 실행  bno 확인 ==============================");
		
		BoardVo board = boardService.getOne(bno);
		
		model.addAttribute("board", board);
		
	}
	
	
	@GetMapping("delete")
	public String delete(@RequestParam int bno
						, Model model
						, RedirectAttributes rtts) {
		
		int res = boardService.delete(bno);
		
		String msg="";
		
		if(res > 0) {
			
			msg = "삭제 성공 ! ! ! ";
			rtts.addFlashAttribute("msg", msg);
			
			return "redirect:/board2/list";
			
		}else {

			return "/board2/message";
			
		}
		
		
	}
	
	
	@GetMapping("edit")
	public String edit(BoardVo board
						,Model model ) {
		
		BoardVo vo = boardService.getOne(board.getBno());
		
		model.addAttribute("vo",vo);
		
		
		return "/board2/write";
	}
	
	
}
