package com.momo.mapper;

import org.apache.ibatis.annotations.Select;

public interface SampleMapper {

	
		// 추상 메서드
		// 반환타입 이름()
		@Select("select sysdate from dual")
		String getTime();
		
		String getTime2();
}
