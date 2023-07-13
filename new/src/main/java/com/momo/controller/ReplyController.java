package com.momo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.momo.service.ReplyService;
import com.momo.vo.Criteria;
import com.momo.vo.PageDto;
import com.momo.vo.ReplyVo;

import lombok.extern.log4j.Log4j;

// @Controller
/**
 * RestController - Controller가 Rest 방식을 처리하기 위한 것임을 명시 합니다.
 * 
 * @author user
 *
 */
@RestController
@Log4j
public class ReplyController extends CommonRestController {

	@Autowired
	ReplyService service;

	@GetMapping("/test")
	public String test() {

		return "test";
	}

	@GetMapping("/reply/NewList/{bno}/{page}")
	public Map<String, Object> NewGetList(@PathVariable("bno") int bno, @PathVariable("page") int page) {

		log.info("bno : " + bno);

		Criteria cri = new Criteria();
		cri.setPageNo(page);

		// 페이지 처리(시작번호 ~ 끝번호)
		List<ReplyVo> list = service.NewGetList(bno, cri);
		int totalCnt = service.totalCnt(bno);
		// 페이지 블럭 생성
		PageDto pageDto = new PageDto(cri, totalCnt);

//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("list", list);
//		map.put("pageDto", pageDto);
//
//		System.err.println("실행 ================================ Controller");
//
//		return map;
		
		return responseListMap(list, pageDto);
	}

	/**
	 * PathVariable URL 경로에 있는 값을 파라메터로 추출하려고 할 때 사용한다.
	 * 
	 * URL 경로의 일부를 변수로 사용.
	 * 
	 * @return
	 */
	@GetMapping("/reply/list/{bno}")
	public List<ReplyVo> getList(@PathVariable("bno") int bno) {

		log.info("bno : " + bno);
		return service.getList(bno);

	}

	/**
	 * RequestBody JSON 데이터를 원하는 타입으로 바인딩 처리
	 * 
	 * JSON 형식의 문자열을 받음 -> 내가 원하는 타입의 객체에 저장 가능 ^^v
	 * 
	 * @param vo
	 * @return
	 */
	@PostMapping("/reply/insert")
	public Map<String, Object> insert(@RequestBody ReplyVo vo) {

		log.info("============================== insert");
		log.info("replyVo : " + vo);
		Map<String, Object> map = new HashMap<String, Object>();

		try {

			int res = service.insert(vo);

			return map = responseWriteMap(res);

		} catch (Exception e) {
			map.put("result", "fail");
			map.put("message", e.getMessage());

		}
		return map;
	}

	// 삭제 ~
	@GetMapping("/reply/delete/{rno}")
	public Map<String, Object> delete(@PathVariable int rno) {

//		Map<String, Object> map = new HashMap<String, Object>();
//
//		int res = service.delete(rno);
//
//		
//		
//		if (res > 0) {
//
//			map.put("result", "success");
//
//		} else {
//			map.put("result", "fail");
//			map.put("message", "댓글 삭제중 예외 발생");
//		}
//
//		return map;

		return responseDeleteeMap(service.delete(rno));
	}

	@PostMapping("/reply/update")
	public Map<String, Object> update(@RequestBody ReplyVo vo) {

		// Map<String, Object> map = new HashMap<String, Object>();
		// int res = service.update(vo);

//		if (res > 0) {
//
//			map.put("result", "success");
//
//		} else {
//			map.put("result", "fail");
//			map.put("message", "댓글 수정중 예외 발생");
//		}

		return responseEditMap(service.update(vo));

	}

//	/**
//	 * 입력, 수정, 삭제의 경우 int 값을 반환
//	 * 결과를 받아서 Map을 생성 후 반환 합니다.
//	 * @return
//	 */
//	// map을 생성 후 result, msg 세팅
//	public Map<String, Object> responseMap(int res, String msg){
//		
//		Map<String, Object> map = new HashMap<String, Object>();
//		
//		if(res >0) {
//			
//			map.put("result","success");
//			map.put("msg", msg +"되었습니다.");
//			
//		}else {
//
//			map.put("result", "fail");
//			map.put("msg", msg +"중 예외 발생.");
//		}
//	
//		return map;
//		
//		
//	}

}