package com.recipe.vo;

import lombok.Data;

/**
 * 회원정보를 담고 있는 객체
 * @author 이한규
 *
 */
@Data
public class MemberVo {

	private int mno;
	private String email;
	private String pw;
	private String name;
	private String nickname;
	private String pnum;
	private String reg_date;
	private String grade;
	private String delyn;
	
	
}
