package spring.board.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import spring.answer.dao.AnswerDao;
import spring.board.dao.BoardDao;
import spring.dto.AnswerDto;
import spring.dto.BoardDto;
import spring.dto.MemberDto;
import upload.util.SpringFileWriter;


@Controller
public class BoardUpdController {
	
	@Autowired
	private BoardDao dao;
	
	@Autowired
	private AnswerDao adao;
	
	@GetMapping("/board/updatepassform")
	public ModelAndView passform(
			@RequestParam String num,
			@RequestParam String pageNum,
			HttpServletRequest request
			) {
		
		ModelAndView mview = new ModelAndView();
		
		BoardDto dto=dao.getData(num);
		HttpSession session = request.getSession();
		MemberDto mdto=(MemberDto)request.getSession().getAttribute("mdto");
	    //해시태그 리스트 
		List<BoardDto> hdto = dao.getOneTagList(num);
		
		
		mview.addObject("hdto",hdto);
		mview.addObject("num", num);
		mview.addObject("mdto",mdto);
		mview.addObject("dto", dto);
		mview.addObject("pageNum", pageNum);
		mview.setViewName("/board/boardupdateform");
		return mview;
		
	}
	
	@PostMapping("/board/update")
	public ModelAndView bupdate(
			@ModelAttribute BoardDto dto,
			@RequestParam MultipartFile file,
			@RequestParam String pageNum,
			HttpServletRequest request
			) {
		
		ModelAndView mview = new ModelAndView();
		MemberDto mdto=(MemberDto)request.getSession().getAttribute("mdto");
		String path = request.getSession().getServletContext().getRealPath("/resources/save");
		System.out.println(path);
		
		SpringFileWriter writer = new SpringFileWriter();
		String fileName=writer.changeFilename(file.getOriginalFilename());
		
		writer.writeFile(file, fileName, path);
		
		//저장된 파일 먼저 삭제
		System.out.println("delete file : "+Integer.toString(dto.getBnum()));
		
		
		String deleteFile=dao.getData(Integer.toString(dto.getBnum())).getBphoto();
		if(!deleteFile.equals("no"))
		{
			File files=new File(path+"\\"+deleteFile);
			if(files.exists())
				files.delete();
		}
		
		dto.setBphoto(fileName);
		
		dao.updateBoard(dto);
		mview.addObject("mdto", mdto);
		mview.addObject("dto",dto);
		mview.setViewName("redirect:boardcontent?bnum="+dto.getBnum()+"&pageNum="+pageNum);
		return mview;			
	}
	
	///댓글 수정!@@@@@@@@@
	@GetMapping("/board/answerupdpass")
	public ModelAndView anspassform(
			@RequestParam String aidx,
			HttpServletRequest request
			) {
		
		ModelAndView mview = new ModelAndView();
		
		
		AnswerDto adto= adao.getData(aidx);
		
		mview.addObject("aidx", aidx);
		mview.addObject("adto", adto);
		mview.setViewName("/board/AnswerUpdateForm");
		return mview;
		
	}
	
	@PostMapping("board/ansupdate")
	public String ansupdate(
			@ModelAttribute AnswerDto adto,
			HttpServletRequest request
			) {
		
		adao.updateAnswer(adto);
		return "board/list";				
	}
	

}
