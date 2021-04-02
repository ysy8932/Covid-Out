package spring.member.service;

import java.util.List;
import java.util.Random;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import spring.dto.MemberDto;
import spring.member.dao.MemberDaoInter;

@Service
public class MemberService implements MemberServiceInter{

	@Autowired
	private MemberDaoInter dao;
	private JavaMailSender mailSender;

	@Override
	public void insertMember(MemberDto dto) {
		// TODO Auto-generated method stub
		dao.insertMember(dto);
	}

	@Override
	public void updateMember(MemberDto dto) {
		// TODO Auto-generated method stub
		dao.updateMember(dto);
	}

	@Override
	public void deleteMember(String mid) {
		// TODO Auto-generated method stub
		dao.deleteMember(mid);
	}

	@Override
	public MemberDto getData(String mid) {
		// TODO Auto-generated method stub
		return dao.getData(mid);
	}
	
	@Override
	public MemberDto getData2(String memail) {
		// TODO Auto-generated method stub
		return dao.getData2(memail);
	}

	@Override
	public int idCheck(String mid) {
		// TODO Auto-generated method stub
		return dao.idCheck(mid);
	}

	@Override
	public boolean pwCheck(String mid, String mpw) {
		// TODO Auto-generated method stub
		return dao.pwCheck(mid, mpw);
	}



	@Override
	   public String loginMember(String mid, String mpw) {

	      int logincheck = dao.loginmember(mid, mpw); //id,pw�� ������ �����ϸ�1, �ƴϸ� 0
	      String loginok;
	      if(logincheck==1) {
	         loginok="ok";
	      }else {
	         loginok=null;
	      }
	      return loginok;
	   }

	@Override
	public void updatePW(String mid, String mpw) {
		// TODO Auto-generated method stub
		dao.updatePW(mid,mpw);
	}

	
	
	
	@Override
	public int mailCheck(String memail) {
		// TODO Auto-generated method stub
		return dao.mailCheck(memail);
	}
	
	@Override
	public int mnickCheck(String mnick) {
		// TODO Auto-generated method stub
		return dao.mnickCheck(mnick);
	}

	
	
	
	@Override
	public MemberDto getMailId(String memail) {
		// TODO Auto-generated method stub
		return dao.getMailId(memail);
	}
	
	@Override
	public int findPwToLogin(String mid,String memail) {
		// TODO Auto-generated method stub
		return dao.findPwToLogin(mid, memail);
	}
	
	@Override
	public List<MemberDto> getData3(int mrole) {
		// TODO Auto-generated method stub
		return dao.getData3(mrole);
	}
	
	
	
	
	
	

	
	
	
	
	
	
	
	
}
