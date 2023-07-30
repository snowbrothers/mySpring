package com.recipe.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.recipe.service.FileuploadService;
import com.recipe.service.ReplyService;
import com.recipe.vo.RecipeReplyVo;

import lombok.extern.log4j.Log4j;

@RestController
@Log4j
public class ReplyController {

	@Autowired
	ReplyService service;
	
	@Autowired
	FileuploadService fileService;
	
	@GetMapping("/replyList/{bno}")
	public Map<String,Object> getRecipeList(@PathVariable("bno") int bno){
		
		
		System.out.println(" getRecipeList 호출 ========================================== ");
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		List<RecipeReplyVo> replyList = service.getRecipeReply(5);
		
		map.put("replyList", replyList);
		map.put("photoReview", fileService.getPhotoReview(5));
		
		return map;
	}
	
	@PostMapping("/reply/write")
	public Map<String, Object> insert(@RequestBody RecipeReplyVo vo) {

		System.out.println("insert 출력 =======================================================");
		
		log.info("============================== insert");
		log.info("replyVo : " + vo);
		
		Map<String, Object> map = new HashMap<String, Object>();

		try {

			int res = service.replyWrite(vo);

			map.put("result", "success");
			
			return map; 

		} catch (Exception e) {
			map.put("result", "fail");
			map.put("message", e.getMessage());

		}
		return map;
	}
}
