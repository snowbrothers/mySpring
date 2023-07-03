package com.momo.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.momo.vo.Member;
import com.momo.vo.MemberList;

/**
 * 1. 톰캣서버 실행 -> web.xml 파일 설정읽어 서버 실행
 * web.xml 파일에 기술된 
 * 
 * 2. servlet-context.xml 의 scan 에 등록된 클래스 조사..
 * 어노테이션들을 가진 클래스를 객체로 생성 후 관리

 * 
 * @Controller 
 * 해당 클래스의 인스턴스를 스프링 빈으로 등록하고 컨트롤러로 사용
 * @author user
 *
 */


@Controller
@RequestMapping("/mapping/*") // mapping 에 대한 모든 경로 
public class MappingController {
	
	/**
	 * RequestMapping )
	 *  클래스 상단에 적용시 현재 클래스의 모든 메서드들의 기본 URL 경로 지정
	 *  메서드 상단에 적용시 메서드  URL 경로 지정
	 *  
	 *  get, post 방식을 모두 처리하고자 할때 배열로 받을 수 있음
	 */
	
	
	/**
	 * value : URL
	 * @return
	 */
	@RequestMapping(value="/",method=RequestMethod.GET)
	public String requestMapping() {
		
		
		return "mapping";
	}
	
	/**
	 *	/mapping/requestMapping URI를 GET메서드로 호출하면 해당 메서드가 실행 됩니다.
	 * @return
	 */
	@RequestMapping(value="/requestMapping", method= {RequestMethod.GET, RequestMethod.POST})
	public String requestMapping2() {
		
		
		System.out.println("requestMapping2 실행 =========================");
		
		return "mapping";
	}
	
	
	/**
	 * GetMapping
	 * 	get 방식의 요청 처리
	 * 
	 * 파라메터 자동수집
	 * VO 객체 지정 시, 객체를 생성 후 파라메터를 name속성과 일치하는 필드에 세팅,
	 * 단, 타입 불일치 시 400오류 발생
	 *  
	 *  RequestParam 어노테이션 : 
	 *  	기본타입의 데이터를 지정한 타입으로 받을 수 있다.
	 * 
	 * @return
	 */
	@GetMapping("/getMapping")
	public String getMapping(@RequestParam("name") String name
							, @RequestParam("age") int age
							, Model model) {
		
		
		model.addAttribute("name", name);
		model.addAttribute("age", age);
		
		System.out.println("이름출력 : "+name);
		System.out.println("나이 출력 : " + age);
		
		return "mapping";
	} 
	
	/*
	 * 파라메터 자동수집 ..
	 *  파라메터를  VO, DTO 에 수집한 경우, 별도의 저장없이 화면까지 전달.
	 *  
	 *  Model객체를 매개변수로 받아 속성을 추가한다.
	 *  model.addAttribute("이름",값)
	 */
	@GetMapping("getMappingVO")
	public String getMappingVO(Member member
						,Model model) {
		
		model.addAttribute("message","파라메터 자동수집 ! ! !");
		return "mapping";
	}
	
	/**
	 * 같은 이름으로 여러개의 값이 들어왔을 때
	 * 배열, 혹은 리스트에 담아 출력 가능
	 * @param ids
	 * @return
	 */
	@GetMapping("getMappingArr")
	public String getMappingArr(@RequestParam("ids") String[] ids) {
		
		for(String id : ids) {
			
			System.out.println("ids : " + id);
		}
		
		
		return "mapping";
	}
	
	/**
	 * 같은 이름으로 여러개의 값이 들어왔을 때
	 * 배열, 혹은 리스트에 담아 출력 가능
	 * @param ids
	 * @return
	 */
	@GetMapping("getMappingList")
	public String getMappingList(@RequestParam("ids") List<String> ids) {
		
		
		/**
		 * ForEach : 익명의 함수를 이용한 컬렉션의 반복처리
		 * collection.forEach(변수 -> 반복처리(변수))
		 */
		
		ids.forEach(id -> {
			System.out.println("List_ids : " + id);
		});
		
		
		return "mapping";
	}
	
	@GetMapping("getMappingMemberList")
	public String getMappingMemberList(MemberList list) {
		
		System.out.println(list);
		
		return "mapping";
	}
	
	
}
