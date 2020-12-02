package com.kh.spring.chat.model.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.kh.spring.chat.model.vo.ChatVO;

@Service
public interface ChatService {

	int createRoom(ChatVO cvo);

	ArrayList<ChatVO> getChatList(ChatVO cvo);

	ArrayList<ChatVO> getRoomList(ChatVO cvo);

	ChatVO getRoom(ChatVO cvo);

	int joinRoom(ChatVO cvo);

	int insertChat(ChatVO cvo);

}
