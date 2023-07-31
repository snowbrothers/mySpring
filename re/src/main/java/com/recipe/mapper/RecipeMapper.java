package com.recipe.mapper;

import java.util.List;

import com.recipe.vo.IngredientsVo;
import com.recipe.vo.LikeVo;
import com.recipe.vo.MaterialVo;
import com.recipe.vo.RecipeBoardVo;
import com.recipe.vo.RecipeReplyVo;
import com.recipe.vo.RecipeStepVo;

public interface RecipeMapper {

	// 레시피 리스트
	public RecipeBoardVo getOne(int b_no);
	
	// 필요 재료 정보
	public List<MaterialVo> getMaterial(int b_no);
	
	// 순수 재료 정보 
	public IngredientsVo getIngredients(String i_name);
	
	public List<RecipeStepVo> getRecipeStep(int b_no);
	
	public List<RecipeReplyVo> getRecipeReply(int b_no);
	
	public int replyTotalCnt(int b_no);
	
	public int like_Recipe(LikeVo likevo);
	
	
}
