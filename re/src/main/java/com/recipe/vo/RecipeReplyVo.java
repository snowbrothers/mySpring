package com.recipe.vo;

import lombok.Data;

@Data
public class RecipeReplyVo {

	
	private int r_no;
	private String replydate;
	private String reply;
	// bno 주의
	private int bno;
	private String writer;
	private int star;
	
}
