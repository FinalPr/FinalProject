package com.kh.spring.member.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.kh.spring.member.model.service.MemberService;
import com.kh.spring.member.model.vo.MemberVO;
@SessionAttributes("loginUser") // Model에 loginUser라는 키값으로 객체가 추가되면 자동으로 세션에추가하라는 의미의 어노테이션
@Controller 
public class MemberController {
	@Autowired
	private MemberService mService;
	// 암호화 처리
	@Inject
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	//암호화 하기 전
//	@RequestMapping(value="login.do",method=RequestMethod.POST)
//	public String memberLogin(MemberVO m, HttpSession session) {
//		System.out.println("ID : " + m.getId());
//		System.out.println("PWD : " + m.getPassword());
//
//		// 로그인 처리
//		MemberVO loginUser = mService.loginMember(m);
//		 
//	      try { // 로그인 성공했을 때
//	         
//	         if(loginUser.getId().equals("admin")) {
//	        	 return "manager/tables";
//	      
//	         }else if(loginUser !=null) {
//	        	 session.setAttribute("loginUser", loginUser);
//	        		
//	         }
//	      
//	         
//
//	      } catch (Exception e) { // 에러 났을 때
//	    	  return "common/ErrorPage"; 
//	         
//	       
//
//	      }
//	      return "home";
//		
//		
//	
//	}
	
	@RequestMapping(value="login.do",method=RequestMethod.POST)
	public String memberLogin(MemberVO m, Model model, HttpSession session) {
		System.out.println("ID : " + m.getId());
		System.out.println("PWD : " + m.getPassword());

		// 로그인 처리
		MemberVO loginUser = mService.loginMember(m);
		
	
	      try { // 로그인 성공했을 때
	         
	         if(loginUser.getId().equals("admin")&& bcryptPasswordEncoder.matches(m.getPassword(), loginUser.getPassword())) {
	        	 session.setAttribute("loginUser", loginUser);
	        	 return "manager/tables";
	      
	         }else if(loginUser !=null && bcryptPasswordEncoder.matches(m.getPassword(), loginUser.getPassword())) {
	        	 session.setAttribute("loginUser", loginUser);
	        	
	         }
	      
	         return "home";

	      } catch (Exception e) { // 에러 났을 때
	    	  session.setAttribute("msg","로그인 실패!");
	    	  return "common/ErrorPage"; 
	         
	       

	      }
	      
	}
	@RequestMapping("logout.do")
	public String logout(SessionStatus status) {
		
		// 세션의 상태를 확정지어주는 메소드 호출이 필요하다
		status.setComplete();
		return "redirect:login.do";
	}
	
	// 암호화 처리
//	@Autowired
//	private BCryptPasswordEncoder bcryptPasswordEncoder;

	//------------ 회원 가입 ----------------- //
		
		
	// 회원가입
		@RequestMapping(value="minsert.do",method= RequestMethod.POST)
		public String insertMember(MemberVO m, Model model,
								 	@RequestParam("postCode") String postCode,
								 	@RequestParam("roadAddress") String roadAddress,
								 	@RequestParam("detailAddress") String detailAddress,
								 	@RequestParam("email") String email,
								 	@RequestParam("email2") String email2) {
			System.out.println(m);
			System.out.println(postCode + ", " + roadAddress + ", " + detailAddress);
		System.out.println(bcryptPasswordEncoder.encode(m.getPassword()));
			
			String encPwd = bcryptPasswordEncoder.encode(m.getPassword());
			m.setPassword(encPwd);
			// 주소데이터들 ", "를 두고 저장
			if(!postCode.equals("")) {
				m.setAdrress(postCode + ", " + roadAddress + ", " + detailAddress);
			}
			// 이메일를 ""두고 저장
			if(!email.equals("")){
				m.setEmail(email + "" + email2);
			}
			System.out.println(m);
			
			// 이제 서비스로 이동
			int result = mService.insertMember(m);
			if(result > 0) {
				return "home";
			}else {
				model.addAttribute("msg","회원가입실패");
				return "common/ErrorPage";
			}
			
}
		}
