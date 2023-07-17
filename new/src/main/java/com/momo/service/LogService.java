package com.momo.service;

import org.springframework.stereotype.Service;

import com.momo.vo.LogVo;

@Service
public interface LogService {

	
	int insert(LogVo vo);
}
