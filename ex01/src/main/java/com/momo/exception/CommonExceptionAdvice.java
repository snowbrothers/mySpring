package com.momo.exception;

import org.springframework.http.HttpStatus;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.NoHandlerFoundException;

import lombok.extern.log4j.Log4j;

/**
 * root-context 에 component-scan을 패키지에 적용해야 빈으로 등록된다.
 * 
 * ControllerAdvice ) 
 * 	컨트롤러에 대한 예외를 처리하는 객체임을 명시
 * 	컨트롤러가 실행중 발생되는 오류, 500번 오류가 발생하는 경우 실행
 * 
 * ExceptionHandler )
 * 	Controller, RestController가 적용된  Bean내에서 발생하는 예외를 
 * 	하나의 메서드에서 처리해주는 기능수행
 * @author user
 *
 */

// 예외처리 컨트롤러 어노테이션
@ControllerAdvice
@Log4j
public class CommonExceptionAdvice {

	/**
	 * ExceptionHandler
	 * @param ex
	 * @param model
	 * @return
	 */
	@ExceptionHandler(Exception.class)
	public String except(Exception ex, Model model) {
		System.out.println("Exception......" + ex.getMessage());
		
		log.info("Exception.....");
		// 디버그 출력을 위해서 log4j.xml 파일의 레벨을 info -> debug 로 변경해주어야함.
		log.debug("디버그 테스트 + debug");
		log.error("에러테스트 + error");
		
		// 화면에 넘기고 싶을때 모델에 담으면됨.
		model.addAttribute("exception", ex);
		
		return "/error/error500"; 
			
	}
	
	@ExceptionHandler(NoHandlerFoundException.class)
	@ResponseStatus(HttpStatus.NOT_FOUND)
	public String handle404(NoHandlerFoundException ex) {
		
		return "/error/error404";
	}
}
