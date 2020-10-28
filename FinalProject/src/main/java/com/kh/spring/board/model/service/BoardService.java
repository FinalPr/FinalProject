package com.kh.spring.board.model.service;

import org.springframework.stereotype.Service;

import com.kh.spring.board.model.vo.BoardVO;

@Service
public interface BoardService {
	
	int insertBoard(BoardVO bvo);
}
