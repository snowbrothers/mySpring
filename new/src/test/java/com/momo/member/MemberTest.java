package com.momo.member;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.momo.mapper.MemberMapper;
import com.momo.service.MemberService;
import com.momo.vo.Member;


import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class MemberTest {

	@Autowired
	MemberService memberService;
	
	@Autowired
	MemberMapper memberMapper;
	
	@Test
	public void testLogin() {
		
		Member member = new Member();
		member.setId("cat");
		member.setPw("1234");
		member.setName("나는야");
		member = memberMapper.login(member);
		
		assertNotNull(member);
		log.info(member);
		
	}
	
	@Test
	public void testInsert() {
		
		Member member = new Member();
		member.setId("admin");
		member.setPw("1234");
		member.setName("관리자");
		int res = memberMapper.insert(member);
		
		assertEquals(1, res);
		log.info(member);
		
	}
	
	@Test
	public void idCheck() {
		
		Member member = new Member();
		
		member.setId("caad");
		
		int res = memberMapper.idCheck(member);
		
		assertEquals(1, res);
		
	}
	
	@Test
	public void testGetMemberRole() {
		
		List<String> list = memberMapper.getMemberRole("admin");
		System.out.println("관리자 권한 : " + list.contains("ADMIN_ROLE"));
	}
}
