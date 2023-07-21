package com.momo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.momo.vo.FileuploadVo;

public interface FileuploadMapper {

	public List<FileuploadVo> getList(int bno);

	public int insert(FileuploadVo fileuploadVo);
	
	public int delete(@Param("bno")int bno
								,  @Param("uuid") String uuid);
	
	public FileuploadVo getOne(@Param("bno") int bno
								,@Param("uuid") String uuid);
	
}
