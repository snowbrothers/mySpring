package com.recipe.test;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.recipe.service.FileuploadService;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class FileServiceTest {

	
	@Autowired
	FileuploadService service;
	
	@Test
	public void FileSerivceTest() {
		
		assertNotNull(service);
		
		service.getFileList(5);
		
	}
	
	@Test
	public void getIngredients() {
		
		assertNotNull(service);
		
		service.getIngredients(1);
	}
}
