package com.momo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.momo.mapper.MemberMapper;
import com.momo.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberMapper memberMapper;

	@Autowired
	BCryptPasswordEncoder encoder;
	
	@Override
	public Member login(Member paramMmeber) {

		// 사용자 정보 조회....
		
		Member member = memberMapper.login(paramMmeber);
		
		if(member != null) {
			// 사용자가 입력한 비밀번호가 일치하는지 확인
			// 사용자가 입력한 비밀번호, 데이터 베이스에 암호화 되어 저장된 비밀번호
			boolean res = encoder.matches(paramMmeber.getPw()
							, member.getPw());
			
			if(res) {
				
				return member;
			}
		}
		
		
		return null;
	}

	@Override
	public int insert(Member member) {
		
		// return 값이 1 보다 크면 id 등록된것.
		
		// 비밀번호 암호화.
		
		
		// 암호화 후 / 암호화 된 비밀번호를 다시 member 객체에 set
		member.setPw(encoder.encode(member.getPw()));
		
		return memberMapper.insert(member);
	}

	@Override
	public int idCheck(Member member) {
		
		// return 값이 1 보다 크면 id 중복체크 완료 ;
		
		return memberMapper.idCheck(member);
	}
}
