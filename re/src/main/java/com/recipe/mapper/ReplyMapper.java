package com.recipe.mapper;

import java.util.List;

import com.recipe.vo.GeneralReplyVo;
import com.recipe.vo.RecipeReplyVo;

public interface ReplyMapper {

	
	public List<RecipeReplyVo> getRecipeReply(int b_no);
	
	// 
	public int replyWrite(RecipeReplyVo vo);
	
	
	public RecipeReplyVo selectPhotoReview(int r_no);
	
	// 일반 댓글 리스트 조회
	public List<GeneralReplyVo> getGeneralReply(int b_no);
	
	// 일반 댓글 작성
	public int grWrite(GeneralReplyVo vo);
}
