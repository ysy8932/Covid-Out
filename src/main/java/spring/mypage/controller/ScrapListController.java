package spring.mypage.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import spring.dto.BoardDto;
import spring.dto.CardDto;
import spring.dto.MemberDto;
import spring.dto.ScrapDto;
import spring.scrap.dao.ScrapDaoInter;

@Controller
public class ScrapListController {

	@Autowired
	private ScrapDaoInter scrapdi;
	
	@GetMapping("/mypage.scrap")
	public String scrapBoardList(Model model,HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value="pageNum",defaultValue="1") int currentPage)
	{
		HttpSession session = request.getSession();
        MemberDto mdto=(MemberDto)request.getSession().getAttribute("mdto");
        
        int smidnum = mdto.getMnum();
        
        
		int totalCount = scrapdi.getTotalbCount(smidnum);
		
		int perPage=6; //한페이지당 보여질 글의 갯수
		int perBlock=3; //한블럭당 출력할 페이지의 갯수
		int totalPage;//총 페이지의 갯수
		int startPage;//각 블럭당 시작 페이지번호
		int endPage;//각 블럭당 끝 페이지번호
		int start;//각 블럭당 불러올 글의 시작번호
		
		totalPage=totalCount/perPage+(totalCount%perPage>0?1:0);
		startPage=(currentPage-1)/perBlock*perBlock+1;
		endPage=startPage+perBlock-1;
		if(endPage>totalPage)
			endPage=totalPage;
		
		//mysql 은 첫 글이 0번(오라클은 1번)
		start=(currentPage-1)*perPage;

		//각 페이지에서 출력할 시작번호
		//총 50개일경우 1페이지는 50
		//2페이지는 40
		int no=totalCount-(currentPage-1)*perPage;
		
		///////////////////////////////페이징 끝///////////////////////////////
		
		List<BoardDto> list = scrapdi.getbScrapList(start, perPage, smidnum);
		
		if(totalCount>0)
		{
			if(list.size()==0) { 
				return "redirect:mypage.scrap?pageNum="+(currentPage-1);
			}
		}

		//model에 저장
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("list", list);
		model.addAttribute("no", no);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("totalPage", totalPage);
		
		return "/mypage/myscrap";
	}
	
	@GetMapping("/mypage.cscrap")
	public String scrapCardList(Model model,HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value="pageNum",defaultValue="1") int currentPage)
	{
		HttpSession session = request.getSession();
		MemberDto mdto=(MemberDto)request.getSession().getAttribute("mdto");
		
		int smidnum = mdto.getMnum();
		
		
		int totalCount = scrapdi.getTotalcCount(smidnum);
		
		int perPage=4; //한페이지당 보여질 글의 갯수
		int perBlock=3; //한블럭당 출력할 페이지의 갯수
		int totalPage;//총 페이지의 갯수
		int startPage;//각 블럭당 시작 페이지번호
		int endPage;//각 블럭당 끝 페이지번호
		int start;//각 블럭당 불러올 글의 시작번호
		
		totalPage=totalCount/perPage+(totalCount%perPage>0?1:0);
		startPage=(currentPage-1)/perBlock*perBlock+1;
		endPage=startPage+perBlock-1;
		if(endPage>totalPage)
			endPage=totalPage;
		
		//mysql 은 첫 글이 0번(오라클은 1번)
		start=(currentPage-1)*perPage;
		
		//각 페이지에서 출력할 시작번호
		//총 50개일경우 1페이지는 50
		//2페이지는 40
		int no=totalCount-(currentPage-1)*perPage;
		
		///////////////////////////////페이징 끝///////////////////////////////
		
		List<CardDto> list = scrapdi.getcScrapList(start, perPage, smidnum);
		
		if(totalCount>0)
		{
			if(list.size()==0) { 
				return "redirect:mypage.cscrap?pageNum="+(currentPage-1);
			}
		}
		
		
		//model에 저장
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("list", list);
		model.addAttribute("no", no);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("totalPage", totalPage);
		
		return "/mypage/myscrap2";
	}
}
