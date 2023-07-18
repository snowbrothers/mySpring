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

import com.momo.mapper.FileuploadMapper;
import com.momo.vo.FileuploadVo;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class FileuploadTest {

	@Autowired
	FileuploadMapper fileuploadMapper;
	
	@Test
	public void insertTest() {
		
		FileuploadVo file = new FileuploadVo();
		
		UUID uuid = UUID.randomUUID();
		
		String uuid_ = uuid + "_";
		
		// uuid.toString() 문자열로 변환 가능
		log.info("insert() ==================================");
		file.setUuid(uuid_);
		file.setUploadpath("c:/upload");
		file.setFilename("이미지4.jpg");
		file.setFiletype("I");
		file.setBno(954);
		
		int res = fileuploadMapper.insert(file);
		
		
		assertEquals(1, res);
		
		
	}
	
	
	/**
	 * 리스트 출력 테스트
	 */
	@Test
	public void getList() {
		
		List<FileuploadVo> list = new ArrayList<FileuploadVo>();
		list = fileuploadMapper.getList(954);
		
		
		assertNotNull(list);
		
		
		
	}
}
