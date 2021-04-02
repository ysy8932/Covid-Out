package spring.board.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.board.dao.BoardDao;
import spring.board.dao.BoardDaoInter;
import upload.util.SpringFileWriter;

@Controller
public class BoardDelController {
	
	@Autowired
	private BoardDao dao;
	
	
	@GetMapping("/board/deletepassform")
	public ModelAndView delform(
			@RequestParam String num
			) {
		ModelAndView mview = new ModelAndView();
		mview.addObject("num", num);
		//mview.addObject("pageNum",pageNum);
		
		mview.setViewName("/board/boarddelete");
		return mview;
	}
	
	
	@PostMapping("/board/delete")
	public String deleteBoard(
			@RequestParam String num,
			HttpServletRequest request
			) {
			
		
		String path=request.getSession().getServletContext().getRealPath("/resources/save");
		System.out.println(path);
		//db에 저장된 파일명 얻기
		String deleteFile=dao.getData(num).getBphoto();
		//저장된 파일 먼저 삭제
		if(!deleteFile.equals("no"))
		{
			File file=new File(path+"\\"+deleteFile);
			if(file.exists())
				file.delete();
		}
			dao.deleteBoard(num);
			return "redirect:list?";
			
		}
	

}
