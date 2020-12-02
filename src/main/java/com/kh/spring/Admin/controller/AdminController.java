package com.kh.spring.Admin.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spring.Admin.model.service.AdminService;
import com.kh.spring.Admin.model.vo.AdminPageInfo;
import com.kh.spring.Admin.model.vo.AdminVo;
import com.kh.spring.common.Pagination;
@Controller
public class AdminController {

	@Autowired
	private AdminService aService;
	
	/**
	 * 1. 게시글 목록조회
	 * @param mv
	 * @param currentPage
	 * @return
	 */
	@RequestMapping("Declarationl.do")
	public ModelAndView Declarationl(ModelAndView mv,
						@RequestParam(value="currentPage"
						, required=false, defaultValue="1") int currentPage) {
		System.out.println(currentPage);
		
		int listCount = aService.getListCount();
		System.out.println(listCount);
		
		AdminPageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<AdminVo> list = aService.selectList(pi);
		
		mv.addObject("list", list);
		mv.addObject("pi", pi);
		mv.setViewName("manager/DeclarationlistView");
		return mv;
	}
	
}
