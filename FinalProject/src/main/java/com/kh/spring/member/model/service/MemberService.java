package com.kh.spring.member.model.service;

import java.util.Map;

import com.kh.spring.member.model.vo.MemberVO;


public interface MemberService {
	/**
	 * @author zhfld_8mpklew
	 *1. 로그인 메소드
	 *@param m
	 */
	MemberVO loginMember(MemberVO m);
	/**
	 * 2. 회원 가입 서비스를 위한 메소드
	 * @param m
	 * @return int(성공: 1이상/실패: -1)
	 */
	int insertMember(MemberVO m);
	/**
	 * @param id
	 * 3. id 중복체크 메소드
	 * @return
	 */
	int idCheck(String id);
	/**
	 * @param email
	 * 4 . 이메일 중복체크 메소드
	 * @return
	 */
	int emailCheck(String email);
	String selectUserid(MemberVO memberVo);
	int selectUserChkInfo(MemberVO memberVo);
	int findePwdSet(MemberVO memberVo);
	int deleteMember(String id); 


}
