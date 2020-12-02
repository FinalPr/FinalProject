package com.kh.spring.board.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.security.Provider.Service;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.RowBounds;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.spring.board.model.service.BoardService;
import com.kh.spring.board.model.vo.BoardVO;
import com.kh.spring.board.model.vo.CommentVO;
import com.kh.spring.board.model.vo.PageInfo;
import com.kh.spring.board.model.vo.ZzimVO;
import com.kh.spring.common.BoardPagination;
import com.kh.spring.member.model.vo.MemberVO;

@Controller
public class BoardController {



	@Autowired
	BoardService boardService;



	@RequestMapping("/insertBoard.do")
	public String insertBoard(BoardVO bvo,HttpServletRequest request,
			MultipartFile file[]) {
		System.out.println("insertBoard.do");
		MemberVO mvo =(MemberVO)request.getSession().getAttribute("loginUser");
		bvo.setCategory( bvo.getCategory().replace('/', '_').replace('>', '-'));
		bvo.setWriter(mvo.getId());
		bvo.setNo(boardService.getBoardCount(bvo));
		if(file.length != 0) {
			for(int i =0;i<file.length;i++) {
				System.out.println(file[i].getOriginalFilename());
			}
			if(!file[0].getOriginalFilename().equals("")) {
				String originalFileName=file[0].getOriginalFilename();
				String renameFileName =saveFile(file[0],request,0,bvo);
				for(int i =1;i<file.length;i++) {
					originalFileName +=","+file[i].getOriginalFilename();
					renameFileName	+=","+saveFile(file[i],request,i,bvo);
				}
				if(renameFileName != null) {
					bvo.setOriginalFileName(originalFileName);
					bvo.setRenameFileName(renameFileName);
				}
			}
		}
		System.out.println(bvo);
		boardService.insertBoard(bvo);

		return "redirect:boardWrite.do";
	}
	public String saveFile(MultipartFile file, HttpServletRequest request,int count,BoardVO bvo) {

		String root = request.getSession().getServletContext().getRealPath("resources");
		System.out.println("root : " + root);

		String savePath = root +"\\" + bvo.getCategory()+"\\"+bvo.getNo() ;
		System.out.println(savePath);
		File folder = new File(savePath);

		if(!folder.exists()) {
			folder.mkdirs();
		}

		String originalFileName = file.getOriginalFilename();

		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis()))+count+"."
				+ originalFileName.substring(originalFileName.lastIndexOf(".")+1);

		String renamePath = folder +"\\"+renameFileName;

		try {
			file.transferTo(new File(renamePath));
		}catch(Exception e) {
			System.out.println("파일 정송 에러 " + e.getMessage());
		}

		return renameFileName;
	}

	@RequestMapping("/openBoardList.do")
	public ModelAndView openBoardList(@RequestParam("category") String category,ModelAndView mav){
		System.out.println("openBoardList.do");
		System.out.println(category);
		mav.setViewName("board/boardList");
		return mav.addObject("category",category);
	}

	@ResponseBody
	@RequestMapping(value="/getBoardList.do",produces="application/json; charset=UTF-8")
	public String getBaordList(@ModelAttribute BoardVO bvo,ArrayList<BoardVO> BoardList,HttpServletRequest request,
			@RequestParam("curpage") int curpage
			,@RequestParam("searchTitleinList") String searchTitleinList
			,@RequestParam("searchPrice1") String searchPrice1
			,@RequestParam("searchPrice2") String searchPrice2
			,@RequestParam("searchCount") String searchCount
			,@RequestParam("searchSort") String searchSort) throws JsonParseException, JsonMappingException, IOException {
		System.out.println("BoardList!!!");

		MemberVO mvo = (MemberVO)request.getSession().getAttribute("loginUser");
		String arr[] =bvo.getCategory().split(">");
		System.out.println(arr[0]);
		bvo.setCategory(bvo.getCategory().replace('/', '_').replace('>', '-'));
		Map<String, Object> map=new HashMap<String, Object>();
		int count;
		if(searchCount != "") {
			System.out.println("if");
			map.put("bvo", bvo);
			map.put("searchTitleinList",searchTitleinList);
			if(searchPrice1 !="") {
				System.out.println("searchPrice1");
				map.put("searchPrice1",Integer.parseInt(searchPrice1));
				System.out.println(map.get("searchPrice1"));
			}
			if(searchPrice2 !="") {
				map.put("searchPrice2",Integer.parseInt(searchPrice2));
				System.out.println(map.get("searchPrice2"));
			}
			map.put("searchSort", searchSort);
			map.put("mvo", mvo);
			count=Integer.parseInt(searchCount);
		}else {
			System.out.println("else");
			map.put("bvo", bvo);
			count = 18;
			map.put("mvo",mvo);
		}

		int offset = (curpage -1) * count;
		RowBounds rowBounds = new RowBounds(offset,count);
		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		ArrayList<BoardVO> arrList;


		switch (arr[0]) {
		case "검색":
			bvo.setTitle(arr[1]);
			map.put("bvo", bvo);
			System.out.println(map.get("bvo"));
			arrList=boardService.getBoardSearchList(map, rowBounds);
			System.out.println(arrList);
			break;
		case "Main":
			arrList=boardService.getBoardMainList(map, rowBounds);	
			break;
		default:
			arrList=boardService.getBoardList(map, rowBounds);
			System.out.println(arrList);
			break;
		}

		String jsonStiring = gson.toJson(arrList);
		return jsonStiring;  

	}

	@RequestMapping("getMyList.do")
	public ModelAndView getMyList(HttpServletRequest request,ModelAndView mav,String value,@RequestParam(value="curpage"
			, required=false, defaultValue="1") int curpage){

		System.out.println("getMyList");
		MemberVO mvo = (MemberVO)request.getSession().getAttribute("loginUser");
		int offset = (curpage -1) * 12;
		RowBounds rowBounds = new RowBounds(offset,12);
		int listCount ;
		PageInfo pi =null;
		ArrayList<BoardVO> boardList = null;
		switch (value) {
		case "판매내역":
			boardList = boardService.getSellList(mvo, rowBounds);
			listCount = boardService.getSellListCount(mvo);
			pi = BoardPagination.getPageInfo(curpage, listCount);
			break;
		case "구매내역":
			boardList = boardService.getBuyList(mvo, rowBounds);
			listCount = boardService.getBuyListCount(mvo);
			pi = BoardPagination.getPageInfo(curpage, listCount);
			break;
		case "찜목록":
			boardList = boardService.getZzimList(mvo, rowBounds);
			listCount = boardService.getZzimListCount(mvo);
			pi = BoardPagination.getPageInfo(curpage, listCount);
			break;
		case "최근본상품":
			boardList = boardService.getLookList(mvo, rowBounds);
			listCount = boardService.getLookListCount(mvo);
			pi = BoardPagination.getPageInfo(curpage, listCount);
			break;
		case "내상품목록":
			boardList = boardService.getMyList(mvo,rowBounds);
			listCount = boardService.getMyListCount(mvo);
			pi = BoardPagination.getPageInfo(curpage, listCount);
			break;
		}
		System.out.println(boardList);
		System.out.println(boardList.size());
		for(int i =0; i < boardList.size();i++) {
			String[] arr=boardList.get(i).getRenameFileName().split(",");
			boardList.get(i).setRenameFileName(arr[0]);	
			}
		mav.addObject("value",value);
		mav.addObject("boardList",boardList);
		mav.addObject("pi",pi);
		mav.setViewName("myPage/myListPage");
		return mav;
	}

	@RequestMapping("/getBoardDetail.do")
	public ModelAndView BoardDetail(BoardVO bvo, ModelAndView mav,HttpServletRequest request) {

		System.out.println("getBoardDetail.do");
		bvo.setCategory(bvo.getCategory().replace('/', '_').replace('>', '-'));
		bvo = boardService.getBoardDetail(bvo);
		MemberVO mvo = (MemberVO)request.getSession().getAttribute("loginUser");
		if(mvo != null) {
			Map<String, Object> map=new HashMap<String, Object>();
			map.put("bvo", bvo);
			map.put("mvo",mvo);
			ZzimVO tmp = boardService.selectLook(map);
			if(tmp != null) {

				boardService.updateLook(map);
			}else {
				boardService.insertLook(map);
			}

		}
		mav.addObject("commentList",boardService.getCommentList(bvo));
		String imageList[] = bvo.getRenameFileName().split(",");
		System.out.println(bvo);
		System.out.println(imageList[0]);
		mav.addObject("imageList",imageList);
		mav.addObject("board",bvo);
		mav.setViewName("board/boardDetail");
		return mav;
	}

	@RequestMapping("/updateBoard")
	public String updateBoard(BoardVO bvo) {
		System.out.println("updateBoard");
		int result = boardService.updateBoard(bvo);
		if(result > 0) {
			return "redirect:getBoardDetail.do";
		}else {
			return "/common/error";
		}

	}

	@RequestMapping("/deleteBoard")
	public String deleteBoard(BoardVO bvo) {
		System.out.println("deleteBoard");
		int result = boardService.deleteBoard(bvo);
		return "redirect:getBoardList.do";
	}

	@ResponseBody
	@RequestMapping(value="zzim.do",produces="application/string; charset=UTF-8")
	public String zzim(ZzimVO zvo,HttpServletRequest request){
		System.out.println("zzim.do");
		MemberVO mvo =(MemberVO)request.getSession().getAttribute("loginUser");
		zvo.setId(mvo.getId());


		System.out.println(zvo);


		ZzimVO resultZzim= boardService.selectZzim(zvo);

		int result =0;

		if(resultZzim == null) {
			result = boardService.insertZzim(zvo);
			if(result > 0) {

				return "insert";
			}else {
				return "fail";
			}
		}else {
			result = boardService.deleteZzim(zvo);
			if(result > 0) {

				return "delete";
			}else {
				return "fail";
			}
		}




	}

	@ResponseBody
	@RequestMapping(value="getSellList.do",produces="application/json; charset=UTF-8")
	public String getSellList(String check,HttpServletRequest request,int count,int curpage) {
		MemberVO mvo = (MemberVO)request.getSession().getAttribute("loginUser");
		Gson gson = new GsonBuilder().setPrettyPrinting().create();

		int offset = (curpage -1) * count;
		RowBounds rowBounds = new RowBounds(offset,count);


		ArrayList<BoardVO> boardList = null;


		boardList = boardService.getSellList(mvo,rowBounds);

		String jsonStiring = gson.toJson(boardList);
		return jsonStiring;
	}

	@ResponseBody
	@RequestMapping(value="getBuyList.do",produces="application/json; charset=UTF-8")
	public String getBuyList(String check,HttpServletRequest request,int count,int curpage) {
		MemberVO mvo = (MemberVO)request.getSession().getAttribute("loginUser");
		Gson gson = new GsonBuilder().setPrettyPrinting().create();

		int offset = (curpage -1) * count;
		RowBounds rowBounds = new RowBounds(offset,count);


		ArrayList<BoardVO> boardList = null;

		boardList = boardService.getBuyList(mvo,rowBounds);

		String jsonStiring = gson.toJson(boardList);
		return jsonStiring;
	}


	@ResponseBody
	@RequestMapping(value="getLookList.do",produces="application/json; charset=UTF-8")
	public String getLookList(HttpServletRequest request,
			int count,int curpage) {
		System.out.println("getLookList.do");
		MemberVO mvo = (MemberVO)request.getSession().getAttribute("loginUser");
		Gson gson = new GsonBuilder().setPrettyPrinting().create();

		int offset = (curpage -1) *count;
		RowBounds rowBounds = new RowBounds(offset,count);


		ArrayList<BoardVO> boardList = boardService.getLookList(mvo,rowBounds);
		System.out.println(boardList);
		String jsonStiring = gson.toJson(boardList);
		return jsonStiring;
	}
	@ResponseBody
	@RequestMapping(value="getZzimList.do",produces="application/json; charset=UTF-8")
	public String getZzimList(HttpServletRequest request,int count,int curpage) {
		MemberVO mvo = (MemberVO)request.getSession().getAttribute("loginUser");
		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		System.out.println("getZzimList");
		int offset = (curpage -1) * count;
		RowBounds rowBounds = new RowBounds(offset,count);


		ArrayList<BoardVO> boardList = boardService.getZzimList(mvo,rowBounds);
		System.out.println(boardList);
		String jsonStiring = gson.toJson(boardList);

		return jsonStiring;
	}

	@ResponseBody
	@RequestMapping(value="category.do",produces="application/json; charset=UTF-8")
	public String category(BoardVO bvo,String value) {
		System.out.println("category.do");
		System.out.println(value);
		JSONObject job = new JSONObject();
		Properties prop = new Properties();


		try {

			InputStream is = getClass().getResourceAsStream("/category/category.properties");

			prop.load(is);
			String result = new String(prop.getProperty(new String(new String(value).getBytes(),"ISO-8859-1")).getBytes("ISO-8859-1"),"UTF-8");
			System.out.println(result);
			job.put("result", result);

		}catch(Exception e) {
			System.out.println("널 !");
			job.put("result", "thisisLast!");
		}




		return job.toString();
	}


	@RequestMapping("/getCommentList.do")
	public ArrayList<CommentVO> getCommentList(BoardVO bvo) {

		return boardService.getCommentList(bvo);
	}
	@ResponseBody
	@RequestMapping(value="getCommentRenewal.do",produces="application/json; charset=UTF-8")
	public String getCommentRenewal(BoardVO bvo) {

		System.out.println("getCommentRenewal!");
		System.out.println(bvo);
		bvo = boardService.getBoardDetail(bvo);
		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		ArrayList<CommentVO> commentList= boardService.getCommentList(bvo);
		System.out.println(bvo);
		String jsonStiring = gson.toJson(commentList);
		return jsonStiring; 
	}


	@ResponseBody
	@RequestMapping(value="/insertComment.do",produces="application/String; charset=UTF-8")
	public String insertComment(@ModelAttribute CommentVO cvo,HttpServletRequest request) {
		System.out.println("insertCommnet");
		MemberVO mvo =(MemberVO)request.getSession().getAttribute("loginUser");
		cvo.setWriter(mvo.getId());
		System.out.println(cvo);
		int result = boardService.insertComment(cvo);
		if(result > 0) {
			return "succeed";
		}else {
			return "error";	
		}

	}

	@ResponseBody
	@RequestMapping("/deleteComment.do")
	public String deleteComment(CommentVO cvo) {
		int result = boardService.deleteComment(cvo);

		if(result > 0) {
			return "succeed";
		}else {
			return "error";	
		}
	}

	@ResponseBody
	@RequestMapping("/updateComment.do")
	public String updateComment(CommentVO cvo) {
		int result = boardService.updateComment(cvo);

		if(result> 0) {
			return "succeed";
		}else {
			return "error";
		}
	}


}
