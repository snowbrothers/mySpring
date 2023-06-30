package com.momo.vo;

import lombok.Data;

// 롬복 기능 사용하기위한 어노테이션
@Data
public class Member {
	
	String id;
	String pw;
	String name;

	// Outline 을 확인해보면  set, get 메서드가 자동생성 되어있음.
	
}
