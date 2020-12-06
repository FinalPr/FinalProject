package com.kh.spring.common;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.support.SessionStatus;

@Controller
public class ChangeView {
	@RequestMapping("/chatpage.do")
	public String chat(){
		System.out.println("??");
		return "/chat/chat";
	}
	
	@RequestMapping("/login.do")
	public String login(){
		return "/member/login";
	}
	
	@RequestMapping("/myPage.do")
	public String maypage() {
		return "/myPage/myPage";
	}
	@RequestMapping("/myTag.do")
	public String myTag() {
		return "/myPage/myTag";
	}
	
	@RequestMapping("/boardDetail.do")
	public String boardDetail() {
		return "/board/boardDetail";
	}
	
	@RequestMapping("/home.do")
	public String home() {
		return "home";
	}
	
	@RequestMapping("/boardWrite.do")
	public String boardWrite() {
		return "/board/boardWrite";
	}
	
	@RequestMapping("/boardList.do")
	public String boardList() {
		return "board/boardList";
	}
	
	@RequestMapping("/buyList.do")
	public String buyList(){
		return "/myPage/buyList";
	}
	
	@RequestMapping("/sellList.do")
	public String sellList(){
		return "/myPage/sellList";
	}
	
	@RequestMapping("/pickList.do")
	public String pickList(){
		return "/myPage/pickList";
	}
	
	@RequestMapping("/checkList.do")
	public String checkList(){
		return "/myPage/checkList";
	}
	
	@RequestMapping("/myShop.do")
	public String myShop(){
		return "/myPage/myShop";
	}
	
	@RequestMapping("/qnaQury.do")
	public String qnaQury() {
		return "/qna/qnaQury";
	}
	
	@RequestMapping("/SignUp.do")
	public String SignUp() {
		return "/member/SignUp";
	}
	
	@RequestMapping("findId.do")
	public String findId(){
		return "/member/find";
	}
	
	@RequestMapping("findPwd.do")
	public String findPwd(){
		return "/member/find";
	}
	
	@RequestMapping("TermsofUse.do")
	public String TermsofUse(){
		return "/Notice/TermsofUse";
	}
	@RequestMapping("PrivacyStatement.do")
	public String PrivacyStatement(){
		return "/Notice/PrivacyStatement";
	}
	@RequestMapping("Aboutus.do")
	public String Aboutus(){
		return "/Notice/Aboutus";
	}
	@RequestMapping("enrollView.do")
	public String enrollView() {
		return "member/memberInsertForm";
	}
	
	@RequestMapping("tables.do")
	public String tables() {
		return "/manager/tables";
	}
	@RequestMapping("userInfoUpdate.do")
	public String userInfoUpdate() {
		return "/myPage/userInfoUpdate";
	}
	@RequestMapping("WithdrawalPage.do")
	public String Withdrawal() {
		return "/myPage/Withdrawal";
	}
	@RequestMapping("ChangePasswordPage.do")
	public String ChangePassword() {
		return "/myPage/ChangePassword";
	}
}
