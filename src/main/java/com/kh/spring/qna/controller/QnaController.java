package com.kh.spring.qna.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.spring.common.Pagination;
import com.kh.spring.member.model.vo.MemberVO;
import com.kh.spring.qna.model.service.QnaService;
import com.kh.spring.qna.model.vo.QnaPageInfo;
import com.kh.spring.qna.model.vo.QnaVO;

@Controller
public class QnaController {
	
	@Autowired
	private QnaService qnaService;


	/**
	 * 1.qna게시글 보기
	 * @param mv 게시글정보
	 * @param currentPage 현재페이지
	 * @return
	 */
	@RequestMapping("QnaList.do")
	public ModelAndView QnaLookup(ModelAndView mv,
						@RequestParam(value="currentPage"
						, required=false, defaultValue="1") int currentPage) {
		System.out.println(currentPage);

		int listCount = qnaService.getListCount();
		System.out.println(listCount);
		
		QnaPageInfo pi = Pagination.getQnaPageInfo(currentPage, listCount);
		QnaVO qnaVo= new QnaVO();
		ArrayList<QnaVO> Qnalist = qnaService.qnaList(pi);
		System.out.println(qnaVo.getOriginalFileName());
		
	
		mv.addObject("list", Qnalist);
		mv.addObject("pi", pi);
		mv.setViewName("qna/qnaList");
		return mv;

	}
	/**
	 * 2.qna게시글 상세보기
	 * @param mv 게시글정보
	 * @param qnaId 게시글 번호
	 * @param currentPage 현재페이지
	 * @return
	 */
	@RequestMapping("qdetail.do")
	public ModelAndView QnaDetail(QnaVO qnalist,ModelAndView mv, int qnaId,
		   @RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage) {
		
		qnalist = qnaService.selectQna(qnaId);
		System.out.println("상세보기"+qnalist);
		if(qnalist != null) {
			mv.addObject("qnalist", qnalist)
			  .addObject("currentPage", currentPage)
			  .setViewName("qna/qdetail");
		}else {
			mv.addObject("msg", "게시글 상세조회 실패").setViewName("common/ErrorPage");
		}
		return mv;
	}

	
	/**
	 * 3. qna게시글 등록하기
	 * @param mv 게시글정보
	 * @param currentPage 현재페이지
	 * @return
	 */
	@RequestMapping("qnainsert.do")
	public String insertBoard(QnaVO qnaVo,HttpServletRequest request,
				@RequestParam(name="uploadFile",required=false) MultipartFile file) {
	
		if(!file.getOriginalFilename().equals("")) {
			// 서버에 업로드 해야한다.
			String renameFileName = saveFile(file,request);
			
			if(renameFileName != null) { // 파일이 잘 저장된 경우
				qnaVo.setOriginalFileName(file.getOriginalFilename()); // 파일명만 DB에저장
				qnaVo.setRenameFileName(renameFileName);
			}
		}
		
		int result = qnaService.insertqna(qnaVo);
		System.out.println("글등록값확인용"+qnaVo);
		if(result > 0) {
			
			return "redirect:QnaList.do";
		}else {
			return "common/ErrorPage";
		}
	}
	
	@RequestMapping("qupView.do")
	public ModelAndView boardUpdateView(ModelAndView mv, int qnaId) {
		mv.addObject("qnalist", qnaService.selectUpdateQna(qnaId))
		.setViewName("qna/qUpdate");
		return mv;
	}
	
	/**
	 * 4. qna게시글 수정하기
	 * @param mv 게시글정보
	 * @param currentPage 현재페이지
	 * @return
	 */
	@RequestMapping("qupdate.do")
	public ModelAndView boardUpdate(ModelAndView mv,QnaVO qnaVo, HttpServletRequest request,
			@RequestParam(value="uploadFile",required=false) MultipartFile file) {
		 if(file != null && !file.isEmpty()) { // 새로 업로드된 파일이 있다면
			 if(qnaVo.getRenameFileName() != null) { // 기존의 파일이 존재했을 경우 기존 파일 삭제해준다.
				 deleteFile(qnaVo.getRenameFileName(),request);
			 }
			 
			 String renameFileName = saveFile(file,request);
			 
			 if(renameFileName != null) {
				 qnaVo.setOriginalFileName(file.getOriginalFilename());
				 qnaVo.setRenameFileName(renameFileName);
			 }
		 }
		 
		 int result = qnaService.updateqna(qnaVo);
		 
		 if(result > 0) {
			 mv.addObject("qnaId", qnaVo.getQnaId()).setViewName("redirect:qdetail.do");
		 }else {
			 mv.addObject("msg", "수정실패").setViewName("common/ErrorPage");
		 }
		 return mv;
	}
	
	
	/**
	 * 5. qna게시글 삭제하기
	 * @param mv 게시글정보
	 * @param currentPage 현재페이지
	 * @return
	 */
	@RequestMapping("qdelete.do")
	public String boardDelete(int qnaId, HttpServletRequest request) {
		
		QnaVO qnaVo = qnaService.selectUpdateQna(qnaId);
		
		if(qnaVo.getRenameFileName() != null) {
			deleteFile(qnaVo.getRenameFileName(),request);
		}
		
		int result = qnaService.deleteqna(qnaId);
		
		if(result > 0) {
			return "redirect:QnaList.do";
		}else {
			return "common/ErrorPage";
		}
	}
	

	@RequestMapping("qnaFAQ.do")
	public ModelAndView boardTopList(HttpServletResponse response , ModelAndView mv) {
		ArrayList<QnaVO> Qnalist = qnaService.selectTopList();
		System.out.println("너 넘어왔어?"+Qnalist);
		mv.addObject("Qnalist", Qnalist);
		mv.setViewName("qna/qnaFAQ");
		
		
		return mv;
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
	
}
