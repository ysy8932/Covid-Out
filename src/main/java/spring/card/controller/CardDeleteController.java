package spring.card.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import spring.card.dao.CardDaoInter;
import spring.dto.MemberDto;

@Controller
public class CardDeleteController {

	@Autowired
	private CardDaoInter carddi;
	
	@PostMapping("/doctor/delete")
	public String deleteCard(@RequestParam String cnum,
									@RequestParam String pageNum,
									HttpServletRequest request)
	{
		MemberDto mdto=(MemberDto)request.getSession().getAttribute("mdto");
		//파일 업로드 경로 구하기
		String path=request.getSession().getServletContext().getRealPath("/resources/save");
		System.out.println(path);
		//db에 저장된 파일명 얻기
		String deleteFile=carddi.getCardData(cnum).getCphoto();
		//저장된 파일 먼저 삭제
		if(!deleteFile.equals("no"))
		{
			File file=new File(path+"\\"+deleteFile);
			if(file.exists())
				file.delete();
		}
		
		//db의 데이터 삭제
		carddi.deleteCard(cnum);
		//목록으로 이동
		return "redirect:list?pageNum="+pageNum;
	}
}
