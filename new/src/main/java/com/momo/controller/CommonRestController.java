package com.momo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.momo.vo.PageDto;
import com.momo.vo.ReplyVo;


public class CommonRestController {
	
	private final String REST_WRITE ="등록";
	private final String REST_EDIT ="수정";
	private final String REST_DELETE ="삭제";
	private final String REST_SELECT ="아침조회";
	
	
	
	
	/**
	 * 입력, 수정, 삭제의 경우 int 값을 반환
	 * 결과를 받아서 Map을 생성 후 반환 합니다.
	 * @return
	 */
	// map을 생성 후 result, msg 세팅
	public Map<String, Object> responseMap(int res, String msg){
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(res >0) {
			
			map.put("result","success");
			map.put("msg", msg +"되었습니다.");
			
		}else {

			map.put("result", "fail");
			map.put("msg", msg +"중 예외 발생.");
		}
	
		return map;
		
		
	}
	
	public Map<String, Object> responseWriteMap(int res){
		
		return responseMap(res, REST_WRITE);
	}
	public Map<String, Object> responseEditMap(int res){
		
		return responseMap(res, REST_EDIT);
	}
	
	public Map<String, Object> responseDeleteeMap(int res){
		
		return responseMap(res, REST_DELETE);
	}
	
	public Map<String, Object> responseListMap(List<?> list
												,PageDto dto){
		
		// list 가 null 이 아니면 res 값은 1 
		
		int res = list !=null? 1 : 0;
		
		Map<String, Object> map= responseMap(res,REST_SELECT);
		map.put("list", list);
		map.put("pageDto", dto);
		
		return map;
	}
	

	
}
