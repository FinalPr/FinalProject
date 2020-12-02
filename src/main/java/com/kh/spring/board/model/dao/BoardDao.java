package com.kh.spring.board.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.board.model.vo.BoardVO;
import com.kh.spring.board.model.vo.CommentVO;
import com.kh.spring.board.model.vo.ZzimVO;
import com.kh.spring.member.model.vo.MemberVO;

@Repository
public class BoardDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insertBoard(BoardVO bvo) {
		return sqlSession.insert("boardMapper.insertBoard",bvo);
	}

	public BoardVO getBoardDetail(BoardVO bvo) {
		return sqlSession.selectOne("boardMapper.getBoardDetail",bvo);
	}

	public int deleteBoard(BoardVO bvo) {
		return sqlSession.update("boardMapper.deleteBoard",bvo);
	}

	public ArrayList<CommentVO> getCommentList(BoardVO bvo) {
		return (ArrayList)sqlSession.selectList("boardMapper.getCommentList",bvo);
	}
	
	public int getBoardCount(BoardVO bvo) {
		return sqlSession.selectOne("boardMapper.getBoardCount",bvo);
	}

	public int insertComment(CommentVO cvo) {
		return sqlSession.insert("boardMapper.insertComment",cvo);
	}

	public int deleteComment(CommentVO cvo) {
		return sqlSession.insert("boardMapper.deleteComment",cvo);
	}

	public ArrayList<BoardVO> getBoardList(Map<String, Object> map, RowBounds rowBouds) {
		return (ArrayList)sqlSession.selectList("boardMapper.getBoardList",map,rowBouds);
	}

	public int insertZzim(ZzimVO zvo) {
		return sqlSession.insert("boardMapper.insertZzim",zvo);
	}

	public int deleteZzim(ZzimVO zvo) {
		return sqlSession.delete("boardMapper.deleteZzim",zvo);
	}

	public ZzimVO selectZzim(ZzimVO zvo) {
		return sqlSession.selectOne("boardMapper.selectZzim",zvo);
	}

	public ArrayList<BoardVO> getBoardSearchList(Map<String, Object> map, RowBounds rowBounds) {
		return (ArrayList)sqlSession.selectList("boardMapper.getBoardSearchList",map,rowBounds);
	}

	public ArrayList<BoardVO> getBoardListCheck(Map<String, Object> map, RowBounds rowBounds) {
		return (ArrayList)sqlSession.selectList("boardMapper.getBoardListUseMap",map,rowBounds);
	}

	public ArrayList<BoardVO> getBoardMainList(Map<String, Object> map, RowBounds rowBounds) {
		return (ArrayList)sqlSession.selectList("boardMapper.getBoardMainList",map,rowBounds);
	}

	public int insertLook(Map<String, Object> map) {
		
		 return sqlSession.insert("boardMapper.insertLook",map);
	}

	public ZzimVO selectLook(Map<String, Object> map) {
		return sqlSession.selectOne("boardMapper.selectLook",map);
	}

	public int updateLook(Map<String, Object> map) {
		return sqlSession.update("boardMapper.updateLook");
	}

	public ArrayList<BoardVO> getBuyList(MemberVO mvo, RowBounds rowBounds) {
		return (ArrayList)sqlSession.selectList("boardMapper.getBuyList",mvo,rowBounds);
	}

	public ArrayList<BoardVO> getSellList(MemberVO mvo, RowBounds rowBounds) {
		return (ArrayList)sqlSession.selectList("boardMapper.getSellList",mvo,rowBounds);
	}

	public ArrayList<BoardVO> getZzimList(MemberVO mvo, RowBounds rowBounds) {
		return (ArrayList)sqlSession.selectList("boardMapper.getZzimList",mvo,rowBounds);
	}

	public ArrayList<BoardVO> getLookList(MemberVO mvo, RowBounds rowBounds) {
		return (ArrayList)sqlSession.selectList("boardMapper.getLookList",mvo,rowBounds);
	}

	public ArrayList<BoardVO> getMyList(MemberVO mvo, RowBounds rowBounds) {
		return (ArrayList)sqlSession.selectList("boardMapper.getMyList",mvo,rowBounds);
	}

	public int getSellListCount(MemberVO mvo) {
		return sqlSession.selectOne("boardMapper.getSellListCount",mvo);
	}

	public int getBuyListCount(MemberVO mvo) {
		return sqlSession.selectOne("boardMapper.getBuyListCount",mvo);
	}

	public int getZzimListCount(MemberVO mvo) {
		return sqlSession.selectOne("boardMapper.getZzimListCount",mvo);
	}

	public int getLookListCount(MemberVO mvo) {
		return sqlSession.selectOne("boardMapper.getLookListCount",mvo);
	}

	public int getMyListCount(MemberVO mvo) {
		return sqlSession.selectOne("boardMapper.getMyListCount",mvo);
	}


	
	
	


}
