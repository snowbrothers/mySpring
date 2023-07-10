package com.momo.mapper;

import java.util.List;

import com.momo.vo.ReplyVo;

public interface ReplyMapper {

	// List 를 반환, 게시물의 번호를  파라메터로 받는다.
	public List<ReplyVo> getList(int bno);
	
	// insert, update, delete 는 int 타입 반환
	public int insert(ReplyVo vo);
	
	public int delete(int rno);
	
	public int update(ReplyVo vo);
	
}
