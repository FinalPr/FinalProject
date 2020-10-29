package com.kh.spring.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.spring.member.model.service.MemberService;
import com.kh.spring.member.model.vo.MemberVO;
@SessionAttributes("loginUser") // Model에 loginUser라는 키값으로 객체가 추가되면 자동으로 세션에추가하라는 의미의 어노테이션
@Controller 
public class MemberController {
	@Autowired
	private MemberService mService;
	
	// 암호화 처리
//	@Autowired
//	private BCryptPasswordEncoder bcryptPasswordEncoder;

	//------------ 회원 가입 ----------------- //
		@RequestMapping("enrollView.do")
		public String enrollView() {
			return "member/memberInsertForm";
		}
		
	// 회원가입
		@RequestMapping("minsert.do")
		public String insertMember(MemberVO m, Model model,
								 	@RequestParam("postCode") String postCode,
								 	@RequestParam("roadAddress") String roadAddress,
								 	@RequestParam("detailAddress") String detailAddress,
								 	@RequestParam("email") String email,
								 	@RequestParam("email2") String email2) {
			System.out.println(m);
			System.out.println(postCode + ", " + roadAddress + ", " + detailAddress);
//			System.out.println(bcryptPasswordEncoder.encode(m.getPassword()));
			
			String encPwd =m.getPassword();
			m.setPassword(encPwd);
			// 주소데이터들 ", "를 두고 저장
			if(!postCode.equals("")) {
				m.setAdrress(postCode + ", " + roadAddress + ", " + detailAddress);
			}
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
