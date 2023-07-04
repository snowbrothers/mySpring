package com.momo.board;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.momo.service.BoardService;
import com.momo.vo.BoardVO;

import lombok.extern.log4j.Log4j;

// 스프링 실행 어노테이션
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml") // 설정관련파일 << 자바에 관련된 설정
@Log4j
public class BoardServiceTest {

	@Autowired
	BoardService boardService;
	
	@Test
	public void getListXml() {
		
		List<BoardVO> list = boardService.getListXml();
		
		
		list.forEach(board ->{
			
			log.info(board);
			
		});
		
		
	}
	
}
