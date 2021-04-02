package spring.member.service;

import java.util.List;

import spring.dto.MemberDto;

public interface MemberServiceInter {
	
	public void insertMember(MemberDto dto);
	public void updateMember(MemberDto dto);
	public void deleteMember(String mid);
	public MemberDto getData(String mid);
	public MemberDto getData2(String memail);
	public int idCheck(String mid);
	public boolean pwCheck(String mid, String mpw);
	public String loginMember(String mid, String mpw);
	public void updatePW(String mid, String mpw);
	public int mailCheck(String memail);
	public int mnickCheck(String mnick);
	public MemberDto getMailId(String memail);
	public int findPwToLogin(String mid,String memail);
	public List<MemberDto> getData3(int mrole);
}
