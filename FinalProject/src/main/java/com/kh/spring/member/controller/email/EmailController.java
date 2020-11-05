package com.kh.spring.member.controller.email;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/emailmember")
public class EmailController {

	
	@Autowired
	private EmailSender emailSender; //빈 주입 From IOC Container.
	
	@RequestMapping("/certifiedMail.do")
	@ResponseBody
	public String certifiedMail(@RequestParam (required = false) String user_email1
								,@RequestParam (required = false) String user_email2){
		
		System.out.println(user_email1 + " ; " + user_email2);
		String userEmail1 = "";	//해당 유저 메일
		String subject = "";	//제목 
		String content = "";	//내용
		String receiver = "";	//받는이
		String sender= "";		//보낸이
		
		int authCode = 0;
		String authCodes = "";
		boolean bool = false;
		
		if(user_email1!=null && !user_email1.isEmpty() && 
				user_email2!=null && !user_email2.isEmpty()) {
			userEmail1 = user_email1 + "@" + user_email2;
			
		
			//RandomKey k = new RandomKey();
			//String key = k.excuteGenetate();
			
			//인증번호 난수 생성(우선 간단히 만든어보겠습니다.)
			for(int i=0;i<6;i++) {
				authCode = (int)(Math.random()*9+1);		//1~9 사이 난수생성
				authCodes += Integer.toString(authCode);
				
			}
			
			
			
			subject="안녕하세요 오ㅇ!마켓 관리자 김지훈 입니다. 회원가입 인증번호입니다.";
			content=DM.dmCertification(authCodes);
			receiver=userEmail1;
			sender="zhfldk0824@gmail.com";
		}
		
		try {
			emailSender.sendMail(subject, content, receiver, sender);
			
		}catch (Exception e) {
			
			e.printStackTrace();
		}
		
		return authCodes;
	}
			
}
