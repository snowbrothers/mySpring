package com.momo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.stereotype.Component;

import com.momo.vo.Member;



@Component
public class MemberDao {

	public Member login(Member paramMember) {
		
		Member member = null;
		
		String sql = 
				"select * from member "
				+ "where id=? and pw=?";
		
		System.out.println("쿼리실행 ===================== "+sql);
		System.out.println("아이디"+paramMember.getId());
		System.out.println("비밀"+paramMember.getPw());
		// 리소스/자원을 자동 반환(close())
		try (Connection con = ConnectionUtil.getConnection();
				PreparedStatement psmt = con.prepareStatement(sql);
				
				) {
			
			psmt.setString(1, paramMember.getId());
			psmt.setString(2, paramMember.getPw());
			
			ResultSet rs = psmt.executeQuery();
			
			
			// 아이디/비밀번호가 일치 하는 회원이 있으면 조회
			if(rs.next()) {
				
				String name = rs.getString("name");
			
				member = new Member();
				
				member.setId(paramMember.getId());
				member.setName(name);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return member;
		
		
		
	}
	
	
}
