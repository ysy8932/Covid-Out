package spring.hospital.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import spring.dto.MemberDto;
import spring.dto.ReserveDto;
import spring.reserve.dao.ReserveDao;

@Controller
public class ReserveController {


	@Autowired
	ReserveDao dao;

	//member dao 선언
	MemberDto mdto;


	@GetMapping("/mypage.reservation")
	public String reserveList(Model model,HttpServletRequest request)
	{
		
		
		HttpSession session = request.getSession();
		MemberDto mdto=(MemberDto)session.getAttribute("mdto");
		String rmnum=Integer.toString(mdto.getMnum());
		//총예약수 얻기
		String totalCount = dao.getTotalCount(rmnum);	
		//System.out.println(totalCount);
		
		//전체 데이터 얻기	
		List<ReserveDto> list=dao.getDataRm(rmnum);
		
		model.addAttribute("totalCount",totalCount);
		model.addAttribute("list", list);
		
		
		return "/mypage/myreservation";
	}
	
	
	//test
	//예약버튼을 눌렀을 때 입력하는 폼
	@GetMapping("/reserve/writeform")
	public String reserveForm(@RequestParam String name
	         ,@RequestParam String num,
	         Model model)
	{	
		model.addAttribute("num",num);
		model.addAttribute("name",name);
		
		return "/reserve/writeform";
	}

	//insert	
	@PostMapping("/reserve/insert") 
	public ModelAndView reserveInsert(@ModelAttribute ReserveDto dto, 			
			HttpServletRequest request) 
	{ 
		ModelAndView model=new ModelAndView(); 
		//@SessionAttribute("mdto")를 사용하면 model에 담아서 사용가능하다.
		HttpSession session = request.getSession();
		MemberDto mdto=(MemberDto)session.getAttribute("mdto");
		//System.out.println(mdto.getMnick());
		model.addObject("mdto", mdto); 
		model.addObject("dto",dto);

		model.setViewName("/reserve/success");

		dao.insertReserve(dto); 
		return model; 
	}

	//getData:dto보내기
	@GetMapping("/reserve/updateform")
	public ModelAndView updateForm(
			@RequestParam String rnum,
			@RequestParam String name)
	{
		//선언
		ModelAndView model=new ModelAndView();
		//db로부터 num에 해당하는 dto를 얻는다
		ReserveDto dto=dao.getData(rnum);
		//model에 저장
		model.addObject("dto", dto);
		model.addObject("name", name);
		//포워드
		model.setViewName("/reserve/updateform");

		return model;
	}

	//update
	@PostMapping("/reserve/update")
	public String updateReserve(
			@ModelAttribute ReserveDto dto)
	{
		dao.updateReserve(dto);

		
		return "redirect:/mypage.reservation";
	}

	//delete
	@GetMapping("/reserve/delete")
	public String deleteReserve(
			@RequestParam String rnum)
	{
		
		dao.deleteReserve(rnum);		
		
		return "redirect:/mypage.reservation";
	}

}
