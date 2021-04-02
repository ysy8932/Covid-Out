package spring.answer.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import spring.answer.dao.AnswerDao;
import spring.dto.AnswerDto;

@RestController
public class AnswerController {
	
	@Autowired
	AnswerDao dao;
	
	@PostMapping("/board/answersave")
	public void insertAnswer(@RequestParam String acnum,
			@RequestParam String amidnum,
			@RequestParam String awriter,
			@RequestParam String amemo)
	{
		AnswerDto dto=new AnswerDto();

		dto.setAcnum(Integer.parseInt(acnum));
		dto.setAmidnum(Integer.parseInt(amidnum));
		dto.setAwriter(awriter);
		dto.setAmemo(amemo);

		//db 에 저장

		dao.insertAnswer(dto);

	}
	
	@GetMapping("/board/answerdelete")
	public void delete(@RequestParam String aidx,
			HttpServletRequest request)
	{	System.out.println(aidx);
		dao.deleteAnswer(aidx);
	}
	
	@GetMapping("/board/answerlist")
	public List<AnswerDto> list (@RequestParam String acnum){

		return dao.getAnswerList(acnum);

	}
	
	

}
