package com.kh.spring.member.model.service;



import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;


import com.kh.spring.member.model.dao.MemberDao;
import com.kh.spring.member.model.vo.MemberVO;

@Service("mService")
public class MemberServiceImpl implements MemberService  {
	@Autowired
	private MemberDao mDao;
	@Inject
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	@Autowired
	SqlSessionTemplate sqlSession; // 트랜잭션 처리용
	
//	@Autowired
//	private DataSourceTransactionManager transactionManager;
	@Override
	public MemberVO loginMember(MemberVO memberVo) {
		return mDao.loginMember(memberVo);
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
	@Override
	public int emailCheck(String email) {
		return mDao.emailCheck(email);
	}
	
	@Override
	public String selectUserid(MemberVO memberVo) {
		return mDao.IdFind(memberVo);
	}
	@Override
	public int selectUserChkInfo(MemberVO memberVo) {
int result=0;
		
		int cnt=mDao.selectDupUserid(memberVo.getId());
		
		if(cnt>0) {
			int cnt2=mDao.selectUserPwd(memberVo);
			if(cnt2>0) {
				result =1;
			}
		
		result=1;
		}
		return result;
	}
	@Override
	public int findePwdSet(MemberVO memberVo) {
		
	
		return mDao.findePwdSet(memberVo);
	}

	

	

}
