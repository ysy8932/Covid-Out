package spring.card.dao;

import java.util.List;

import spring.dto.CardDto;

public interface CardDaoInter {
	public int getNumMax();
	public int getTotalCount();
	public void updateReadCount(String num);
	public void insertCard(CardDto dto);
	public List<CardDto> getCardList(int start, int perpage);
	public CardDto getCardData(String num);
	public void updateCard(CardDto dto);
	public void deleteCard(String num);
	public List<CardDto> getCardRank(String creadcount);
	public List<CardDto> getCardSearch(String searchType, String keyword);
}
