package com.recipe.mapper;

import java.util.List;

import com.recipe.vo.RecipeReplyVo;

public interface ReplyMapper {

	
	public List<RecipeReplyVo> getRecipeReply(int b_no);
	
	public int replyWrite(RecipeReplyVo vo);
	
	public RecipeReplyVo selectPhotoReview(int r_no);
}
