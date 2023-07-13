package com.board.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.board.vo.BoardVo;

@Service
public interface BoardService {

	public List<BoardVo> getList();
}
