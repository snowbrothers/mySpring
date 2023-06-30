package com.momo.mapper;

import org.apache.ibatis.annotations.Select;

public interface SampleMapper {

		@Select("SELECT SYSDATE FROM DUAL")
		String getTime();
		
		String getTime3();
}
