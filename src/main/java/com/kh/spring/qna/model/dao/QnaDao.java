package com.kh.spring.qna.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.qna.model.vo.QnaPageInfo;
import com.kh.spring.qna.model.vo.QnaVO;

@Repository("qnaDao")
public class QnaDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int insertQna(QnaVO qnaVo) {
	
		return sqlSession.insert("qnaMapper.insertQna",qnaVo);
	}

	public int getListCount() {
		return sqlSession.selectOne("qnaMapper.getListCount");
	}

	public ArrayList<QnaVO> qnaList(QnaPageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("qnaMapper.qnaList",null,rowBounds);
	}

	public int updateCount(int qnaId) {
		return sqlSession.update("qnaMapper.updateCount",qnaId);
	}

	public QnaVO selectQna(int qnaId) {
		return sqlSession.selectOne("qnaMapper.selectQna",qnaId);
	}

	public int updateqna(QnaVO qnaVo) {
		return sqlSession.update("qnaMapper.updateqna",qnaVo);
	}

	

	public int deleteqna(int qnaId) {
		return sqlSession.delete("qnaMapper.deleteqna",qnaId);
	}

	public ArrayList<QnaVO> selectTopList() {
		return (ArrayList)sqlSession.selectList("qnaMapper.selectTopList");
	}

}
