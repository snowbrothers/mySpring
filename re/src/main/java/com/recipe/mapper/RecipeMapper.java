package com.recipe.mapper;

import java.util.List;

import com.recipe.vo.IngredientsVo;
import com.recipe.vo.MaterialVo;
import com.recipe.vo.RecipeBoardVo;

public interface RecipeMapper {

	// 레시피 리스트
	public RecipeBoardVo getOne(int b_no);
	
	// 필요 재료 정보
	public MaterialVo getMaterial(int b_no);
	
	// 순수 재료 정보 
	public IngredientsVo getIngredients(List<IngredientsVo> i_no);
}
