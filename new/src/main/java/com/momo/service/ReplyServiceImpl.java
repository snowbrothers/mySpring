package com.momo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.momo.mapper.ReplyMapper;
import com.momo.vo.ReplyVo;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	ReplyMapper replyMapper;
	
	@Override
	public List<ReplyVo> getList(int bno) {
		// TODO Auto-generated method stub
		return replyMapper.getList(bno);
	}

	@Override
	public int insert(ReplyVo vo) {
		
		int res = 0;
		
		res = replyMapper.insert(vo);
		
		return res;
	}

	@Override
	public int delete(int rno) {
		
		int res = 0;
		
		res = replyMapper.delete(rno);
		
		return res;
	}

	@Override
	public int update(ReplyVo vo) {
		
		int res = 0;
		
		res = replyMapper.update(vo);
		
		return res;
	}

}
