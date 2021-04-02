package spring.member.dao;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import spring.dto.MemberDto;
import spring.dto.ReserveDto;

@Repository
public class MemberDao extends SqlSessionDaoSupport implements MemberDaoInter {
	
	@Override
	public void insertMember(MemberDto dto) {
		// TODO Auto-generated method stub
		getSqlSession().insert("insertOfMember", dto);
	}

	@Override
	public void updateMember(MemberDto dto) {
		// TODO Auto-generated method stub
		getSqlSession().update("updateOfMember", dto);
		
	}

	@Override
	public void deleteMember(String mid) {
		// TODO Auto-generated method stub
		getSqlSession().delete("deleteOfMember", mid);
	}

	@Override
	public MemberDto getData(String mid) {
		// TODO Auto-generated method stub
		return getSqlSession().selectOne("selectOneOfMember", mid);
	}
	
	@Override
	public MemberDto getData2(String memail) {
		// TODO Auto-generated method stub
		return getSqlSession().selectOne("selectOneToEmailOfMember", memail);
		
	}

	@Override
	public int idCheck(String mid) {
		// TODO Auto-generated method stub
		return getSqlSession().selectOne("idCheckOfMember", mid);
	}

	@Override
	public boolean pwCheck(String mid, String mpw) {
		// TODO Auto-generated method stub
		boolean result=false;
		Map<String, String> map=new HashMap<String, String>();
		map.put("mid",mid);
		map.put("mpw",mpw);
		int count=getSqlSession().selectOne("pwCheckOfMember", map);
		if(count==1) result=true;
		return result;
	}



	
	@Override
	public int loginmember(String mid,String mpw){
		HashMap<String, String> params=new HashMap<String, String>();
		params.put("mid", mid);
		params.put("mpw", mpw);
		return getSqlSession().selectOne("loginOfMember",params);
	}


	
    @Override
    public void updatePW(String mid, String mpw) {
        // TODO Auto-generated method stub
        HashMap<String, String> params=new HashMap<String, String>();
        params.put("mid", mid);
        params.put("mpw", mpw);
        getSqlSession().update("updatePwOfMember",params );
    }

    
    
    
    
	@Override
	public int mailCheck(String memail) {
		// TODO Auto-generated method stub
		return getSqlSession().selectOne("mailCheck", memail);
	}
	
	@Override
	public int mnickCheck(String mnick) {
		// TODO Auto-generated method stub
		return getSqlSession().selectOne("mnickCheck", mnick);
	}

	
	
	
	@Override
	public MemberDto getMailId(String memail) {
		// TODO Auto-generated method stub
		return getSqlSession().selectOne("findIdOfMember", memail);
	}
    
	@Override
	public int findPwToLogin(String mid,String memail){
		System.out.println(mid);
		System.out.println(memail);
		HashMap<String, String> params=new HashMap<String, String>();
		params.put("mid", mid);
		params.put("memail", memail);
		//System.out.println((int)getSqlSession().selectOne("findpwtologin",params));
		return getSqlSession().selectOne("findpwtologin",params);
	}
    
	@Override
	public List<MemberDto> getData3(int mrole) {
		// TODO Auto-generated method stub
		return getSqlSession().selectList("selectAllOfMrole", mrole);
	}

    
}
