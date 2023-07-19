package com.board.test;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.ui.Model;

import com.board.mapper.BoardMapper;
import com.board.service.BoardService;
import com.board.vo.BoardVo;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardListTest {

	@Autowired
	BoardMapper boardMapper;
	
	@Autowired
	BoardService boardService;
	
	@Test
	public void getList() {
		
		assertNotNull(boardMapper.getList());
	
	}
	
	@Test
	public void serviceGetList() {
		log.info("-----------------------------");
		log.info("----------- 리스트 출력 ===========");
		assertNotNull(boardService.getList());
		
		
	}
	
	@Test
	public void insertTest() {
		log.info("================== insert");
		
		BoardVo vo = new BoardVo();
		
		vo.setTitle("제목 테스트");
		vo.setContent("내용 테스트");
		vo.setWriter("작가 테스트");
		
		int res = boardMapper.insert(vo);
		
		assertEquals(res, 1);
		
		
		
	}
	
}
