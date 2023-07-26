package com.recipe.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.recipe.mapper.RecipeMapper;
import com.recipe.vo.MaterialVo;
import com.recipe.vo.RecipeBoardVo;

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
	public MaterialVo getMaterial(int b_no) {
		// TODO Auto-generated method stub
		return mapper.getMaterial(b_no);
	}
	
	
	
	
}
