package com.momo.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.momo.vo.Member;

@Service
public interface MemberService {

	public Member login(Member member);
	
	public int insert(Member member);
	
	public int idCheck(Member member);

	public void naverLogin(HttpServletRequest request, Model model);
	
//	@Autowired
//	MemberDao dao;
//	
//	public Member login(Member paramMember, Model model) {
//		Member member = dao.login(paramMember);
//		if(member == null){
//			model.addAttribute("message", "아이디/비밀번호를 확인해주세요");
//		} else {
//			model.addAttribute("message", member.getName()+"님 환영합니다.");
//		}
//		return member;
//		
//	}
}
