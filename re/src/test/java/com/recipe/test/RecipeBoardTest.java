package com.recipe.test;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.recipe.mapper.RecipeMapper;
import com.recipe.test.RecipeBoardTest;
import com.recipe.vo.MaterialVo;
import com.recipe.vo.RecipeBoardVo;

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
		MaterialVo material = mapper.getMaterial(5);
		
		log.info("==================================");
		log.info(material);
	}

}
