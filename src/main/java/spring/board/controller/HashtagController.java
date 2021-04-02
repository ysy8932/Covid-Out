package spring.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import spring.board.dao.BoardDao;
import spring.dto.AnswerDto;
import spring.dto.BoardDto;

@RestController
public class HashtagController {

	@Autowired
	private BoardDao hdao;
	
	
	//// board ajax
	@GetMapping("/board/searchlist")
	public List<BoardDto> boardli(@RequestParam String hashtag){
		
 
		return hdao.searchHashtag(hashtag);

	}
	
	
	
	@GetMapping("/board/hashtaglist")
	public List<BoardDto> list (@RequestParam String num){
		
		return hdao.getOneTagList(num);

	}
	
	@PostMapping("/board/hashtagsave")
	public void insertHashtag(@RequestParam String hbnum,
			@RequestParam String hashtag)
	{
		BoardDto dto=new BoardDto();

		
	
		dto.setHbnum(Integer.parseInt(hbnum));
		dto.setHashtag(hashtag);
		
		//db 에 저장

		hdao.insertHashtag(dto);

	}
	
	@PostMapping("/board/hashtagdel")
	public void delhashtag(@RequestParam String hbnum,
			@RequestParam String hashtag)
	{
		BoardDto dto=new BoardDto();
		
		String hashtag2 = hashtag.replaceAll(" ", "");
		System.out.println(hashtag2);
		dto.setHbnum(Integer.parseInt(hbnum));
		dto.setHashtag(hashtag2);
		//db 에 저장

		hdao.deleteHashtag(dto);

	}
	
	
	
}
