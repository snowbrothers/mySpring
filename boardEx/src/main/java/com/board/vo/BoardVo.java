package com.board.vo;

import lombok.Data;


// get / set 메서드 자동생성 
@Data
public class BoardVo {

	private int bno;
	private String title;
	private String content;
	private String writer;
	private String regdate;
	private String updatedate;
	
}
