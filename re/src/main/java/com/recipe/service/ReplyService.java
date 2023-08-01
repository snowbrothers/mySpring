package com.recipe.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.recipe.vo.GeneralReplyVo;
import com.recipe.vo.RecipeReplyVo;

@Service
public interface ReplyService {

	
	public List<RecipeReplyVo> getRecipeReply(int b_no);
	
	public int replyWrite(RecipeReplyVo vo);
	
	public RecipeReplyVo selectPhotoReview(int r_no);
	
	public List<GeneralReplyVo> getGeneralReply(int b_no);
	
	public int grWrite(GeneralReplyVo vo);
}
