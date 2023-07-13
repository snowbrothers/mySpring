package com.board.member;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.board.mapper.BoardMapper;
import com.board.member.MemberTest;
import com.board.vo.MemberVo;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MemberTest {
	
	@Autowired
	BoardMapper boardMapper;

	
	@Test
	public void login() {
	MemberVo memberVo = new MemberVo();	
	
	
	memberVo.setId("cat");
	memberVo.setPw("1234");
	
	boardMapper.login(memberVo);
	
	assertNotNull(boardMapper.login(memberVo));
	
	
	}
	
}
