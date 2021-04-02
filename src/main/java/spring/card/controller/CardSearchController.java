package spring.card.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import spring.card.dao.CardDaoInter;
import spring.dto.CardDto;

@RestController
public class CardSearchController {
	
	@Autowired
	private CardDaoInter carddi;

	@GetMapping("/doctor/dsearch")
	public List<CardDto> cardSearch(@RequestParam(value = "searchType", required = false, defaultValue = "title") String searchType,
							@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword) throws Exception
	{	
		List<CardDto> list = carddi.getCardSearch(searchType, keyword);
		
		return list;
	}
	
	
}
