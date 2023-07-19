package com.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.board.mapper.BoardMapper;
import com.board.vo.BoardVo;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	BoardMapper boardMapper;
	
	@Override
	public List<BoardVo> getList() {
		
		return boardMapper.getList();
	}

	@Override
	public int insert(BoardVo vo) {

		return boardMapper.insert(vo);
	}

}
