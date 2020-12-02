package com.kh.spring.Admin.model.service;

import java.util.ArrayList;

import com.kh.spring.Admin.model.vo.AdminPageInfo;
import com.kh.spring.Admin.model.vo.AdminVo;

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
		ArrayList<AdminVo> selectList(AdminPageInfo pi);
}
