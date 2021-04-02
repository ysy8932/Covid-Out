 package spring.board.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.answer.dao.AnswerDao;
import spring.board.dao.BoardDao;
import spring.board.dao.BoardDaoInter;
import spring.dto.BoardDto;
import spring.dto.MemberDto;
import spring.member.service.MemberServiceInter;
import spring.scrap.dao.ScrapDao;


@Controller
public class BoardContentController {
	
	@Autowired
	private BoardDao dao;
	
	@Autowired
	private ScrapDao sdao;
	//private MemberServiceInter mservice;
	
	
	@GetMapping({"/board/boardcontent"})
	public ModelAndView bcontent(
			@RequestParam("bnum") String bnum,
			@RequestParam("pageNum") String pageNum,
			@RequestParam(required = false) String key,
			HttpServletRequest request/*필수입력아님,null값허용*/
			)
	{
		ModelAndView mview=new ModelAndView();
		
		//System.out.println("bnum is "+ bnum);
		
		//key 가 널이 아닌경우 조회수 1 증가
		 dao.updateReadCount(bnum);
		 //dto 얻기
		
		BoardDto dto=dao.getData(bnum);
		//
		List<BoardDto> hdto = dao.getOneTagList(bnum);
		
		//login test
		
		HttpSession session = request.getSession();
		MemberDto mdto=(MemberDto)request.getSession().getAttribute("mdto");
	   
		//int totalCount = adao.totalCountAnswer(bnum);
		
		mview.addObject("hdto",hdto);
		//mview.addObject("totalCount",totalCount);
		mview.addObject("mdto",mdto);

		////////// 스크랩 ///////////
		if(request.getSession().getAttribute("loginok")!=null)
		{
			System.out.println("로그인O");
			System.out.println("mdto.getMnum:"+mdto.getMnum());
			
			int data=sdao.getTotalCount(mdto.getMnum());
			System.out.println("data:"+data);
			
			//id에 스크랩한거있는경우
			if(data>0)
			{
				//해당 글 스크랩했는지안했는지확인(글num, 아디num)
				int boardcheck=sdao.boardScrapCheck(Integer.parseInt(bnum), mdto.getMnum());
				System.out.println("boardcheck:"+boardcheck);
				
				 mview.addObject("boardcheck", boardcheck);
				 mview.addObject("dto", dto);
	             mview.addObject("pageNum", pageNum);
	             
	             mview.setViewName("/board/boardcontent");
	     		return mview; 
			}else {
				mview.addObject("dto", dto);
				mview.addObject("pageNum", pageNum);
				
				mview.setViewName("/board/boardcontent");
		     	return mview; 
			}
			
		//로그인안했을경우
		}else {
			System.out.println("로그인X");
			
			mview.addObject("dto", dto);
			mview.addObject("pageNum", pageNum);
			
			mview.setViewName("/board/boardcontent");
	     	return mview;
		}
		
	} 
	
	/*
	 * @GetMapping({"/board/boardcontent"}) public ModelAndView bcc() { ModelAndView
	 * mview=new ModelAndView();
	 * 
	 * 
	 * mview.setViewName("/board/boardcontent"); return mview;
	 * 
	 * }
	 */
	
	

}
