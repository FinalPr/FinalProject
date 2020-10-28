package com.kh.spring.board.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.board.model.vo.BoardVO;
import com.kh.spring.board.model.dao.BoardDao;
@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	private BoardDao boardDao;
	
	@Override
	public int insertBoard(BoardVO bvo) {
		boardDao.insertBoard(bvo);
		return 0;
	}

}
