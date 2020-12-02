package com.kh.spring.board.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.board.model.vo.BoardVO;
import com.kh.spring.board.model.vo.CommentVO;
import com.kh.spring.board.model.vo.ZzimVO;
import com.kh.spring.member.model.vo.MemberVO;
import com.kh.spring.board.model.dao.BoardDao;
@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	private BoardDao boardDao;

	@Override
	public int insertBoard(BoardVO bvo) {
		return boardDao.insertBoard(bvo);
	}

	@Override
	public BoardVO getBoardDetail(BoardVO bvo) {
		return boardDao.getBoardDetail(bvo);
	}

	@Override
	public int updateBoard(BoardVO bvo) {

		return 0;
	}

	@Override
	public int deleteBoard(BoardVO bvo) {
		return boardDao.deleteBoard(bvo);
	}

	@Override
	public ArrayList<CommentVO> getCommentList(BoardVO bvo) {
		return boardDao.getCommentList(bvo);
	}

	@Override
	public int getBoardCount(BoardVO bvo) {
		return boardDao.getBoardCount(bvo);
	}

	@Override
	public int insertComment(CommentVO cvo) {
		return boardDao.insertComment(cvo);
	}

	@Override
	public int deleteComment(CommentVO cvo) {
		return boardDao.deleteComment(cvo);
	}

	@Override
	public int updateComment(CommentVO cvo) {
		return 0;
	}

	@Override
	public ArrayList<BoardVO> getBoardList(Map<String, Object> map,  RowBounds rowBounds) {
		return boardDao.getBoardList(map,rowBounds);
	}

	@Override
	public int insertZzim(ZzimVO zvo) {
		return boardDao.insertZzim(zvo);
	}

	@Override
	public int deleteZzim(ZzimVO zvo) {
		return boardDao.deleteZzim(zvo);
	}

	@Override
	public ZzimVO selectZzim(ZzimVO zvo) {
		return boardDao.selectZzim(zvo);
	}

	@Override
	public ArrayList<BoardVO> getBoardSearchList(Map<String, Object> map, RowBounds rowBounds) {
		return boardDao.getBoardSearchList(map,rowBounds);
	}

	

	@Override
	public ArrayList<BoardVO> getBoardListCheck(Map<String, Object> map, RowBounds rowBounds) {
		return  boardDao.getBoardList(map,rowBounds);
	}

	@Override
	public ArrayList<BoardVO> getBoardMainList(Map<String, Object> map, RowBounds rowBounds) {
		return boardDao.getBoardMainList(map,rowBounds);
	}

	@Override
	public int insertLook(Map<String, Object> map) {
		return boardDao.insertLook(map);
	}

	@Override
	public ZzimVO selectLook(Map<String, Object> map) {
		return boardDao.selectLook(map);
	}

	@Override
	public int updateLook(Map<String, Object> map) {
		return boardDao.updateLook(map);
	}

	@Override
	public ArrayList<BoardVO> getBuyList(MemberVO mvo, RowBounds rowBounds) {
		return  boardDao.getBuyList(mvo,rowBounds);
	}

	@Override
	public ArrayList<BoardVO> getSellList(MemberVO mvo, RowBounds rowBounds) {
		return boardDao.getSellList(mvo,rowBounds);
	}

	@Override
	public ArrayList<BoardVO> getZzimList(MemberVO mvo, RowBounds rowBounds) {
		return boardDao.getZzimList(mvo,rowBounds);
	}

	@Override
	public ArrayList<BoardVO> getLookList(MemberVO mvo, RowBounds rowBounds) {
		return boardDao.getLookList(mvo,rowBounds);
	}

	@Override
	public ArrayList<BoardVO> getMyList(MemberVO mvo, RowBounds rowBounds) {
		return boardDao.getMyList(mvo,rowBounds);
	}

	@Override
	public int getSellListCount(MemberVO mvo) {
		return boardDao.getSellListCount(mvo);
	}

	@Override
	public int getBuyListCount(MemberVO mvo) {
		return boardDao.getBuyListCount(mvo);
	}

	@Override
	public int getZzimListCount(MemberVO mvo) {
		return boardDao.getZzimListCount(mvo);
	}

	@Override
	public int getLookListCount(MemberVO mvo) {
		return boardDao.getLookListCount(mvo);
	}

	@Override
	public int getMyListCount(MemberVO mvo) {
		return boardDao.getMyListCount(mvo);
	}

	

}
