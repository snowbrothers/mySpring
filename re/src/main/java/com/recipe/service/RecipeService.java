package com.recipe.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.recipe.vo.IngredientsVo;
import com.recipe.vo.LikeVo;
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
	
	public int replyTotalCnt(int b_no);

	public IngredientsVo getIngredients(String i_name);
	
	public int like_Recipe(LikeVo likevo);

	public int photoTotalCnt(int b_no);

}
