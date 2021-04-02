package spring.card.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import spring.card.dao.CardDaoInter;
import spring.dto.CardDto;
import spring.dto.MemberDto;
import upload.util.SpringFileWriter;

@Controller
public class CardUpdateController {
	
	@Autowired
	private CardDaoInter carddi;
	
	@GetMapping("/doctor/updateform")
	public String goCardUpdate(Model model, String num, String pageNum)
	{
		CardDto dto = carddi.getCardData(num);
		model.addAttribute("dto", dto);
		model.addAttribute("pageNum", pageNum);
		
		return "/dcommu/dcomupdate";
	}
	
	@PostMapping("/doctor/update")
	public ModelAndView updateCard(@ModelAttribute CardDto dto, 
							@RequestParam MultipartFile file, 
							@RequestParam String pageNum, 
							HttpServletRequest request
							)
	{
		ModelAndView mview = new ModelAndView();
		MemberDto mdto=(MemberDto)request.getSession().getAttribute("mdto");
		String path = request.getSession().getServletContext().getRealPath("/resources/save");
		System.out.println(path);
		
		SpringFileWriter writer = new SpringFileWriter();
		String fileName=writer.changeFilename(file.getOriginalFilename());
		
		writer.writeFile(file, fileName, path);
		
		//저장된 파일 먼저 삭제
		String deleteFile=carddi.getCardData(dto.getCnum()).getCphoto();
		if(!deleteFile.equals("no"))
		{
			File files=new File(path+"\\"+deleteFile);
			if(files.exists())
				files.delete();
		}
		
		dto.setCphoto(fileName);
		
		carddi.updateCard(dto);
		
		mview.addObject("mdto", mdto);
		mview.addObject("dto",dto);
		mview.setViewName("redirect:detail?num="+dto.getCnum()+"&pageNum="+pageNum);
		return mview;
	}
}
