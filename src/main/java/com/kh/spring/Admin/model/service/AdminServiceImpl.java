package com.kh.spring.Admin.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.Admin.model.dao.AdminDao;
import com.kh.spring.Admin.model.vo.AdminPageInfo;
import com.kh.spring.Admin.model.vo.AdminVo;
import com.kh.spring.member.model.vo.MemberVO;
import com.kh.spring.qna.model.vo.QnaPageInfo;
import com.kh.spring.qna.model.vo.QnaVO;

@Service("aService")
public class AdminServiceImpl  implements AdminService {

	@Autowired
	private AdminDao aDao;
	
	@Override
	public int getListCount() {
		return aDao.getListCount();
	}

	@Override
	public ArrayList<MemberVO> MeberList(AdminPageInfo pi) {
		return aDao.MeberList(pi);
	}

	@Override
	public ArrayList<MemberVO> Membersecessionlist(AdminPageInfo pi) {
		return aDao.Membersecessionlist(pi);
	}

	@Override
	public void deleteMember(String id) {
		 aDao.deleteMember(id);
	}
	@Override
	public void  memberrestore(String id) {
		aDao.memberrestore(id);
	}

	@Override
	public int updateadminqna(QnaVO qnaVo) {
		return aDao.updateadminqna(qnaVo);
	}
	
	
	@Override
	public ArrayList<QnaVO> qnaList(QnaPageInfo pi) {
		return aDao.qnaList(pi);
	}

	@Override
	public int getqnaListCount() {
		return aDao.getqnaListCount();
	}


}
