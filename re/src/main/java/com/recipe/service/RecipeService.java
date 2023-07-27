package com.recipe.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.recipe.vo.MaterialVo;
import com.recipe.vo.RecipeBoardVo;
import com.recipe.vo.RecipeReplyVo;
import com.recipe.vo.RecipeStepVo;

@Service
public interface RecipeService {

	public RecipeBoardVo getOne(int b_no);
	
	public List<MaterialVo> getMaterial(int b_no);
	
	public List<RecipeStepVo> getRecipeStep(int b_no);
	
	public List<RecipeReplyVo> getRecipeReply(int b_no);

}
