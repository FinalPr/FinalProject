package com.kh.spring.member.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.kh.spring.member.model.service.KakaoService;
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
	
	@Autowired
    private KakaoService kakaoService;
	
	private Logger log =LoggerFactory.getLogger(MemberController.class);
		
	@RequestMapping(value="login.do",method=RequestMethod.POST)
	public String memberLogin(MemberVO m, Model model, HttpSession session) {
			log.info("로그인 확인");
		
		// 프로젝트 배포 시에 성능 저하를 막기위해 logger의 레벨이 DEBUG여부를 확인하는 조건문 제시
		if(log.isDebugEnabled()) {
			log.debug("로그인 확인 - debug");
		} 
		
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
	
	@RequestMapping("/kakaologin.do")
    public String home(HttpServletResponse response,SessionStatus status,MemberVO m,ModelMap model,@RequestParam(value = "code", required = false) String code,HttpSession session) throws Exception{
		System.out.println("#########" + code);
        String access_Token = kakaoService.getAccessToken(code);
        HashMap<String, Object> userInfo = kakaoService.getUserInfo(access_Token);
        System.out.println("###access_Token#### : " + access_Token);
        System.out.println("###userInfo#### : " + userInfo.get("email"));
        System.out.println("###nickname#### : " + userInfo.get("nickname"));
        System.out.println("###profile_image#### : " + userInfo.get("profile_image"));
        
//      클라이언트의 이메일이 존재할 때 세션에 해당 이메일과 토큰 등록
        if (userInfo.get("email") != null) {
            session.setAttribute("userId", userInfo.get("email"));
            session.setAttribute("access_Token", access_Token);
        }
      
     // 로그인 처리
     		MemberVO loginUser = mService.loginMember(m);
     
        String nickname =  userInfo.get("nickname").toString();

        model.addAttribute("userInfo", userInfo);
    
        model.addAttribute("nickname", nickname);
        
        
        

    	return "home";
       
    }

	@RequestMapping(value="kakaologout.do")
	public String kakaologout(HttpSession session) {
		kakaoService.kakaoLogout((String)session.getAttribute("access_Token"));
	    session.removeAttribute("access_Token");
	    session.removeAttribute("userId");
	    session.invalidate();
	    return "redirect:login.do";
	}
	
	@RequestMapping("logout.do")
	public String logout(HttpSession session,SessionStatus status) {
		log.info("로그아웃 확인");
		
		if(log.isDebugEnabled()) {
			log.debug("로그아웃 확인 - debug");
		} 
		
		status.setComplete();
		session.invalidate();
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
				m.setEmail(email + "@" + email2);
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
		
		@ResponseBody
		@RequestMapping("idCheck.do")
		public String idCheck(String id){
			
			int result = mService.idCheck(id);
			
			if(result > 0) { // 중복 존재
				return "fail";
			}else {
				return "ok";
			}
		}
		@ResponseBody
		@RequestMapping("emailCheck.do")
		public String emailCheck(String email,
			 	 String email2){
			
			if(email!=null && !email.isEmpty() && 
					email2!=null && !email2.isEmpty()) {
				email = email + "@" + email2;
						}
			int result = mService.emailCheck(email);
			
			if(result > 0) { // 중복 존재
				return "fail";
			}else {
				return "ok";
			}
		}
		
		@ResponseBody
	    @RequestMapping(value = "VerifyRecaptcha", method = RequestMethod.POST)
	    public int VerifyRecaptcha(HttpServletRequest request) {
	        VerifyRecaptcha.setSecretKey("6LcNeOAZAAAAAFB9wLu998NXFxfMwi_GZUtyhYfM");
	        String gRecaptchaResponse = request.getParameter("recaptcha");
	        System.out.println(gRecaptchaResponse);
	        //0 = 성공, 1 = 실패, -1 = 오류
	        try {
	            if(VerifyRecaptcha.verify(gRecaptchaResponse))
	                return 0;
	            else return 1;
	        } catch (IOException e) {
	            e.printStackTrace();
	            return -1;
	        }
	    }


		
		}
