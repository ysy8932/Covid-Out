package spring.board.dao;

import java.util.List;

import spring.dto.BoardDto;

public interface BoardDaoInter {
	

	 public int getNumMax();
	   public void updateRestep(int regroup,int restep);
	   public int getCheckPass(String num,String pass);
	   public void updateReadCount(String num);
	   public void insertBoard(BoardDto dto);
	   public List<BoardDto> getList(int start, int perpage);
	   public BoardDto getData(String num);
	   public void updateBoard(BoardDto dto);
	   public void deleteBoard(String num);
	   public int getTotalCount();
	   public List<BoardDto> getTagList();
	   public List<BoardDto> getOneTagList(String num);
	   public List<BoardDto> getBoardHashtag(String num);
	   public void insertHashtag(BoardDto dto);
	   public void deleteHashtag(BoardDto dto);
	   public List<BoardDto> searchHashtag(String hashtag);
	   public List<BoardDto> getMyBoard(int bmidnum, int start, int perpage);
	   public int getMyCount(String bmidnum);
	   public String getHbnum(String fileName);
	   public void updateHashtag(String hbnum);
	   
}
