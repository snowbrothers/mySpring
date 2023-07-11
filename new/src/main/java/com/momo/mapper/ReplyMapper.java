package com.momo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.momo.vo.Criteria;
import com.momo.vo.ReplyVo;

public interface ReplyMapper {

	// List 를 반환, 게시물의 번호를  파라메터로 받는다.
	public List<ReplyVo> getList(int bno);
	
	// 페이징처리 추가..
	// 매개변수 2개 이상부터 잘 못알아 먹기 때문에 알려줘야함
	
	/**
	 * 매개변수가 2개 이상 파라메터로 전달 되는 경우
	 * 	Param 어노테이션을 사용
	 * 	//@Param(value="이름") [타입] [변수명]
	 * @param bno
	 * @param cri
	 * @return
	 */
	public List<ReplyVo> NewGetList(@Param(value="bno") int bno
									,@Param(value="cri") Criteria cri);
	
	// insert, update, delete 는 int 타입 반환
	public int insert(ReplyVo vo);
	
	public int delete(int rno);
	
	public int update(ReplyVo vo);
	
	// 총건수 조회
	public int totalCnt(int bno);
	
}
