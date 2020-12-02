package com.kh.spring.chat.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.chat.model.dao.ChatDao;
import com.kh.spring.chat.model.vo.ChatVO;

@Service
public class ChatServiceImpl implements ChatService{
	@Autowired
	ChatDao chatDao;
	
	@Override
	public int createRoom(ChatVO cvo) {
		
		return chatDao.createRoom(cvo);
	}

	@Override
	public ArrayList<ChatVO> getRoomList(ChatVO cvo) {
		return chatDao.getRoomList(cvo);
	}

	@Override
	public ChatVO getRoom(ChatVO cvo) {
		return null;
	}

	@Override
	public ArrayList<ChatVO> getChatList(ChatVO cvo) {
		return chatDao.getChatList(cvo);
	}

	@Override
	public int joinRoom(ChatVO cvo) {
		return chatDao.joinRoom(cvo);
	}

	@Override
	public int insertChat(ChatVO cvo) {
		return chatDao.insertChat(cvo);
	}

}
