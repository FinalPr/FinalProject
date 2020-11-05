package com.kh.spring.member.model.dao;

import java.sql.Date;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.member.model.vo.MemberVO;
@Repository("mDao") // DB와 접근하는 클래스타입
public class MemberDao {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	public MemberVO loginMember(MemberVO m) {
		return (MemberVO)sqlSession.selectOne("memberMapper.loginMember",m);
	}
	public int insertMember(MemberVO m) {
	
		return sqlSession.insert("memberMapper.insertMember",m);
	}
	public int idCheck(String id) {
		return sqlSession.selectOne("memberMapper.idCheck",id);
	}
	public int emailCheck(String email) {
		return sqlSession.selectOne("memberMapper.emailCheck",email);
	}

	

}
