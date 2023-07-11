package com.momo.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.momo.vo.Criteria;
import com.momo.vo.ReplyVo;

@Service
public interface ReplyService {

	public List<ReplyVo> NewGetList(int bno, Criteria cri);
	
	public List<ReplyVo> getList(int bno);
	
	public int insert(ReplyVo vo);
	
	public int delete(int rno);
	
	public int update(ReplyVo vo);
	
	public int totalCnt(int bno);
}

