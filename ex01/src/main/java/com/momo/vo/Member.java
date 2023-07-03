package com.momo.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;


/**
 * Lombok get, set, equesls, toString 자동생성
 * @author user
 * 
 * Data 어노테이션
 * IDE 설치 후 롬복라이브러리 추가 후 사용가능
 *
 */

// 롬복 기능 사용하기위한 어노테이션
@Data
public class Member {
	
	String id;
	String pw;
	String name;
	int age;

	// Outline 을 확인해보면  set, get 메서드가 자동생성 되어있음.
	@DateTimeFormat(pattern= "yyyy/MM/dd")
	private Date dueDate;
	
}
