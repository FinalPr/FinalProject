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
	
	public MemberVO loginMember(MemberVO memberVo) {
		return (MemberVO)sqlSession.selectOne("memberMapper.loginMember",memberVo);
	}
	public int insertMember(MemberVO m) {
	
		return sqlSession.insert("memberMapper.insertMember",m);
	}
	
	public int emailCheck(String email) {
		return sqlSession.selectOne("memberMapper.emailCheck",email);
	}
	public String IdFind(MemberVO m) {
		return sqlSession.selectOne("memberMapper.IdFind",m);
	}
	public int selectDupUserid(String id) {
		return sqlSession.selectOne("memberMapper.selectDupUserid", id);
	}
	
	public int selectUserPwd(MemberVO memberVo) {
		return sqlSession.selectOne("memberMapper.selectUserPwd",memberVo);
	}
	public int findePwdSet(MemberVO memberVo) {
		return sqlSession.update("memberMapper.findePwdSet",memberVo);
	}
	public int deleteMember(String id) {
		return sqlSession.update("memberMapper.deleteMember",id);
	}
	

}
