package com.kh.spring.Admin.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.Admin.model.dao.AdminDao;
import com.kh.spring.Admin.model.vo.AdminPageInfo;
import com.kh.spring.Admin.model.vo.AdminVo;

@Service("aService")
public class AdminServiceImpl  implements AdminService {

	@Autowired
	private AdminDao aDao;
	
	@Override
	public int getListCount() {
		return aDao.getListCount();
	}

	@Override
	public ArrayList<AdminVo> selectList(AdminPageInfo pi) {
		return aDao.selectList(pi);
	}

}
