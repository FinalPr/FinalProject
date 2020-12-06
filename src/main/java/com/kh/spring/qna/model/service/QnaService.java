package com.kh.spring.qna.model.service;

import java.util.ArrayList;

import com.kh.spring.qna.model.vo.QnaPageInfo;
import com.kh.spring.qna.model.vo.QnaVO;

public interface QnaService {

	int insertqna(QnaVO qnaVo);

	int getListCount();

	ArrayList<QnaVO> qnaList(QnaPageInfo pi);

	QnaVO selectQna(int qnaId);

	int updateqna(QnaVO qnaVo);

	QnaVO selectUpdateQna(int qnaId);

	int deleteqna(int qnaId);

	ArrayList<QnaVO> selectTopList();

}
