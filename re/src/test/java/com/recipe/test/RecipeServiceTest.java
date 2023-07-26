package com.recipe.test;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.recipe.service.RecipeService;
import com.recipe.vo.RecipeBoardVo;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class RecipeServiceTest {

	@Autowired
	RecipeService service;
	
	@Test
	public void getOne() {
		
		
		RecipeBoardVo vo =  service.getOne(3);
		
		log.info(vo);
		
		assertNotNull(service);
	}
}
