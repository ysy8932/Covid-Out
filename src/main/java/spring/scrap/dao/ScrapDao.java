package spring.scrap.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import spring.dto.BoardDto;
import spring.dto.CardDto;
import spring.dto.ScrapDto;

@Repository
public class ScrapDao extends SqlSessionDaoSupport implements ScrapDaoInter {

	@Override
	public int getNumMax() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int getTotalCount(int smidnum) {
		// TODO Auto-generated method stub
		return getSqlSession().selectOne("totalCountOfScrapID",smidnum);
	}
	
	@Override
	public int getTotalbCount(int smidnum) {
		// TODO Auto-generated method stub
		return getSqlSession().selectOne("totalCountOfbScrapID",smidnum);
	}

	@Override
	public int getTotalcCount(int smidnum) {
		// TODO Auto-generated method stub
		return getSqlSession().selectOne("totalCountOfcScrapID",smidnum);
	}

	@Override
	public List<BoardDto> getbScrapList(int start, int perpage, int smidnum) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("perpage", perpage);
		map.put("smidnum", smidnum);
		
		return getSqlSession().selectList("selectAllOfbScrap", map);
	}
	
	@Override
	public List<CardDto> getcScrapList(int start, int perpage, int smidnum) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("perpage", perpage);
		map.put("smidnum", smidnum);
		
		return getSqlSession().selectList("selectAllOfcScrap", map);
	}

	@Override
	public ScrapDto getScrapData(String num) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public void insertScrap(ScrapDto dto) {
		// TODO Auto-generated method stub
		getSqlSession().insert("insertOfScrap", dto);
		
	}

	@Override
	public int cardScrapCheck(int scnum, int smidnum) {
		// TODO Auto-generated method stub
		//System.out.println(scnum);
		//System.out.println(smidnum);
		HashMap<String, Integer> params=new HashMap<String, Integer>();
		params.put("scnum", scnum);
		params.put("smidnum", smidnum);
		return getSqlSession().selectOne("cardCheck", params);
	}

	@Override
	public ScrapDto getCardData(int scnum) {
		// TODO Auto-generated method stub
		return getSqlSession().selectOne("selectOneOfCardScrap", scnum);
	}

	@Override
	public void deleteCardScrap(ScrapDto dto) {
		// TODO Auto-generated method stub
		getSqlSession().delete("deleteOfScrap",dto);
	}

	@Override
	public int boardScrapCheck(int sbnum, int smidnum) {
		HashMap<String, Integer> params=new HashMap<String, Integer>();
		params.put("sbnum", sbnum);
		params.put("smidnum", smidnum);
		return getSqlSession().selectOne("boardCheck", params);
	}

	public void deleteboardScrap(ScrapDto dto) {
		// TODO Auto-generated method stub
		getSqlSession().delete("deleteOfScrap",dto);
	}


}
