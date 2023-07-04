package com.momo.board;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.momo.mapper.BoardMapper;
import com.momo.vo.BoardVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml") // 설정관련파일 << 자바에 관련된 설정
@Log4j
public class boardTest {

	@Autowired
	BoardMapper boardMapper;

	@Test
	public void getList() {

		// 객체를 정상적으로 주입 받았는지 확인.
		assertNotNull(boardMapper);

		List<BoardVO> list = boardMapper.getList();

		// 반복문임.
		list.forEach(board -> {

			log.info("boardVO==============");
			log.info(board.getBno());
			log.info(board.getTitle());
			log.info(board.getContent());

		});

	}

	@Test
	public void getListXml() {

		assertNotNull(boardMapper);

		List<BoardVO> list = boardMapper.getListXml();

		list.forEach(board -> {

			log.info("getListXml 출력 ==============");
			log.info(board.getBno());
			log.info(board.getTitle());
			log.info(board.getContent());

		});
	}

	@Test
	public void insert() {

		int res = 0;

		BoardVO board = new BoardVO();

		String title = "사오정";
		String content = "나아아방";
		String writer = "저팔계";

		board.setTitle(title);
		board.setContent(content);
		board.setWriter(writer);

		res = boardMapper.insert(board);

		assertEquals(res, 1);

	}
	
	@Test
	public void insertSelectKey() {

		BoardVO board = new BoardVO();

		board.setTitle("침하하");
		board.setContent("냉무");
		board.setWriter("빠니");

		int res = boardMapper.insertSelectKey(board);
		log.info("==============================================");
		log.info("bno : " + board.getBno());
		System.err.println("bno : " + board.getBno());
		
		assertEquals(res, 1);
	}
	
	@Test
	public void getOne() {
		
		assertNotNull(boardMapper);
		
		int bno = 10;
		
		BoardVO board = boardMapper.getOne(bno);
		
		log.info(board.getBno());
		log.info(board.getTitle());
		log.info(board.getContent());
		
		
		
	}
	
	@Test
	public void delete() {
		
		int res = boardMapper.delete(13);
		
		assertEquals(res , 1);
		
		System.err.println("1건 삭제되었습니다 .");
	}

	
	@Test
	public void update() {
		
		BoardVO board = new BoardVO();
		
		board.setBno(13);
		board.setTitle("제목변경");
		board.setContent("냉있변경");
		
		 int res = boardMapper.update(board);
		
		 assertEquals(res, 1);
		 System.err.println("1건 업데이트 되었습니다.");
		 
	}
	
	@Test
	public void getTotalCnt() {
		
		int res = boardMapper.getTotalCnt();
		log.info("TotalCnt : " + res );
	}
	
}
