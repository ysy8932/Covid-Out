package spring.board.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import spring.board.dao.BoardDao;
import spring.dto.BoardDto;
import spring.dto.BoardPhotoDto;
import spring.dto.MemberDto;
import upload.util.SpringFileWriter;


@Controller
public class BoardController {
	
	@Autowired
	private BoardDao dao;
	
	@GetMapping({"/board/list"})
	   public String goboard(
			   @RequestParam(value="pageNum",defaultValue="1")int currentPage,
				Model model
			   ) 
	 {	
		
		
		
	  int totalCount = dao.getTotalCount();
	  // System.out.println(totalCount);
	   
	   int perPage=5;       //이런 한글이 왜 깨지는 거야
	   int perBlock=4;     // 한글 나쁜놈 왜 깨지는 거징ㅠㅠ
	   int totalPage;      //
	   int startPage;      //
	   int endPage;      //
	   int start;         //

	   
	   totalPage=totalCount/perPage+(totalCount%perPage>0?1:0);
	   
	   
	   startPage=(currentPage-1)/perBlock*perBlock+1;
	   endPage=startPage+perBlock-1;
	   
	   
	   if(endPage>totalPage)
	      endPage=totalPage;
	   
	   
	   start=(currentPage-1)*perPage;
	   
	   
	   int no = totalCount-(currentPage-1)*perPage;
	   
	  
	   List<BoardDto> list =dao.getList(start, perPage);
	   
	  // @Autowired
	
	   if(list.size()==0)
	   {
		   
		   return "redirect:list?pageNum="+(currentPage-1);
		   
	   }
	   
		
	   //hashtag 불러오는 함수들//
	   
	   List<BoardDto> hashlist = dao.getTagList();
	   
	   
	   //// 각 글 리스트 따오기
	   
	   
	   //List<BoardDto> boardtaglist = dao.getOneTagList();
	   
	   
	//////////////////////////////////   
	   model.addAttribute("currentPage",currentPage);
	   model.addAttribute("list",list);
	   model.addAttribute("hashlist",hashlist);
	   //model.addAttribute("boardtaglist",boardtaglist);
	   model.addAttribute("no",no);
	   model.addAttribute("startPage",startPage);
	   model.addAttribute("endPage",endPage);
	   model.addAttribute("totalPage",totalPage);	  
	   model.addAttribute("totalCount",totalCount);
	   
	    return "/board/boardlist";
	 }
	
	
	@GetMapping({"/board/boardwrite"})
	   public ModelAndView gobowrite(HttpServletRequest request,
				@RequestParam(value="regroup",defaultValue="0") int regroup,
				@RequestParam(value="restep",defaultValue="0") int restep,
				@RequestParam(value="relevel",defaultValue="0") int relevel,
				@RequestParam(defaultValue="1") String pageNum
			   
			   )
	{	
		ModelAndView mview=new ModelAndView();
		HttpSession session = request.getSession();
	    //String name = (String) session.getAttribute("loginid");
	    MemberDto mdto=(MemberDto)request.getSession().getAttribute("mdto");
	    
	    mview.addObject("mdto",mdto);
	    //mview.addObject("name",name);
	    mview.addObject("regroup",regroup);
		mview.addObject("restep",restep);
		mview.addObject("relevel",relevel);
		mview.addObject("pageNum",pageNum);
	    
		mview.setViewName("/board/boardwriteform");
	    return mview;
	}
	
	
	
	@PostMapping("/board/write")
	public String write(
			@ModelAttribute BoardDto dto,
			HttpServletRequest request,
			@RequestParam MultipartFile file,
			@RequestParam String pageNum
			)
	{
		String path = request.getSession().getServletContext().getRealPath("/resources/save");
		System.out.println(path);
		
		SpringFileWriter writer = new SpringFileWriter();
		String fileName=writer.changeFilename(file.getOriginalFilename());
		
		writer.writeFile(file, fileName, path);
		
		dto.setBphoto(fileName);
		
		dao.insertBoard(dto);
		
		///hashtag update
		String hbnum = dao.getHbnum(fileName);
		System.out.println("hbnum is : "+hbnum);
		
		dao.updateHashtag(hbnum);
		
		return "redirect:list?pageNum="+pageNum;
	}
	
	
}
