package com.momo.mapper;

import java.util.List;

import com.momo.vo.FileuploadVo;

public interface FileuploadMapper {

	public List<FileuploadVo> getList(int bno);

	public int insert(FileuploadVo fileuploadVo);
	
	public int delete(FileuploadVo fileuploadVo);
}
