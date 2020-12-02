package com.kh.spring.Admin.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.Admin.model.vo.AdminPageInfo;
import com.kh.spring.Admin.model.vo.AdminVo;

@Repository("aDao")
public class AdminDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int getListCount() {
		return sqlSession.selectOne("AdminMapper.getListCount");
	}

	public ArrayList<AdminVo> selectList(AdminPageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("AdminMapper.selectList",null,rowBounds);
	}
	
}
