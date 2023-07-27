package com.recipe.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.recipe.service.RecipeService;
import com.recipe.vo.MaterialVo;
import com.recipe.vo.RecipeBoardVo;
import com.recipe.vo.RecipeReplyVo;
import com.recipe.vo.RecipeStepVo;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/recipe/*")
@Log4j
public class RecipeController {

	@Autowired
	RecipeService service;
	
	/**
	 * 레시피 리스트에서 항목 클릭 시 상세 페이지로 이동 될 수 있도록 매핑
	 * list 에서 항목을 클릭하면 b_no 를 파라메터로 수집하여 
	 * b_no 을 활용해 테이블에서 게시글에대한 정보를 조회한다.
	 * 
	 * 	model 을 사용해 view 페이지에 데이터를 넘겨 줄 수 있도록 한다.
	 * 
	 * 
	 * @param model
	 * @param paramVo
	 */
	@GetMapping("view")
	public void RecipeView(Model model
						, RecipeBoardVo paramVo) {

		// 파라메터로 수집한 bno 를 변수에 저장 
		int b_no = paramVo.getB_no();
		
		// 데이터가 잘 넘어왔는지 확인
		log.info("============== bno " + b_no); 
		
		// b_no 를 활용해 데이터 베이스에서 게시글 정보 조회 // 우선 5으로 설정 해둠 수정해야함
		RecipeBoardVo vo =  service.getOne(5);
		
		// 객체 정보가 넘어온다..
		//service.getMaterial(5);
		
		
		// 재료 정보 조회
		
		
		
		
		// key, value 로 이루어진 model 객체를 사용해 /recipe/view 페이지에 데이터 전달.
		model.addAttribute("board", vo);
		
		
	}
	
	
	@GetMapping("material/{bno}")
	public @ResponseBody Map<String, Object> getMaterial(@PathVariable("bno") int bno){
		
		System.out.println(" getMaterial 호출 ========================================== ");
		
		Map<String, Object> map = new HashMap<String, Object>();
		List<MaterialVo> material = service.getMaterial(5);
		
		map.put("materialList", material);
		
		return map;
		
	}
	
	@GetMapping("recipeStep/{bno}")
	public @ResponseBody Map<String,Object> getRecipeStep(@PathVariable("bno") int bno){
		
		
		System.out.println(" getRecipeStep 호출 ========================================== ");
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		List<RecipeStepVo> step = service.getRecipeStep(5);
		
		map.put("recipeStep", step);
		
		return map;
	}
	
	
	@GetMapping("replyList/{bno}")
	public @ResponseBody Map<String,Object> getRecipeList(@PathVariable("bno") int bno){
		
		
		System.out.println(" getRecipeList 호출 ========================================== ");
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		List<RecipeReplyVo> replyList = service.getRecipeReply(5);
		
		map.put("replyList", replyList);
		
		return map;
	}
	
	
	
	
}
