package com.board.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.board.mapper.BoardMapper;
import com.board.vo.MemberVo;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	BoardMapper boardMapper;
	
	@Override
	public MemberVo login(MemberVo member) {
		
		
		return boardMapper.login(member);
	}

	
	
	
}
