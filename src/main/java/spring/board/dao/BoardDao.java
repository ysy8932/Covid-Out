package spring.board.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import spring.dto.BoardDto;

@Repository
public class BoardDao extends SqlSessionDaoSupport implements BoardDaoInter {

	@Override
	public int getNumMax() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void updateRestep(int regroup, int restep) {
		// TODO Auto-generated method stub
		HashMap<String, Integer> map = new HashMap<String, Integer>();
	      map.put("regroup", regroup);
	      map.put("restep", restep);
	      
	      getSqlSession().update("updateRestepOfBoard", map);
		
	}

	@Override
	public int getCheckPass(String num, String pass) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void updateReadCount(String bnum) {
		// TODO Auto-generated method stub
		getSqlSession().update("updateReadcountOfBoard",bnum);
	}

	@Override
	public void insertBoard(BoardDto dto) {
		// TODO Auto-generated method stub
		getSqlSession().insert("insertOfBoard", dto);
	}

	@Override
	public List<BoardDto> getList(int start, int perpage) {
		HashMap<String, Integer> map=new HashMap<String, Integer>();
	      map.put("start", start);
	      map.put("perpage", perpage);
	      return getSqlSession().selectList("selectAllOfBoard", map);
	}

	@Override
	public BoardDto getData(String bnum) {
		// TODO Auto-generated method stub
		 //System.out.println(bnum);
		 return getSqlSession().selectOne("selectoneOfBoard",bnum);
	}

	@Override
	public void updateBoard(BoardDto dto) {
		// TODO Auto-generated method stub
		System.out.println(dto.getBnum() +" dddd "+dto.getBmidnum());
		getSqlSession().update("updateOfBoard",dto);
	}

	@Override
	public void deleteBoard(String bnum) {
		// TODO Auto-generated method stub
		getSqlSession().delete("deleteOfBoard",bnum);
	}

	@Override
	public int getTotalCount() {
		// TODO Auto-generated method stub
		return getSqlSession().selectOne("totalCountOfBoard");
	}

	@Override
	public List<BoardDto> getTagList() {
		// TODO Auto-generated method stub
		return getSqlSession().selectList("selecthashtag");
	}

	@Override
	public List<BoardDto> getOneTagList(String bnum) {
		// TODO Auto-generated method stub
		System.out.println(bnum);
		return getSqlSession().selectList("selectboardtag",bnum);
	}

	@Override
	public void insertHashtag(BoardDto dto) {
		// TODO Auto-generated method stub
		getSqlSession().insert("inserthashtag", dto);
	}

	@Override
	public void deleteHashtag(BoardDto dto) {
		// TODO Auto-generated method stub
		getSqlSession().delete("deletehashtag",dto);
	}

	@Override
	public List<BoardDto> searchHashtag(String hashtag) {
		// TODO Auto-generated method stub
		return getSqlSession().selectList("searchHashtag",hashtag);
	}

	@Override
	public List<BoardDto> getMyBoard(int bmidnum, int start, int perpage) {
		// TODO Auto-generated method stub
		HashMap<String, Integer> map=new HashMap<String, Integer>();
	      map.put("bmidnum",bmidnum);
		  map.put("start", start);
	      map.put("perpage", perpage);
		return getSqlSession().selectList("selectMyBoard", map);
	}

	@Override
	public int getMyCount(String bmidnum) {
		// TODO Auto-generated method stub
		return getSqlSession().selectOne("totalMyBoard",bmidnum);
	}

	@Override
	public List<BoardDto> getBoardHashtag(String num) {
		// TODO Auto-generated method stub
		return getSqlSession().selectList("searchHashtag",num);
	}

	@Override
	public String getHbnum(String fileName) {
		// TODO Auto-generated method stub
		return getSqlSession().selectOne("getphobnum",fileName);
	}

	@Override
	public void updateHashtag(String hbnum) {
		// TODO Auto-generated method stub
		getSqlSession().update("updatehasht",hbnum);
	}
	
	

}
