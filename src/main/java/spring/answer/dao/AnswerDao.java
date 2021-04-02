package spring.answer.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import spring.dto.AnswerDto;

@Repository
public class AnswerDao extends SqlSessionDaoSupport implements AnswerDaoInter {

	@Override
	public void insertAnswer(AnswerDto dto) {
		// TODO Auto-generated method stub
		getSqlSession().insert("insertOfAnswer", dto);
	}

	@Override
	public List<AnswerDto> getAnswerList(String acnum) {
		// TODO Auto-generated method stub
		return getSqlSession().selectList("SelectAnswer", acnum);
	}

	@Override
	public void deleteAnswer(String idx) {
		// TODO Auto-generated method stub
		getSqlSession().delete("deleteOfAnswer", idx);
	}

	@Override
	public AnswerDto getData(String aidx) {
		// TODO Auto-generated method stub
		return getSqlSession().selectOne("SelectOneAnswer",aidx);
	}

	@Override
	public void updateAnswer(AnswerDto dto) {
		// TODO Auto-generated method stub
		getSqlSession().update("updateOfAnswer", dto);
	}

	@Override
	public int totalCountAnswer(String acnum) {
		// TODO Auto-generated method stub
		
				
		return getSqlSession().selectOne("CountAnswer",acnum);
	}

}
