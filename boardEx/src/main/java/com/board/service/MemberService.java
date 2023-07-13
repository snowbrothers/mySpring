package com.board.service;

import org.springframework.stereotype.Service;

import com.board.vo.MemberVo;

@Service
public interface MemberService {

	public MemberVo login(MemberVo member);
	
}
