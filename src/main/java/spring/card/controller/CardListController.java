package spring.card.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.card.dao.CardDaoInter;
import spring.dto.CardDto;

@Controller
public class CardListController {
	
	@Autowired
	private CardDaoInter carddi;
	

	@GetMapping("/doctor/list")
	public String goCardList(@RequestParam(value="pageNum",defaultValue="1")
		int currentPage, Model model,String cnum,String creadcount)
	{
		int totalCount = carddi.getTotalCount();
		int perPage=10; //한페이지당 보여질 글의 갯수
		int perBlock=5; //한블럭당 출력할 페이지의 갯수
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
		
		//db 로부터 출력할 목록 가져오기
		List<CardDto> list = carddi.getCardList(start, perPage);
		
		if(list.size()==0)
		{
			return "redirect:list?pageNum="+(currentPage-1);
		}
		List<CardDto> dlist = carddi.getCardRank(creadcount);
		
		//model에 저장
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("list", list);
		model.addAttribute("dlist", dlist);
		model.addAttribute("no", no);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("totalPage", totalPage);
		
		return "/dcommu/dcomlist";
	}
}

