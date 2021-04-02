package spring.scrap.dao;

import java.util.List;

import spring.dto.BoardDto;
import spring.dto.CardDto;
import spring.dto.ScrapDto;

public interface ScrapDaoInter {
	public int getNumMax();
	public int getTotalCount(int smidnum);
	public int getTotalbCount(int smidnum);
	public int getTotalcCount(int smidnum);
	public List<BoardDto> getbScrapList(int start, int perpage, int smidnum);
	public List<CardDto> getcScrapList(int start, int perpage, int smidnum);
	public ScrapDto getScrapData(String num);
	public void deleteCardScrap(ScrapDto dto);
	public void insertScrap(ScrapDto dto);
	public int cardScrapCheck(int scnum, int smidnum);
	public int boardScrapCheck(int sbnum, int smidnum);
	public void deleteboardScrap(ScrapDto dto);
	public ScrapDto getCardData(int scnum);
}
