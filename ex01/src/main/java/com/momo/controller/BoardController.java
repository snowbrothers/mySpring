package com.momo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.momo.service.BoardService;
import com.momo.vo.BoardVO;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/board/*")
@Log4j
public class BoardController {

	/**
	 *  /board/msg
	 * void << 요청이 응답으로 나가는 반환
	 * WEB-INF/views/board/msg.jsp
	 */
	@GetMapping("msg")
	public void msg() {
		
	}
	
	@GetMapping("message")
	public void message(Model model) {
		
	}
	
	@GetMapping("list_bs")
	public void list_bs(Model model) {
		List<BoardVO> list = boardService.getListXml();
		 log.info("=============================");
		 log.info(list);
		 log.info("=============================");
		 model.addAttribute("list",boardService.getListXml());
	}
	
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
	
	/**
	 * requestMapping에 /board/ 가 설정
	 *  /board/write 로 호출
	 * @param model
	 */
	@GetMapping("write")
	public void write(Model model) {
		
		
		
	}
	
	// RedirectAttributes : RedirectAttributes 시에 파라메터를 넘겨줄 수 있음
	
	/**
	 *  RedirectAttributes )
	 *  	Model 과 같이 매개변수로 받아서 사용가능.
	 *  
	 *  addFlashAttribute : 세션에 저장후 페이지 전환
	 *  	
	 * 
	 * @param board
	 * @param rttr
	 * @param model
	 * @return
	 */
	@PostMapping("write")
	public String writeAction(BoardVO board,
							RedirectAttributes rttr
							,Model model) {
		
		log.info("board");
		
		String msg= "";
		
		// 시퀀스 조회 후 시퀀스 번호를 bno에 저장
		int res = boardService.insertSelectKey(board);
		
		if(res > 0) {
			
			msg = board.getBno() + "번 게시물이 등록되었습니다.";
			
			// url?msg = 등록 (쿼리스트링으로 전달 -> param.msg
			// rttr.addAttribute("msg
			
			// 세션영역에 저장 -> msg
			// 새로고침 시 유지되지 않음
			rttr.addFlashAttribute("msg",msg);
			
			return "redirect:/board/list_bs";
		
		}else { 
			
			msg = "등록중 예외사항이 발생되었습니다.";
		
			model.addAttribute("msg",msg);
			return "/board/message";
		}
		
		
		
		
		
	}
	
	
	
	@GetMapping("delete")
	public String delete(@RequestParam("bno") int bno,
						Model model) {
		
		model.addAttribute(boardService.delete(bno));
			
		return "redirect:/board/list_bs";
	}
	
	// 수정하기
	@GetMapping("edit")
	public void edit(BoardVO board, Model model, RedirectAttributes rttr) {
		
		 model.addAttribute("board",boardService.getOne(board.getBno()));
		
		 System.err.println("수정하기 get 실행");
		 
		 rttr.addFlashAttribute("board", board);
		 
	}
	
	@PostMapping("edit")
	public String editAction(BoardVO board, Model model) {
		
		model.addAttribute("board",boardService.update(board));
		
		System.err.println("수정하기 post 실행");
		
		return "redirect:/board/view?bno="+board.getBno();
	}
	
	
	@GetMapping("loginForm")
	public void loginForm() {
		
		
	}
	
	
}
