package com.momo.vo;

import lombok.Data;

@Data
public class Criteria {

	private String searchField; // 검색조건
	private String searchWord; // 검색어

	int pageNo = 1; // 요청페이지 번호
	int amount = 10; // 한페이지당 게시물 수

	int startNo = 1;
	int endNo = 10;
	
	
	
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
		if(pageNo>0) {
			endNo = pageNo * amount; // ex ) pageNo = 2 amount = 10 -> 2 * 10 = 20;
			startNo = pageNo * amount - (amount-1); // 
		}
	}
}
