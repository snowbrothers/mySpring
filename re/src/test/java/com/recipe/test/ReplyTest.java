package com.recipe.test;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.recipe.mapper.ReplyMapper;
import com.recipe.vo.RecipeReplyVo;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReplyTest {

	@Autowired
	ReplyMapper replyMapper;
	
	@Test
	public void replyList() {
		
		assertNotNull(replyMapper);
		replyMapper.getRecipeReply(5);
		
	}
	
	@Test
	public void replyWrite() {
		
		RecipeReplyVo vo = new RecipeReplyVo();
		
		vo.setB_no(5);
		vo.setReply("댓글 작성 테스트");
		vo.setWriter("testWriter");
		
		int res =replyMapper.replyWrite(vo);
		
		
		assertEquals(1, res);
		
	}
}
