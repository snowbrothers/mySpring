package com.momo.mapper;

import org.apache.ibatis.annotations.Select;

public interface SampleMapper {

		// 추상메서드
		@Select("SELECT SYSDATE FROM DUAL")
		String getTime(); // 내가 지어주는 이름
		
		
		String getTime2(); // xml 연동
}
