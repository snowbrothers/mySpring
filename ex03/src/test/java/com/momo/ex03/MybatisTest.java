package com.momo.ex03;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.momo.mapper.SampleMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml") // 설정관련파일 << 자바에 관련된 설정
public class MybatisTest {
	
		@Autowired
		SampleMapper sampleMapper;
	
		@Test
		public void test() {
			
			String time = sampleMapper.getTime();
			System.out.println("시간 : " + time);
			assertNotNull(time);
			
		}
		
		// XML 연동
		@Test
		public void test2() {
			
			String time = sampleMapper.getTime2();
			System.out.println("xml 연동 시간 : " + time);
			assertNotNull(time);
			
			
		}
}
