package spring.card.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import spring.dto.CardDto;

@Repository
public class CardDao extends SqlSessionDaoSupport implements CardDaoInter {

	@Override
	public int getNumMax() {
		// TODO Auto-generated method stub
		return getSqlSession().selectOne("maxNumOfCard");
	}

	@Override
	public int getTotalCount() {
		// TODO Auto-generated method stub
		return getSqlSession().selectOne("totalCountOfCard");
	}

	@Override
	public void updateReadCount(String num) {
		// TODO Auto-generated method stub
		getSqlSession().update("updateReadCountCard", num);
	}

	@Override
	public void insertCard(CardDto dto) {
		// TODO Auto-generated method stub
		getSqlSession().insert("insertOfCard", dto);
	}

	@Override
	public List<CardDto> getCardList(int start, int perpage) {
		// TODO Auto-generated method stub
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("perpage", perpage);
		
		return getSqlSession().selectList("selectAllOfCard", map);
	}

	@Override
	public CardDto getCardData(String num) {
		// TODO Auto-generated method stub
		return getSqlSession().selectOne("selectOneOfCard", num);
	}

	@Override
	public void updateCard(CardDto dto) {
		// TODO Auto-generated method stub
		getSqlSession().update("updateOfCard", dto);
	}
	@Override
	public void deleteCard(String num) {
		// TODO Auto-generated method stub
		getSqlSession().delete("deleteOfCard", num);
	}
	@Override
	public List<CardDto> getCardRank(String creadcount){
		return getSqlSession().selectList("selectRankOfCard", creadcount);
	}

	@Override
	public List<CardDto> getCardSearch(String searchType, String keyword){
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("searchType", searchType);
		map.put("keyword", keyword);

		System.out.println(keyword);
		System.out.println(searchType);
		
		return getSqlSession().selectList("SearchedCard",map);
	}


	
}

