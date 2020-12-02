package com.kh.spring.chat.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.chat.model.vo.ChatVO;

@Repository
public class ChatDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int createRoom(ChatVO cvo) {
		return sqlSession.insert("chatMapper.createRoom",cvo);
	}

	public ArrayList<ChatVO> getChatList(ChatVO cvo) {
		return (ArrayList)sqlSession.selectList("chatMapper.getChatList",cvo);
	}

	public ArrayList<ChatVO> getRoomList(ChatVO cvo) {
		return (ArrayList)sqlSession.selectList("chatMapper.getRoomList",cvo);
	}

	public int joinRoom(ChatVO cvo) {
		return sqlSession.insert("chatMapper.joinRoom",cvo);
	}

	public int insertChat(ChatVO cvo) {
		return sqlSession.insert("chatMapper.insertChat",cvo);
	}
	
	
}
