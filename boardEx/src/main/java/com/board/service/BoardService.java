package com.board.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.board.vo.BoardVo;

@Service
public interface BoardService {

	public List<BoardVo> getList(Model model);
}
