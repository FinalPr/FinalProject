package com.kh.spring.common;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ChangeView {
	
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
	
	@RequestMapping("/qnaList.do")
	public String qnaList() {
		return "/qna/qnaList";
	}
	
	@RequestMapping("/qnaFAQ.do")
	public String qnaFAQ() {
		return "/qna/qnaFAQ";
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
	
	
}
