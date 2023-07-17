package com.momo.reply;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.momo.mapper.ReplyMapper;
import com.momo.vo.Criteria;
import com.momo.vo.ReplyVo;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReplyMapperTest {

	@Autowired
	ReplyMapper mapper;
	
	@Test
	public void test() {

		// ReplyMapper 가 정상적으로 주입되었는지 확인.
		assertNotNull(mapper);
		List<ReplyVo> list = mapper.getList(51);
		
		log.info("------------------------------");
		log.info("list : " + list);
		
		
		
		
	}
	
	@Test
	public void insertTest(){
		
		ReplyVo vo = new ReplyVo();
		
		vo.setBno(51);
		vo.setReply("댓글달기달기");
		vo.setReplyer("작성자");
		
		int res = mapper.insert(vo);
		
		assertEquals(res, 1);
		
	}
	
	@Test
	public void deleteTest() {
		
		int rno = 12;
		int res = mapper.delete(rno);
	
		// 검증
		assertEquals(res, 1);
		
	}
	
	@Test
	public void updateTest() {
		ReplyVo vo = new ReplyVo();
		
		vo.setRno(16);
		vo.setReply("댓글 수정");
		vo.setReplyer("수정 작성자");
		
		int res = mapper.update(vo);
		
		assertEquals(res, 1);
		
	}
	
	@Test
	public void NewGetList() {
		
		// ReplyMapper 가 정상적으로 주입되었는지 확인.
				assertNotNull(mapper);
				Criteria cri = new Criteria();
				cri.setAmount(5);
				cri.setPageNo(1);
				
				List<ReplyVo> list = mapper.NewGetList(51, cri);
				
				log.info("------------------------------");
				log.info("list : " + list);
		
	}
	
	@Test
	public void totalCnt() {
		
		int res = mapper.totalCnt(51);
		
		
		log.info("--------------------");
		log.info("total : " + res);
		
		
	}
	
	
}
