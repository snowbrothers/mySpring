package com.recipe.service;

import org.springframework.stereotype.Service;

import com.recipe.vo.MaterialVo;
import com.recipe.vo.RecipeBoardVo;

@Service
public interface RecipeService {

	public RecipeBoardVo getOne(int b_no);
	
	public MaterialVo getMaterial(int b_no);
	

}
