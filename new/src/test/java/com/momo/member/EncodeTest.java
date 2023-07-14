package com.momo.member;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class EncodeTest {

	/**
	 *  비밀번호 암호화 )
	 *  
	 *   1. 프로그램에서 암호화 처리
	 *   2. 데이터베이스에서 암호화 처리
	 */
	
	/**
	 *  스프링 시큐리티모듈에서 제공하는 비밀번호 암호화 및 인증 기능
	 * 	( Spring Security) 에서 제공하는 비밀번호를 암호화 하는데 사용 할 수 있는 기능을 가진 메서드..
	 * 
	 * 	pom.xml 에  dependency 추가..
	 * 
	 */
	BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
	
	@Test
	public void test() {
		
		String pw = "안녕하세요";
		
		for(int i=0; i<10; i++) {
			
			String encodePw = encoder.encode(pw);
			System.out.println("암호화된 문자열 : " + encodePw);
			
			
			// 첫번째 매개변수는 일치 여부를 확인하고자 하는 인코딩 되지 않은 패스워드
			// 두번째 매개변수는 인코딩 된 패스워드를 입력합니다.
			boolean matches = encoder.matches(pw, encodePw);
			System.out.println("인증 결과 : " + matches);
			
		}
		
		
	}
}
