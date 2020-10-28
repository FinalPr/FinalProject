package com.kh.spring.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.spring.board.model.service.BoardService;
import com.kh.spring.board.model.vo.BoardVO;

@Controller
public class BoardController {
	
	@Autowired
	BoardService boardService;
	
	@RequestMapping("/insertBoard.do")
	public String insertBoard(BoardVO bvo) {
		System.out.println("insertBoard.do");
		System.out.println(bvo);
		int result = boardService.insertBoard(bvo);
		return "home";
	}
	
	
}
