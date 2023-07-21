package com.momo.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.momo.vo.FileuploadVo;

@Service
public interface FileuploadService {

	
	public List<FileuploadVo> getList(int bno);
	
	public int insert(FileuploadVo fileuploadVo);
	
	public int delete(int bno, String uuid);
	
	public int fileupload(List<MultipartFile> files, int bno) throws Exception;
	
	public FileuploadVo getOne(@Param("bno") int bno
			,@Param("uuid") String uuid);
}
