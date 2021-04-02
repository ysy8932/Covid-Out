package spring.mypage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import spring.dto.ScrapDto;
import spring.scrap.dao.ScrapDao;

@Controller
public class ScrapInsertController {

	@Autowired
	private ScrapDao dao;
	
	
	@PostMapping("/doctor/cardscrap")
	public String cardScrap(@ModelAttribute ScrapDto dto
			,@RequestParam(required = false) String num
	        ,@RequestParam(required = false) String pageNum
	        ,@RequestParam(required = false) String key
	        ,Model model)
	{
		System.out.println("scrapinsert:"+num);
		dao.insertScrap(dto);
		model.addAttribute("alert_title","스크랩완료");
		model.addAttribute("alert_icon","success");
		model.addAttribute("url",("/doctor/detail?num="+num+"&pageNum="+pageNum+"&key=list"));
		return "/member/alert";
	}
	
	@PostMapping("/board/boardscrap")
	public String boardScrap(@ModelAttribute ScrapDto dto
			,@RequestParam(required = false) String num
	        ,@RequestParam(required = false) String pageNum
	        ,@RequestParam(required = false) String key
	        ,Model model)
	{
		System.out.println("scrapinsert:"+num);
		dao.insertScrap(dto);
		model.addAttribute("alert_title","스크랩완료");
		model.addAttribute("alert_icon","success");
		model.addAttribute("url",("/board/boardcontent?bnum="+num+"&pageNum="+pageNum));
		return "/member/alert";
	}
}
