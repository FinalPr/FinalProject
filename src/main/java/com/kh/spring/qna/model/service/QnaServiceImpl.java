package com.kh.spring.qna.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.qna.model.dao.QnaDao;
import com.kh.spring.qna.model.vo.QnaPageInfo;
import com.kh.spring.qna.model.vo.QnaVO;

@Service("qnaService")
public class QnaServiceImpl implements QnaService{

	@Autowired
	private QnaDao qnaDao;

	@Override
	public int getListCount() {
		return qnaDao.getListCount();
	}

	@Override
	public ArrayList<QnaVO> qnaList(QnaPageInfo pi) {
		return qnaDao.qnaList(pi);
	}

	@Override
	public QnaVO selectQna(int qnaId) {
		// 조회수 증가
				int result = qnaDao.updateCount(qnaId);
				System.out.println("조회수 증가 확인 : " + result);
				
				if(result > 0) {
					return qnaDao.selectQna(qnaId);
				}else {
					return null;
				}
	}

	
	@Override
	public int insertqna(QnaVO qnaVo) {
		return qnaDao.insertQna(qnaVo);
	}

	
	@Override
	public int updateqna(QnaVO qnaVo) {
		return qnaDao.updateqna(qnaVo);
	}

	@Override
	public QnaVO selectUpdateQna(int qnaId) {
		return qnaDao.selectQna(qnaId);
	}

	@Override
	public int deleteqna(int qnaId) {
		return qnaDao.deleteqna(qnaId);
	}

	@Override
	public ArrayList<QnaVO> selectTopList() {
		return qnaDao.selectTopList();
	}

}
