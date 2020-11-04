package com.kh.spring.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;

import com.kh.spring.member.model.dao.MemberDao;
import com.kh.spring.member.model.vo.MemberVO;

@Service("mService")
public class MemberServiceImpl implements MemberService  {
	@Autowired
	private MemberDao mDao;
	
	@Autowired
	SqlSessionTemplate sqlSession; // 트랜잭션 처리용
	
//	@Autowired
//	private DataSourceTransactionManager transactionManager;
	@Override
	public MemberVO loginMember(MemberVO m) {
		return mDao.loginMember(m);
	}
	@Override
	public int insertMember(MemberVO m) {
		 int result1 = mDao.insertMember(m);
//	      int result2 = mDao.insertBoard();
	      
	      int result = 0;
	      if(result1> 0 ) {
	         result = 1;
	      }
	      return result;
	}
	@Override
	public int idCheck(String id) {
		return mDao.idCheck(id);
	}

	

}
