package com.kh.spring.member.controller.email;

import java.util.Map;

import javax.inject.Inject;
import javax.mail.MessagingException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spring.member.controller.MemberController;
import com.kh.spring.member.model.service.MemberService;
import com.kh.spring.member.model.vo.MemberVO;

@Controller
@RequestMapping("/emailmember")
public class EmailController {

	
	@Autowired
	private EmailSender emailSender; //빈 주입 From IOC Container.
	
	 @Inject
  	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@Autowired
	private MemberService mService;
	
	private Logger log =LoggerFactory.getLogger(EmailController.class);
	
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
			log.info("이메일인증 확인");
			
			if(log.isDebugEnabled()) {
				log.debug("이메일 인증확인 - debug");
			} 
			
		}catch (Exception e) {
			
			e.printStackTrace();
		}
		
		return authCodes;
	}
	
	  @RequestMapping(value = "IDFIND.do",method = RequestMethod.POST)
	   public String findId_post(@RequestParam String User_name,@RequestParam String user_email1,@RequestParam String user_email2,Model model){
	      
	      
	      String userEmail1 = "";	//해당 유저 메일
			String subject = "";	//제목 
			String content = "";	//내용
			String receiver = "";	//받는이
			String sender= "";		//보낸이
	      
			if(user_email1!=null && !user_email1.isEmpty() && 
					user_email2!=null && !user_email2.isEmpty()) {
				userEmail1 = user_email1 + "@" + user_email2;
	      MemberVO memberVo=new MemberVO();
	      
	     memberVo.setEmail(userEmail1);
	      memberVo.setUsername(User_name);
	      
	      String userid=mService.selectUserid(memberVo);
	      
	      String msg="",url="";
	      if(userid==null || userid.isEmpty()) {
	         msg="해당하는 정보가 일치하지않거나 존재하지않습니다!";
	         url="/login/findId.do";
	      }else {
	         subject="안녕하세요  관리자입니다."+memberVo.getUsername()+"님의 ID입니다.";
	        content=DM.dmUserIdInfo(userid);
	         receiver=memberVo.getEmail();
	         sender="zhfldk08@gmail.com";
	         
	         try {
	            emailSender.sendMail(subject, content, receiver, sender);
	            log.info("아이디발송 확인");
				
				if(log.isDebugEnabled()) {
					log.debug("아이디 발송확인 - debug");
				} 
	            
	            msg="이메일로 아이디 발송해드렸습니다.";
	            url="/login/login.do";
	         } catch (MessagingException e) {
	            
	            e.printStackTrace();
	         }
	      }
	      
	      model.addAttribute("msg",msg);
	      model.addAttribute("url",url);
	      
	    
	   }
			  return "common/message";


	  }
	  
	 
	  @RequestMapping(value = "PWDFIND.do",method = RequestMethod.POST)
	   public String findPwd_post(@RequestParam String userid,@RequestParam String user_email1,@RequestParam String user_email2,Model model) {
	    
		  String userEmail1 = "";	//해당 유저 메일
	      MemberVO memberVo=new MemberVO();
	      
	      if(user_email1!=null && !user_email1.isEmpty() && 
					user_email2!=null && !user_email2.isEmpty()) {
				userEmail1 = user_email1 + "@" + user_email2;
	 
	      memberVo.setId(userid);
	      memberVo.setEmail(userEmail1);

	      int cnt=mService.selectUserChkInfo(memberVo);
	   
	      
	      String msg="",url="/login/findPwd.do";
	      if(cnt>0) {
	         RandomKey rk=new RandomKey();
	         String pwd=rk.excuteGenerate1();
	         memberVo.setPassword(pwd);
	     
	         String subject="안녕하세요 관리자입니다."+memberVo.getId()+"님의 임시비밀번호 발급";
	         String content=DM.dmUserPwdInfo(pwd);
	         String receiver=memberVo.getEmail();
	         String sender="zhfldk0824@gmail.com";
	         String encPassword = bcryptPasswordEncoder.encode(memberVo.getPassword());
	         memberVo.setPassword(encPassword);
	         mService.findePwdSet(memberVo);

	         try {
	            emailSender.sendMail(subject, content, receiver, sender);
	            log.info("비밀번호발송 확인");
				
				if(log.isDebugEnabled()) {
					log.debug("비밀번호 발송확인 - debug");
				} 
	            
	            msg="임시비밀번호 발급완료!";
	            url="/login/login.do";
	         } catch (MessagingException e) {
	        
	            e.printStackTrace();
	         }
	      }
	      
	      model.addAttribute("msg",msg);
	      model.addAttribute("url",url);
	      
	      
	   }
	      return "common/message";
	  }
}

	
		

