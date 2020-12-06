package com.kh.spring.member.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.inject.Inject;
import javax.security.auth.message.callback.PrivateKeyCallback.Request;
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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	public String memberLogin(MemberVO memberVo, Model model, HttpSession session,RedirectAttributes rtts) {
			log.info("로그인 확인");
			
		
		// 프로젝트 배포 시에 성능 저하를 막기위해 logger의 레벨이 DEBUG여부를 확인하는 조건문 제시
		if(log.isDebugEnabled()) {
			log.debug("로그인 확인 - debug");
		} 
		
		System.out.println("ID : " + memberVo.getId());
		System.out.println("PWD : " + memberVo.getPassword());

		// 로그인 처리
		MemberVO loginUser = mService.loginMember(memberVo);
		
	
	      try { // 로그인 성공했을 때
	         
	         if(loginUser.getId().equals("admin")&& bcryptPasswordEncoder.matches(memberVo.getPassword(), loginUser.getPassword())) {
	        	 model.addAttribute("loginUser", loginUser);
	        	
	        	 return "manager/tables";
	      
	         }else if(loginUser !=null && bcryptPasswordEncoder.matches(memberVo.getPassword(), loginUser.getPassword())) {
	        	 model.addAttribute("loginUser", loginUser);
	        	
	         }else {
	        	 model.addAttribute("loginUser", null); 
		    	  rtts.addFlashAttribute("msg",false);
	         }
	      
	         return "home";

	      } catch (Exception e) { // 에러 났을 때
	    	  model.addAttribute("msg", "로그인 에러 ");
	    	  return "common/ErrorPage";

	      }
	     
	}
	
	@RequestMapping("/KaKaologin.do")
    public String home(HttpServletResponse response,SessionStatus status,Model model,MemberVO memberVo,@RequestParam(value = "code", required = false) String code,HttpSession session
    		) throws Exception{
        try {
            String access_Token = kakaoService.getAccessToken(code);
            HashMap<String, Object> userInfo = kakaoService.getUserInfo(access_Token);
//          클라이언트의 이메일이 존재할 때 세션에 해당 이메일과 토큰 등록
            if (userInfo.get("email") != null) {
                session.setAttribute("userId", userInfo.get("email"));
                session.setAttribute("access_Token", access_Token);
            }
        	 String username =  (String) userInfo.get("nickname");
        	 String kakaopwd = bcryptPasswordEncoder.encode(String.valueOf(userInfo.get("id")));
        	 String email =  (String) userInfo.get("email");
        	 session.setAttribute("userInfo", userInfo);
        	 session.setAttribute("email", email);
        	 session.setAttribute("username", username);
        	 session.setAttribute("kakaopwd", kakaopwd);
        	 int result1 = mService.emailCheck(email);
 			if(result1 > 0) { // 중복 존재
 				return "home";
 			}else {
 				memberVo.setId(email);
 				memberVo.setPassword(kakaopwd);
 				memberVo.setUsername(username);
 				memberVo.setEmail(email);
 				int result = mService.insertkakao(memberVo);
 				if(result > 0) {
 					session.setAttribute("loginUser",memberVo);
 					return "redirect:home.do";
 				}else {
 					model.addAttribute("msg","회원가입실패");
 					return "common/ErrorPage";
 				}
 			}  
        }catch(NullPointerException e) {
        	e.getMessage();
}
     // 로그인 처리
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
		public String insertMember(MemberVO memberVo, Model  model,
								 	@RequestParam("postCode") String postCode,
								 	@RequestParam("roadAddress") String roadAddress,
								 	@RequestParam("detailAddress") String detailAddress,
								 	@RequestParam("email") String email,
								 	@RequestParam("email2") String email2) {
			System.out.println(memberVo);
			System.out.println(postCode + ", " + roadAddress + ", " + detailAddress);
		System.out.println(bcryptPasswordEncoder.encode(memberVo.getPassword()));
			
			String encPwd = bcryptPasswordEncoder.encode(memberVo.getPassword());
			memberVo.setPassword(encPwd);
			// 주소데이터들 ", "를 두고 저장
			if(!postCode.equals("")) {
				memberVo.setAddress(postCode + ", " + roadAddress + ", " + detailAddress);
			}
			// 이메일를 ""두고 저장
			if(!email.equals("")){
				memberVo.setEmail(email + "@" + email2);
			}
			System.out.println(memberVo);
			
			// 이제 서비스로 이동
			int result = mService.insertMember(memberVo);
			if(result > 0) {
				model.addAttribute("userinfo",memberVo);
				return "redirect:home.do";
			}else {
				model.addAttribute("msg","회원가입실패");
				return "common/ErrorPage";
			}
		
}
		public String saveFile(MultipartFile file, HttpServletRequest request) {
			
			// 파일이 저장될 경로를 설정하기
			// 웹 서버의 contextPath불러와서 폴더의 경로를 가져온다
			// webapp하위의 resources
			String root = request.getSession().getServletContext().getRealPath("resources");
			System.out.println("root : " + root);
			
			// 파일 경로
			// \를 문자로 인식시키기 위해서는 "\\"를 사용한다.
			String savePath = root + "\\buploadFiles";
			
			File folder = new File(savePath);
			
			if(!folder.exists()) {
				folder.mkdirs();	// 폴더가 없다면 생성한다.
			}
			
			// 파일명을 rename 과정을 추가--> "년월일시분초.확장자"로 변경
			String originalFileName = file.getOriginalFilename();
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis()))+"."
		           + originalFileName.substring(originalFileName.lastIndexOf(".")+1);
			
			String renamePath = folder +"\\"+renameFileName;//실제 저장될 파일 경로 + 파일명
			
			try {
				file.transferTo(new File(renamePath)); // 전달받은 file이 rename명으로 이때 파일이 저장된다.
			}catch(Exception e) {
				System.out.println("파일 정송 에러 " + e.getMessage());
			}
			
			return renameFileName;
		}
		public void deleteFile(String fileName, HttpServletRequest request) {
			String root = request.getSession().getServletContext().getRealPath("resources");
			String savePath = root + "\\buploadFiles";
			
			File f = new File(savePath + "\\" + fileName); // 기존에 업로드된 파일의 실제경로를 이용해서 file객체생성
			
			if(f.exists()) {
				f.delete();
			}
		}
		@ResponseBody
		@RequestMapping(value="fileupdate.do",method= RequestMethod.POST)
		public ModelAndView fileUpdate(ModelAndView mv,MemberVO memberVo, HttpServletRequest request,
				@RequestParam(value="UserFile",required=false) MultipartFile UserFile,@RequestParam("postCode") String postCode,
			 	@RequestParam("roadAddress") String roadAddress,
			 	@RequestParam("detailAddress") String detailAddress,
			 	@RequestParam("email") String email,
			 	@RequestParam("email2") String email2) {
			System.out.println(UserFile); 
			if(UserFile != null && !UserFile.isEmpty()) { // 새로 업로드된 파일이 있다면
				 if(memberVo.getRenameFileName() != null) { // 기존의 파일이 존재했을 경우 기존 파일 삭제해준다.
					 deleteFile(memberVo.getRenameFileName(),request);
				 }
				 
				 String renameFileName = saveFile(UserFile,request);
				 
				 if(renameFileName != null) {
					 memberVo.setOriginalFileName(UserFile.getOriginalFilename());
					 memberVo.setRenameFileName(renameFileName);
				 }
			 }
			 
			
			// 주소데이터들 ", "를 두고 저장
			if(!postCode.equals("")) {
				memberVo.setAddress(postCode + ", " + roadAddress + ", " + detailAddress);
			}
			// 이메일를 ""두고 저장
			if(!email.equals("")){
				memberVo.setEmail(email + "@" + email2);
			}
			 int result = mService.fileupdate(memberVo);
			
			 
			 if(result > 0) {
				 mv.addObject("loginUser", memberVo).setViewName("redirect:myPage.do");
			 }else {
				 mv.addObject("msg", "수정실패").setViewName("common/ErrorPage");
			 }
			 return mv;
		
		}
		
		// 회원정보 수정
				@RequestMapping(value="userUpdate.do",method= RequestMethod.POST)
				public String userUpdate(MemberVO memberVo,HttpServletRequest request, Model model,HttpSession session,
										 	@RequestParam("postCode") String postCode,
										 	@RequestParam("roadAddress") String roadAddress,
										 	@RequestParam("detailAddress") String detailAddress,
										 	@RequestParam("email") String email,
										 	@RequestParam("email2") String email2) {
					
					// 주소데이터들 ", "를 두고 저장
					if(!postCode.equals("")) {
						memberVo.setAddress(postCode + ", " + roadAddress + ", " + detailAddress);
					}
					// 이메일를 ""두고 저장
					if(!email.equals("")){
						memberVo.setEmail(email + "@" + email2);
					}
					
					// 이제 서비스로 이동
					int result = mService.updateMember(memberVo);
					MemberVO loginUser = mService.loginMember(memberVo);
					
					
					// 로그인 처리
					 if(result > 0) {
//						 model.addAttribute("userinfo", loginUser);
						 System.out.println("loginUser" + loginUser);
						 System.out.println("memberVo" +memberVo);
						 model.addAttribute("loginUser", loginUser);
						return "redirect:myPage.do";
					}else {
						model.addAttribute("msg","회원가입실패");
						return "common/ErrorPage";
					}
					
		}
		// 회원 탈퇴
				@RequestMapping("Withdrawal.do")
				public String memberDelete(SessionStatus status, String id, Model model) {
					
					
					
					int result = mService.deleteMember(id); 
					
				
					
					if(result > 0) {
						
						return "redirect:logout.do";
					}else {
						model.addAttribute("msg", "회원 탈퇴 실패!!");
						return "common/ErrorPage";
					}
				}
				// 비밀번호 수정
				@RequestMapping("ChangePassWord.do")
				public String ChangePassWord(SessionStatus status,MemberVO memberVo, Model model,
						@RequestParam("id") String id,
						@RequestParam("password") String pwd) {
					
					String encPwd = bcryptPasswordEncoder.encode(pwd);
					
					memberVo.setId(id);
					memberVo.setPassword(encPwd);
					
					int result = mService.findePwdSet(memberVo); 
					
				
					
					if(result > 0) {
						
						return "redirect:logout.do";
					}else {
						model.addAttribute("msg", "비밀번호 변경 실패!!");
						return "common/ErrorPage";
					}
				}
		
		@ResponseBody
		@RequestMapping("idCheck.do")
		public String idCheck(String id){
			
			MemberVO memberVo = new MemberVO();
			memberVo.setId(id);
			
			int result = mService.idCheck(id);
			System.out.println("나 여기있어"+result);
			if(result > 0) { // 중복 존재
				return "fail";
			}else {
				return "ok";
			}
		}
		
		@ResponseBody
		@RequestMapping("usercheck.do")
		public String usercheck(String id,String pwd){
		
			MemberVO memberVo  = new MemberVO();
			memberVo.setId(id);
			memberVo.setPassword(pwd);
			int result = mService.idCheck(id);
			System.out.println("나 여기있어"+result);
			MemberVO loginUser = mService.loginMember(memberVo);
			if(result > 0 &&  bcryptPasswordEncoder.matches(memberVo.getPassword(), loginUser.getPassword())) { // 중복 존재
				return "ok";
			}else {
				return "fail";
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
		@RequestMapping("pwdCheck.do")
		public String pwdCheck(String id,String pwd){
		
			MemberVO memberVo  = new MemberVO();
			memberVo.setId(id);
			memberVo.setPassword(pwd);
			int result = mService.idCheck(id);
			MemberVO loginUser = mService.loginMember(memberVo);
			if(result > 0 &&  bcryptPasswordEncoder.matches(memberVo.getPassword(), loginUser.getPassword())) { // 중복 존재
				return "ok";
			}else {
				return "fail";
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
