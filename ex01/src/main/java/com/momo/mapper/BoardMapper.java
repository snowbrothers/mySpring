package com.momo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.momo.vo.BoardVO;

public interface BoardMapper {
	
	// 추상 메서드는 구현부가 없이 선언만 해놓는다.
	@Select("Select * from tbl_board")
	public List<BoardVO> getList();
	
	public List<BoardVO> getListXml();
	
	// 등록
	public int insert(BoardVO board);
	
	public int insertSelectKey(BoardVO board);
	
	public BoardVO getOne(int bno);
	
	public int delete(int bno);
	
	public int update(BoardVO board);
	
	public int getTotalCnt();
}
