package com.momo.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.momo.vo.FileuploadVo;

@Service
public interface FileuploadService {

	
	public List<FileuploadVo> getList(int bno);
	
	public int insert(FileuploadVo fileuploadVo);
	
	public int delete(FileuploadVo fileuploadVo);
}
