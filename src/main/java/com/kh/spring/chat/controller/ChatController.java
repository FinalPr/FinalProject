package com.kh.spring.chat.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.websocket.server.ServerEndpoint;
import javax.servlet.http.HttpServletRequest;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;

import org.apache.http.HttpRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.spring.board.model.service.BoardService;
import com.kh.spring.chat.model.service.ChatService;
import com.kh.spring.chat.model.vo.ChatVO;
import com.kh.spring.member.model.vo.MemberVO;

import javax.websocket.RemoteEndpoint.Basic;
 



@Controller
@ServerEndpoint(value="/echo.do")
public class ChatController {
	
	@Autowired
	ChatService chatService;
	
	
    private static final Logger logger = LoggerFactory.getLogger(ChatController.class);
    private Map<String,ArrayList<Session> > map = new HashMap<String,ArrayList<Session>>(); 
    public ChatController() {
        // TODO Auto-generated constructor stub
        System.out.println("웹소켓(서버) 객체생성");
    }
    
    @RequestMapping(value="/chat.do")
    public ModelAndView getChatViewPage(ModelAndView mav) {
        mav.setViewName("/chat/chat");
        return mav;
    }
    
    @OnOpen
    public void onOpen(Session session) {
    	System.out.println("onOpen!!!");
    	String[] arr = session.getId().split(":");
    	if(map.get(arr[0]) == null) {
    		map.put(arr[0],new ArrayList<Session>());
    	}
        logger.info("Open session id:"+arr[1]);
        try {
            final Basic basic=session.getBasicRemote();
            basic.sendText("Connection Established");
        }catch (Exception e) {
            // TODO: handle exception
            System.out.println(e.getMessage());
        }
        map.get(arr[0]).add(session);
    }
  
    
    
    private void sendAllSessionToMessage(String[] arr,String message) {
    	System.out.println("sendAllSessionToMessage!!!");
    	try {
            for(Session session : map.get(arr[0])) {
                if(!arr[1].equals(session.getId().split(":")[1])) {
                    session.getBasicRemote().sendText(message);
                }
                
            }
        }catch (Exception e) {
            // TODO: handle exception
            System.out.println(e.getMessage());
        }
    }
    
   
    
    @OnMessage
    public void onMessage(String message,Session session) {
    	System.out.println("onMessage!!!");
    	
    	 String[] arr = session.getId().split(":");
    	 String[] arr2= arr[0].split("#");
    	 ChatVO cvo =new ChatVO();
         cvo.setCategory(arr2[0]);
         cvo.setNo(Integer.parseInt(arr2[1]));
         cvo.setRoom(Integer.parseInt(arr2[2]));
         cvo.setId(arr[1]);
         cvo.setContent(message);
        logger.info("Message From "+session.getId() + ": "+message);
       
    	try {
            final Basic basic=session.getBasicRemote();
            basic.sendText(arr[1] + " : "+message);
            insertChat(cvo);
        }catch (Exception e) {
            System.out.println(e.getMessage());
        }
        sendAllSessionToMessage(arr, message);
    }
    
    @OnError
    public void onError(Throwable e,Session session) {
        
    }
    @OnClose
    public void onClose(Session session) {
    	System.out.println("onClose!!!");
        logger.info("Session "+session.getId()+" has ended");
        String[] arr = session.getId().split(":");
        map.get(arr[0]).remove(session);
    }
    
    @RequestMapping("/createRoom.do")
    private void createRoom(ChatVO cvo,HttpServletRequest request) {
    	MemberVO mvo =(MemberVO)request.getSession().getAttribute("loginUser");
    	if(mvo ==null)
    		return;
    		cvo.setId(mvo.getId());
    		chatService.createRoom(cvo);
    		
    	
    	
    	getRoomList(cvo,request);

    }
    
    @ResponseBody
	@RequestMapping(value="/joinRoom.do",produces="application/json; charset=UTF-8")
    private String joinRoom(ChatVO cvo,HttpServletRequest request) {
    	MemberVO mvo =(MemberVO)request.getSession().getAttribute("loginUser");
    	if(mvo ==null)
    		return "error";
    	cvo.setId(mvo.getId());
    	int result = chatService.joinRoom(cvo);
    	
    	
    	return "success";
    }
    
    @ResponseBody
   	@RequestMapping(value="/getRoomList.do",produces="application/json; charset=UTF-8")
    private String getRoomList(ChatVO cvo,HttpServletRequest request) {
    	MemberVO mvo =(MemberVO)request.getSession().getAttribute("loginUser");
    	if(mvo == null)
    		return"";
    	cvo.setId(mvo.getId());
    	ArrayList<ChatVO> roomList = chatService.getRoomList(cvo);
    	Gson gson = new GsonBuilder().setPrettyPrinting().create();
    	String jsonStiring = gson.toJson(roomList);
    	return jsonStiring;
    }
    
    @ResponseBody
   	@RequestMapping(value="/getChatList.do",produces="application/json; charset=UTF-8")
    private String getChatList(ChatVO cvo,HttpServletRequest request) {
    	MemberVO mvo =(MemberVO)request.getSession().getAttribute("loginUser");
    	if(mvo == null)
    		return"";
    	cvo.setId(mvo.getId());
    	ArrayList<ChatVO> chatList = chatService.getChatList(cvo);
    	Gson gson = new GsonBuilder().setPrettyPrinting().create();
    	String jsonStiring = gson.toJson(chatList);
    	return jsonStiring;
    }
    
    private int insertChat(ChatVO cvo) {
    	
    	int result =0;
    	
    	result = chatService.insertChat(cvo);
    	
    	return result ;
    	
    }

    
}
