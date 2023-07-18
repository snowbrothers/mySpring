package com.momo.vo;

import java.util.List;

import lombok.Data;

@Data
public class BoardVO {
	 
	private int bno;
	private String title;
	private String content;
	private String writer;
	private String regDate;
	private String updateDate;
	
//	private List<FileuploadVo> attachList;
}
