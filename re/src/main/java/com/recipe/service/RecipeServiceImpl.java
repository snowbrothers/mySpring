package com.recipe.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.recipe.mapper.RecipeMapper;
import com.recipe.vo.IngredientsVo;
import com.recipe.vo.LikeVo;
import com.recipe.vo.MaterialVo;
import com.recipe.vo.RecipeBoardVo;
import com.recipe.vo.RecipeReplyVo;
import com.recipe.vo.RecipeStepVo;

@Service
public class RecipeServiceImpl implements RecipeService{

		
	@Autowired 
	RecipeMapper mapper;

	@Override
	public RecipeBoardVo getOne(int b_no) {
		// TODO Auto-generated method stub
		return mapper.getOne(b_no);
	}

	@Override
	public List<MaterialVo> getMaterial(int b_no) {
		// TODO Auto-generated method stub
		return mapper.getMaterial(b_no);
	}

	@Override
	public List<RecipeStepVo> getRecipeStep(int b_no) {
		// TODO Auto-generated method stub
		return mapper.getRecipeStep(b_no);
	}

	@Override
	public List<RecipeReplyVo> getRecipeReply(int b_no) {
		// TODO Auto-generated method stub
		return mapper.getRecipeReply(b_no);
	}

	@Override
	public int replyTotalCnt(int b_no) {
		// TODO Auto-generated method stub
		return mapper.replyTotalCnt(b_no);
	}

	@Override
	public IngredientsVo getIngredients(int i_no) {
		// TODO Auto-generated method stub
		return mapper.getIngredients(i_no);
	}

	@Override
	public int like_Recipe(LikeVo likevo) {
		// TODO Auto-generated method stub
		return mapper.like_Recipe(likevo);
	}

	

	
	
	
	
}
