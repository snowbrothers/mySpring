package com.momo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.momo.mapper.FileuploadMapper;
import com.momo.vo.FileuploadVo;

@Service
public class FileuploadServiceImpl implements FileuploadService {

	@Autowired
	FileuploadMapper fileuploadMapper;
	
	@Override
	public int insert(FileuploadVo fileuploadVo) {
		
		
		return fileuploadMapper.insert(fileuploadVo);
	}

	@Override
	public List<FileuploadVo> getList(int bno) {
		
		
		return fileuploadMapper.getList(bno);
	}

	@Override
	public int delete(FileuploadVo fileuploadVo) {
		
		return fileuploadMapper.delete(fileuploadVo);
	}

}
