package com.kh.spring.Admin.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.Admin.model.vo.AdminPageInfo;
import com.kh.spring.Admin.model.vo.AdminVo;
import com.kh.spring.member.model.vo.MemberVO;
import com.kh.spring.qna.model.vo.QnaPageInfo;
import com.kh.spring.qna.model.vo.QnaVO;

@Repository("aDao")
public class AdminDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int getListCount() {
		return sqlSession.selectOne("AdminMapper.getListCount");
	}

	public ArrayList<MemberVO> MeberList(AdminPageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("AdminMapper.MeberList",null,rowBounds);
	}

	public ArrayList<MemberVO> Membersecessionlist(AdminPageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("AdminMapper.Membersecessionlist",null,rowBounds);
	}

	public void deleteMember(String id) {
		 sqlSession.delete("AdminMapper.deleteMember",id);
	}

	public void memberrestore(String id) {
		 sqlSession.update("AdminMapper.memberrestore",id);	
	}

	public int updateadminqna(QnaVO qnaVo) {
		return sqlSession.update("AdminMapper.updateadminqna",qnaVo);
	}
	
	public ArrayList<QnaVO> qnaList(QnaPageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("AdminMapper.qnaList",null,rowBounds);
	}

	public int getqnaListCount() {
		return sqlSession.selectOne("AdminMapper.getqnaListCount");
	}

	
	
}
