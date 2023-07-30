package com.recipe.test;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.recipe.mapper.FileuploadMapper;
import com.recipe.service.FileuploadService;
import com.recipe.vo.FileuploadVo;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class FileuploadTest {

	@Autowired
	FileuploadMapper mapper;
	
	
		
	@Test
	public void getFileList() {
		
		assertNotNull(mapper);
		
		mapper.getFileList(5); 
	
//		log.info("===================================");
//		
//		for(FileuploadVo list : vo) {
//			
//			log.info(list.getUuid());
//			log.info(list.getFilename());
//			log.info(list.getFiletype());
//			log.info(list.getB_no());
		
		}
	
	@Test
	public void getRecipeFile() {
		
		assertNotNull(mapper);
		
		mapper.getRecipeStep(5);
	}
		
	
	@Test
	public void getPhotoReview() {
		
		assertNotNull(mapper);
		
		mapper.getPhotoReview(5);
		
	}
	
	@Test
	public void getIngredients() {
		
		assertNotNull(mapper);
		
		mapper.getIngredients(1);
		
	}
	
	// 성공
	@Test
	public void fileupload() {
		
		FileuploadVo vo = new FileuploadVo();
		
		vo.setUuid("두두둥");
		vo.setUploadpath("바밤바");
		vo.setB_no(5);
		vo.setR_no(5);
		vo.setSavePath("두둥");
		vo.setFiletype("R");
		vo.setFilename("임네일파");
		
		int res = mapper.insertFile(vo);
		
		assertEquals(1, res);
	}
	
	
	}
	

