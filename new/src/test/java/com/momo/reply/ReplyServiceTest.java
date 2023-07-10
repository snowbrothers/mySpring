package com.momo.reply;

import static org.junit.Assert.assertNotNull;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.momo.service.ReplyService;
import com.momo.vo.ReplyVo;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReplyServiceTest {

	
	@Autowired
	ReplyService service;
	
	@Test
	public void test() {

		// ReplyMapper 가 정상적으로 주입되었는지 확인.
		assertNotNull(service);
		List<ReplyVo> list = service.getList(51);
		
		log.info("------------------------------");
		log.info("list : " + list);
		
		
		
		
	}
	
}
