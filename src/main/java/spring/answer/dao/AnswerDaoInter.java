package spring.answer.dao;

import java.util.List;

import spring.dto.AnswerDto;

public interface AnswerDaoInter {
	
	public void insertAnswer(AnswerDto dto);
	public List<AnswerDto> getAnswerList(String num);
	public void deleteAnswer(String idx);
	public AnswerDto getData(String idx);
	public void updateAnswer(AnswerDto dto);
	public int totalCountAnswer(String idx);
}
