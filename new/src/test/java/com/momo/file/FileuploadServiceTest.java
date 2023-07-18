package com.momo.file;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.momo.service.FileuploadService;
import com.momo.vo.FileuploadVo;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class FileuploadServiceTest {

	@Autowired
	FileuploadService fileuploadService;
	
		@Test
		public void insertTest() {
			
			FileuploadVo file = new FileuploadVo();
			
			UUID uuid = UUID.randomUUID();
			
			String uuid_ = uuid + "_";
			
			FileuploadVo fileuploadVo = new FileuploadVo();
			
			fileuploadVo.setUuid(uuid_);
			fileuploadVo.setUploadpath("c:/upload/");
			fileuploadVo.setFilename("서비스테스트_이미지");
			fileuploadVo.setFiletype("T");
			fileuploadVo.setBno(81);
			
			int res = fileuploadService.insert(fileuploadVo);
			
			assertEquals(1, res);
			
			
		}
		
		/**
		 * 리스트 출력 테스트
		 */
		@Test
		public void getList() {
			
			List<FileuploadVo> list = new ArrayList<FileuploadVo>();
			list = fileuploadService.getList(954);
			
			
			assertNotNull(list);
			
			
			
		}
		
		
	
}
