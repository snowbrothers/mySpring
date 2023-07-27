package com.recipe.test;

import static org.junit.Assert.assertNotNull;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.recipe.mapper.RecipeMapper;
import com.recipe.test.RecipeBoardTest;
import com.recipe.vo.IngredientsVo;
import com.recipe.vo.MaterialVo;
import com.recipe.vo.RecipeBoardVo;
import com.recipe.vo.RecipeReplyVo;
import com.recipe.vo.RecipeStepVo;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class RecipeBoardTest {
	
	@Autowired
	RecipeMapper mapper;
	
	@Test
	public void getOne() {
		
		
		assertNotNull(mapper);
		
		RecipeBoardVo vo = new RecipeBoardVo();
		
		vo = mapper.getOne(3);
		
		log.info("==================================");
		log.info(vo);
	}
	
	
	
	@Test
	public void getMaterial() {
		
		assertNotNull(mapper);
		List<MaterialVo> material = mapper.getMaterial(5);
		
		log.info("==================================");
		log.info(material);
	}
	
	@Test
	public void getRecipeStep() {
		
		assertNotNull(mapper);
		
		List<RecipeStepVo> step = mapper.getRecipeStep(5);
		
		log.info(step);
		
	}
	
	@Test
	public void getReplyList() {
		
		assertNotNull(mapper);
		
		List<RecipeReplyVo> replyList = mapper.getRecipeReply(5);
		
		log.info(replyList);
	}
	
	@Test
	public void replyTotalCnt() {
		
		assertNotNull(mapper);
		
		int res = mapper.replyTotalCnt(5);
		
	}
	
	@Test
	public void getIngredient() {
		
		assertNotNull(mapper);
		
		IngredientsVo vo = mapper.getIngredients(1);
		
		
	}

}
