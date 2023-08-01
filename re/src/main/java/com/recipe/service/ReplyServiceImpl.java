package com.recipe.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.recipe.mapper.ReplyMapper;
import com.recipe.vo.GeneralReplyVo;
import com.recipe.vo.RecipeReplyVo;

@Service
public class ReplyServiceImpl implements ReplyService{

	@Autowired
	ReplyMapper replyMapper;
	
	
	@Override
	public List<RecipeReplyVo> getRecipeReply(int b_no) {
		// TODO Auto-generated method stub
		return replyMapper.getRecipeReply(b_no);
	}


	@Override
	public int replyWrite(RecipeReplyVo vo) {
		// TODO Auto-generated method stub
		return replyMapper.replyWrite(vo);
	}


	@Override
	public RecipeReplyVo selectPhotoReview(int r_no) {
		// TODO Auto-generated method stub
		return replyMapper.selectPhotoReview(r_no);
	}


	@Override
	public List<GeneralReplyVo> getGeneralReply(int b_no) {
		// TODO Auto-generated method stub
		return replyMapper.getGeneralReply(b_no);
	}


	@Override
	public int grWrite(GeneralReplyVo vo) {
		// TODO Auto-generated method stub
		return replyMapper.grWrite(vo);
	}

}
