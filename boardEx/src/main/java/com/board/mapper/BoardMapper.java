package com.board.mapper;

import java.util.List;

import com.board.vo.BoardVo;
import com.board.vo.MemberVo;

public interface BoardMapper {

	
	public MemberVo login(MemberVo member);
	
	public List<BoardVo> getList();
	
	public int insert(BoardVo vo);
	
	public int delete(int bno);
}
