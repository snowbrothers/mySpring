package com.momo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.momo.vo.BoardVO;
import com.momo.vo.Criteria;
import com.momo.vo.ReplyVo;

public interface BoardMapper {

	@Select("select * from tbl_board")
	public List<BoardVO> getList();

	public List<BoardVO> getListXml(Criteria cri);
	
	public int insert(BoardVO board);
	
	public int insertSelectKey(BoardVO board);
	
	public BoardVO getOne(int bno);
	
	public int delete(int bno);
	
	public int update(BoardVO board);
	
	public int getTotalCnt(Criteria cri);
	
	// 2개 이상의 매개변수를 받을 때는  @Param 어노테이션을 !꼭! 붙일것.
	public int updateReplyCnt(@Param("bno")int bno
								, @Param("amount") int amount);
}












