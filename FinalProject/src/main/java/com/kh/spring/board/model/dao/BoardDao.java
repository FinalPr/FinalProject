package com.kh.spring.board.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.board.model.vo.BoardVO;

@Repository
public class BoardDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insertBoard(BoardVO bvo) {
		bvo.setCategory("asdasd");
		bvo.setComplete(true);
		bvo.setImage("asdasd");
		bvo.setDelete(false);
		bvo.setPrice(100);
		return sqlSession.insert("boardMapper.insertBoard",bvo);
	}

}
