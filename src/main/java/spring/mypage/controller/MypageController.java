package spring.mypage.controller;



import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.board.dao.BoardDao;
import spring.dto.BoardDto;
import spring.dto.MemberDto;


@Controller
public class MypageController {
	
	@Autowired
	private BoardDao bdao;

	//마이페이지 메인
	@GetMapping("/mypage.main")
	public String goMypage()
	{
		return "/mypage/main";
	}
	
	//내 정보
	@GetMapping("/mypage.information")
	public String goMypageinformation()
	{
		return "/mypage/myinformation";
	}
	
	//내 스크랩
//	@GetMapping("/mypage.scrap")
//	public String goMypagescrap()
//	{
//		return "/mypage/myscrap";
//	}
	
	//내 예약
//	@GetMapping("/mypage.reservation")
//	public String goMypagereservation()
//	{
//		return "/mypage/myreservation";
//	}
//	
	//내가 쓴 글
	@GetMapping("/mypage.content")
	public String goMypagecontent(Model model,
			@RequestParam(value="pageNum",defaultValue="1")int currentPage,
			HttpServletRequest request)
	{
		
		HttpSession session = request.getSession();
		MemberDto mdto=(MemberDto)request.getSession().getAttribute("mdto");
		
		int mid = mdto.getMnum(); 
		
		///////////////////////////////////
		
		 int totalCount = bdao.getMyCount(Integer.toString(mid));
		  // System.out.println(totalCount);
		   
		   int perPage=9;       //이런 한글이 왜 깨지는 거야
		   int perBlock=3;     // 한글 나쁜놈 왜 깨지는 거징ㅠㅠ
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
		
		//////////////////////////////////////
		
		
		//System.out.println(mid);
		List<BoardDto> list = bdao.getMyBoard(mid,start,perPage);
		
		model.addAttribute("mdto",mdto);
		model.addAttribute("list",list);
		model.addAttribute("currentPage",currentPage);
		model.addAttribute("startPage",startPage);
		   model.addAttribute("endPage",endPage);
		   model.addAttribute("totalPage",totalPage);	  
		   model.addAttribute("totalCount",totalCount);
		
		
		return "/mypage/mycontents";
	}

	
}
