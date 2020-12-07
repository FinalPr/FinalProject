package com.kh.spring.member.model.service;



import java.sql.SQLException;
import java.util.ArrayList;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import com.kh.spring.member.model.dao.MemberDao;
import com.kh.spring.member.model.vo.MemberVO;
import com.kh.spring.member.model.vo.StarVO;

@Service("mService")
public class MemberServiceImpl implements MemberService  {
	@Autowired
	private MemberDao mDao;
	@Inject
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	@Autowired
	SqlSessionTemplate sqlSession; // 트랜잭션 처리용
	
	@Autowired
	private DataSourceTransactionManager transactionManager;
	@Override
	public MemberVO loginMember(MemberVO memberVo) {
		return mDao.loginMember(memberVo);
		
	}
	@Override
	public int insertMember(MemberVO memberVo) {
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
//		
		// 기본 값에 대해 트랜잭션 행위를 설정할 수 있다.
		// TransactionDefinition.PROPAGATION_REQUIRED는
		// 이미 하나의 트랜잭션이 존재한다면 이후의 트랜잭션은 그 트랜잭션을 지원하고
		// 트랜잭션이 없다면 새로운 트랜잭션을 시작한다는 의미
		
		def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
		
		// 설정한 트랜잭션 정의에 대한 객체를 트랜잭션 상태를 관리하는 객체를 생성해서 전달한다.
		// TransactionStatus  인터페이스이기 때문에 트랜잭션 매니저 객체를 통해 트랜잭션 객체에 설정 정보를 넘겨주어야한다.
		// --> 의존성 주입을 위해 bean으로 등록해줘어야 하고 DB와 관련된 bean이기 때문에 root-context.xml 파일에 설정한다.
		TransactionStatus status = transactionManager.getTransaction(def);
		
		//=======> 트랜잭션에 대한 기본 설정을 한 부분
		
		// sqlSession 내에서 Connection 객체를 가지고 와서 auto commit을 false로 설정
		try {
			sqlSession.getConnection().setAutoCommit(false);
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		
		int result1 = mDao.insertMember(memberVo);
//	      int result2 = mDao.insertBoard();
	      
	      int result = 0;
	      if(result1> 0 ) {
	    	  transactionManager.commit(status);
	         result = 1;
	      }else {
	    	  transactionManager.rollback(status);
//				result = 0;
	      }
	      return result;
	}
	@Override
	public int idCheck(String id) {
			
		
		return mDao.selectDupUserid(id);
		
	
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

	@Override
	public int deleteMember(String id) {
		return mDao.deleteMember(id);
	}
	@Override
	public int updateMember(MemberVO memberVo) {
		return mDao.updateMember(memberVo);
	}
	@Override
	public int fileupdate(MemberVO memberVo) {
		return mDao.fileupdate(memberVo);
	}
	@Override
	public int insertkakao(MemberVO memberVo) {
		int result = mDao.insertkakao(memberVo);
		System.out.println("서비스 쪽"+memberVo);
		
		 return result;
	}
	@Override
	public MemberVO selectMember(String id) {
		return mDao.selectMember(id);
	}
	@Override
	public ArrayList<StarVO> selectStar(String id) {
		return mDao.selectStar(id);
	}
	

	

}
