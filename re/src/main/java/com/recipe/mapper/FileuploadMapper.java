package com.recipe.mapper;

import java.util.List;

import com.recipe.vo.FileuploadVo;

public interface FileuploadMapper {

	public List<FileuploadVo> getFileList(int bno);
	
	public List<FileuploadVo> getRecipeStep(int bno);
	
	public List<FileuploadVo> getPhotoReview(int bno);
	
}
