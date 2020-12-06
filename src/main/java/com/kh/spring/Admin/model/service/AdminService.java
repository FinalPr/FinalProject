package com.kh.spring.Admin.model.service;

import java.util.ArrayList;

import com.kh.spring.Admin.model.vo.AdminPageInfo;
import com.kh.spring.Admin.model.vo.AdminVo;
import com.kh.spring.member.model.vo.MemberVO;
import com.kh.spring.qna.model.vo.QnaPageInfo;
import com.kh.spring.qna.model.vo.QnaVO;

public interface AdminService {
	//1. 게시판 전체 리스트 조회
	
		/**
		 * 1_1. 게시판 총 갯수 조회
		 * @return 전체 게시글 수
		 */
		int getListCount();
		
		/**
		 * 1_2. 게시판 리스트 조회
		 * @param pi
		 * @return
		 */
		ArrayList<MemberVO> MeberList(AdminPageInfo pi);

		ArrayList<MemberVO> Membersecessionlist(AdminPageInfo pi);

		public void  deleteMember(String id) ;

		public void memberrestore(String id);

		int updateadminqna(QnaVO qnaVo);

	
		
		ArrayList<QnaVO> qnaList(QnaPageInfo pi);

		int getqnaListCount();

		
}
