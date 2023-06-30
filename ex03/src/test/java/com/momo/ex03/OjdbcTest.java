package com.momo.ex03;

import static org.junit.Assert.assertNotNull;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.junit.Test;

public class OjdbcTest {

	@Test
	public void test() {
		
		String url = "jdbc:oracle:thin:@localhost:1521:orcl";
		String id = "library";
		String pw = "1234";
		
		String sql = "SELECT TO_CHAR(SYSDATE,'YYYY/MM/DD')||'일 입니다' FROM DUAL";
		
		try {
			
			// 클래스의 이름으로 클래스 로딩, 확인작업
			Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = DriverManager.getConnection(url,id,pw);
			
			System.out.println("커넥션 성공 ! ! !");
			PreparedStatement psmt = conn.prepareStatement(sql);
			ResultSet rs = psmt.executeQuery();
			
			if(rs.next()) {
				
				System.out.println(rs.getString(1));
				System.out.println("커넥션 : " + conn);
			}
			// 트랜잭션 처리를 위해 자동커밋을 false 로 설정한다.
			// -> 커넥션이 종료 되는 시점에 커밋
			
//			System.out.println("- 커넥션 성공 -");
			
			//if(!conn.isClosed()) conn.close();
		
			assertNotNull(conn);
		
			conn.setAutoCommit(false);
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
				System.err.println(e.getMessage());
			} catch (SQLException e) {
				
				System.err.println(e.getMessage());
				e.printStackTrace();
			}
		
		
	}
	
	
	
}
