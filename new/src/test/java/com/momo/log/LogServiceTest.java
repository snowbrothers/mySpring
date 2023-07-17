package com.momo.log;

import static org.junit.Assert.assertEquals;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.momo.service.LogService;
import com.momo.vo.LogVo;

import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class LogServiceTest {

	@Autowired
	LogService logService;
	
	@Test
	public void test() {
		
		
		LogVo vo = new LogVo();
		
		vo.setClassname("ClassName");
		vo.setMethodname("MethodName");
		vo.setParams("Params");
		vo.setErrmsg("오류!");
		int res = logService.insert(vo);
		
		assertEquals(1, res);
		
		
	}
	
}
