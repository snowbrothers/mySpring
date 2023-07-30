package com.recipe.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.recipe.mapper.ReplyMapper;
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

}
