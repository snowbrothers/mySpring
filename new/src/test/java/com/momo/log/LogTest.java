package com.momo.log;

import static org.junit.Assert.assertEquals;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.momo.mapper.LogMapper;
import com.momo.vo.LogVo;

import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class LogTest {

	@Autowired
	LogMapper logMapper;
	
	@Test
	public void insert() {
		
		int res = 0;
		
		LogVo logVo = new LogVo();
		logVo.setClassname("LogMapper");
		logVo.setMethodname("insert");
		logVo.setParams("Vo");
		logVo.setErrmsg("오류발생");
		res = logMapper.insert(logVo);
		
		assertEquals(1, res);
		
		
		
	}
}
