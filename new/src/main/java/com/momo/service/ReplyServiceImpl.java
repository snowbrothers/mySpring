package com.momo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.momo.mapper.BoardMapper;
import com.momo.mapper.ReplyMapper;
import com.momo.vo.Criteria;
import com.momo.vo.ReplyVo;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	ReplyMapper replyMapper;
	
	@Autowired
	BoardMapper boardMapper;
	
	@Override
	public List<ReplyVo> getList(int bno) {
		// TODO Auto-generated method stub
		return replyMapper.getList(bno);
	}

	
	/**
	 * Transactional
	 * 			서비스 로직에 대한 트랜잭션 처리를 지원한다.
	 * 			오류 발생시 롤백
	 */
	@Transactional
	@Override
	public int insert(ReplyVo vo) {
		
		// 댓글 입력 시 Board테이블의 댓글 수 (replyCnt) 를 1증가 시켜 줍니다.
		boardMapper.updateReplyCnt(vo.getBno(), 1);
		int res = 0;
		
		res = replyMapper.insert(vo);
		
		return res;
	}

	@Override
	public int delete(int rno) {
		
		int res = 0;
		ReplyVo vo = replyMapper.getOne(rno);
		boardMapper.updateReplyCnt(vo.getBno(), -1);
		
		res = replyMapper.delete(rno);
		
		return res;
	}

	@Override
	public int update(ReplyVo vo) {
		
		int res = 0;
		
		res = replyMapper.update(vo);
		
		return res;
	}

	@Override
	public List<ReplyVo> NewGetList(int bno, Criteria cri) {
		// TODO Auto-generated method stub
		return replyMapper.NewGetList(bno, cri);
	}

	@Override
	public int totalCnt(int bno) {
		// TODO Auto-generated method stub
		return replyMapper.totalCnt(bno);
	}

}
