package com.kh.spring.board.model.service;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;

import com.kh.spring.board.model.vo.BoardVO;
import com.kh.spring.board.model.vo.CommentVO;
import com.kh.spring.board.model.vo.ZzimVO;
import com.kh.spring.member.model.vo.MemberVO;

@Service
public interface BoardService {
	
	int insertBoard(BoardVO bvo);

	ArrayList<BoardVO> getBoardList(Map<String, Object> map, RowBounds rowBounds);

	BoardVO getBoardDetail(BoardVO bvo);


	int updateBoard(BoardVO bvo);


	int deleteBoard(BoardVO bvo);


	ArrayList<CommentVO> getCommentList(BoardVO bvo);


	int getBoardCount(BoardVO bvo);



	int insertComment(CommentVO cvo);



	int deleteComment(CommentVO cvo);

	
	
	int updateComment(CommentVO cvo);



	int insertZzim(ZzimVO zvo);
	
	
	
	int deleteZzim(ZzimVO zvo);



	ZzimVO selectZzim(ZzimVO zvo);



	ArrayList<BoardVO> getBoardSearchList(Map<String, Object> map, RowBounds rowBounds);


	ArrayList<BoardVO> getBoardListCheck(Map<String, Object> map, RowBounds rowBounds);



	ArrayList<BoardVO> getBoardMainList(Map<String, Object> map, RowBounds rowBounds);



	int insertLook(Map<String, Object> map);

	
	
	ZzimVO selectLook(Map<String, Object> map);

	
	
	int updateLook(Map<String, Object> map);


	ArrayList<BoardVO> getBuyList(MemberVO mvo, RowBounds rowBounds);

	ArrayList<BoardVO> getSellList(MemberVO mvo, RowBounds rowBounds);

	ArrayList<BoardVO> getZzimList(MemberVO mvo, RowBounds rowBounds);

	ArrayList<BoardVO> getLookList(MemberVO mvo, RowBounds rowBounds);

	ArrayList<BoardVO> getMyList(MemberVO mvo, RowBounds rowBounds);

	int getSellListCount(MemberVO mvo);

	int getBuyListCount(MemberVO mvo);

	int getZzimListCount(MemberVO mvo);

	int getLookListCount(MemberVO mvo);

	int getMyListCount(MemberVO mvo);



	
	
	

}
