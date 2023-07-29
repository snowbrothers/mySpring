package com.recipe.mapper;

import java.util.List;

import com.recipe.vo.FileuploadVo;

public interface FileuploadMapper {

	public List<FileuploadVo> getFileList(int bno);
	
	public List<FileuploadVo> getRecipeStep(int bno);
	
	public List<FileuploadVo> getPhotoReview(int bno);
	
	public FileuploadVo getIngredients(int i_no);
	
	// 파일 업로드
	public int insertFile(FileuploadVo vo);
	
}
