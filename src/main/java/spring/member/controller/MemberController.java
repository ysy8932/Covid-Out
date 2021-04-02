package spring.member.controller;


import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import spring.dto.MemberDto;
import spring.member.service.MemberServiceInter;

@Controller
public class MemberController {
	
	@Autowired
	private MemberServiceInter service;
	
	@Autowired
	private JavaMailSender mailSender;
	
	//로그인 화면으로 이동
	@GetMapping("/member/login")
	public String goLogin()
	{
		return "/member/login";
	}

	//회원가입 mrole 선택 화면으로 이동
	@GetMapping("/member/signup")
	public String goSignUp()
	{
		return "/member/signup";
	}
	
	//일반회원가입 폼으로 이동
	@GetMapping("/member/msignup")
	public String goMSignUp()
	{
		return "/member/msignup";
	}
	
	//전문회원가입 폼으로 이동
	@GetMapping("/member/dsignup")
	public String goDSignUp()
	{
		return "/member/dsignup";
	}
	
	//회원가입하고 로그인화면으로 이동. ( 1. 아이디 중복확인 ,2. 패스워드 같은지 확인 )
	@PostMapping("/member/savemember")
	public String insertMember(@ModelAttribute MemberDto dto,
			@RequestParam String mpw1,
			Model model)
	{
		int idcheck = service.idCheck(dto.getMid()); //1이면 존재, 0이면 존재안함.
		int nickcheck = service.mnickCheck(dto.getMnick()); //1이면 존재, 0이면 존재안함.
		System.out.println("nickcheck:"+ nickcheck + "and" + dto.getMnick());
		int emailcheck = service.mailCheck(dto.getMemail()); //1이면 존재, 0이면 존재안함.
		boolean passcheck = mpw1.equals(dto.getMpw());
		
		if(idcheck==0&&emailcheck==0&&nickcheck==0) {
			if(passcheck) {
				service.insertMember(dto);
				model.addAttribute("alert_title","회원가입이 되었습니다.");
				model.addAttribute("alert_icon","success");
				model.addAttribute("url","/member/login");
				return "/member/alert";
			}else{
				model.addAttribute("alert_title","패스워드가 일치하지 않습니다.");
				model.addAttribute("alert_icon","error");
				return "/member/alert_back";
				
			}
		}else if(idcheck==0) {
			if(emailcheck==1) {
				model.addAttribute("alert_title","이메일이 이미 존재합니다.");
				model.addAttribute("alert_icon","error");
				return "/member/alert_back";
			}
			else {
				model.addAttribute("alert_title","닉네임이 이미 존재합니다.");
				model.addAttribute("alert_icon","error");
				return "/member/alert_back";
			}
			
		}else{
			model.addAttribute("alert_title","아이디가 이미 존재합니다.");
			model.addAttribute("alert_icon","error");
			return "/member/alert_back";
		}
	}
	
	
	//로그인 기능 구현
	@PostMapping("member/loginmethod")
	public String loginMethod(
		HttpServletRequest request, HttpServletResponse response,
		@RequestParam String mid, @RequestParam String mpw,
		Model model)
	{
		
		String loginok = service.loginMember(mid,mpw);
		
		if(loginok=="ok") {
		    //loginok 저장
		    request.getSession().setAttribute("loginok","ok");
		    //입력된 id의 mdto를 가져옴.
		    MemberDto mdto=service.getData(mid);
		    //mdto를 세션에 넣음.
			request.getSession().setAttribute("mdto",mdto);
			
			//새 화면 띄우고 alert 하는거.. 좀 그래도
			//장점은 여러군데 쉽게 사용가능함... 다른방법은 코드가 너무 지저분해짐..
			model.addAttribute("alert_title","환영합니다.");
			model.addAttribute("alert_icon","success");
			model.addAttribute("url","/");
			return "/member/alert";
		}else {
			//실패시 nidlogin페이지로 이동
			return "/member/nidlogin";
		}
	 };

	 
	 
	  
	 //로그아웃기능
   @GetMapping("member/logout")
   public String logoutMethod(
         HttpServletRequest request, HttpServletResponse response, Model model)
   {
      //세션을 다 지워버림.
      request.getSession().invalidate();
      //alert 기능
      model.addAttribute("alert_title","로그아웃이 되었습니다.");
      model.addAttribute("alert_icon","success");
      model.addAttribute("url","/");
      return "/member/alert";
   }
	  
   //업데이트 비밀번호 확인
   @PostMapping("/member/update.passcheck")
   public String goUpdateForm(@RequestParam String mpw,
		   HttpServletRequest request,
		   HttpServletResponse response,
		   Model model
		   )
   {
	   //세션의 mdto 얻기
	   MemberDto mdto=(MemberDto)request.getSession().getAttribute("mdto");
	   //mdto에서 일반/전문 회원정보 얻기 (0:일반 / 1:전문)
	   int mrole=mdto.getMrole();
	   //비밀번호 확인 메소드
	   boolean result=service.pwCheck(mdto.getMid(),mpw);
	   
	   //결과 확인
	   if(result)
	   {
		   if(mrole==0)
		   {
			   //일반회원
			   return "/member/mupdatemember";
		   }else {
			   //병원
			   return "/member/dupdatemember";
		   }
	   }else {
		   //비밀번호가 틀릴 경우 마이페이지의 마이 인포메이션으로 가기.
		   model.addAttribute("alert_title","패스워드가 맞지 않습니다.");
		   model.addAttribute("alert_icon","error");
		   model.addAttribute("url","/mypage.main");
		   return "/member/alert";
	   }
	   
   }
	  
	   
   //업데이트 하기
   @PostMapping("/member/updatemember")
   public String memberUpdate(@ModelAttribute MemberDto dto,
		   HttpServletRequest request, HttpServletResponse response,
		   Model model)
   {
      service.updateMember(dto);
      request.getSession().setAttribute("mdto",dto);
      model.addAttribute("alert_title","정보가 수정되었습니다.");
	  model.addAttribute("alert_icon","success");
	  model.addAttribute("url","/mypage.main");
      return "/member/alert";
   }
	
	   
	
    //삭제 패스워드 확인
	@PostMapping("/member/del.passcheck")
	public String goDelForm(@RequestParam String mpw
			,HttpServletRequest request
			,HttpServletResponse response
			,Model model 
			)
	{
		
		//세션 가져오기
		MemberDto mdto=(MemberDto)request.getSession().getAttribute("mdto");
		System.out.println(mdto.getMid());
		//세션의 아이디와 입력한 pw 비교.
		boolean result=service.pwCheck(mdto.getMid(), mpw);
		
		if(result)
		{
			//결과가 맞으면 삭제 메서드
			service.deleteMember(mdto.getMid());
		}else{
			//결과가 틀리면 마이페이지로 돌아가기
		    model.addAttribute("alert_title","패스워드가 알맞지 않습니다.");
			model.addAttribute("alert_icon","error");
			model.addAttribute("url","/mypage.main");
			return "/member/alert";
		}
		
	      //세션을 다 지워버림.
	      request.getSession().invalidate();
	      model.addAttribute("alert_title","회원탈퇴를 하였습니다.");
		  model.addAttribute("alert_icon","success");
		  model.addAttribute("url","/");
		  return "/member/alert";
	}
		
		
	//패스워드 변경하기
	@PostMapping("/member/updatepass")
	public String updatePass(@RequestParam String mpw,
			@RequestParam String upmpw0,
			@RequestParam String upmpw1,
			HttpServletRequest request,
			HttpServletResponse response,
			Model model){
		
		//세션에서 mdto 가져오기
		MemberDto mdto = (MemberDto)request.getSession().getAttribute("mdto");
		boolean result=service.pwCheck(mdto.getMid(), mpw);
		//패스워드가 알맞고, 수정 패스워드 2개가 일치해야 변경됨.
		if(result&&(upmpw0.equals(upmpw1)))
		{
			//일치하다면
			//패스워드 변경하고
			service.updatePW(mdto.getMid(),upmpw0);
			//세션 패스워드 변경해줌.(안해줘도 되지만 혹여나...)
			request.getSession().setAttribute("mdto.mpw", upmpw0);
		}else {
		    model.addAttribute("alert_title","패스워드가 알맞지 않습니다.");
			model.addAttribute("alert_icon","error");
			model.addAttribute("url","/mypage.main");
			return "/member/alert";
		}
		//성공 메세지 후, 리턴
	    model.addAttribute("alert_title","패스워드가 수정되었습니다.");
		model.addAttribute("alert_icon","success");
		model.addAttribute("url","/mypage.main");
		return "/member/alert";
	}
	
	
	//######################## 카카오 로그인 ################################
	@RequestMapping("/member/kakaologin")
    public String home( HttpServletRequest request ,Model model){
		String memail=request.getParameter("memail");
		String mnick=request.getParameter("mnick");
		int emailcheck = service.mailCheck(memail);
		
		if(emailcheck==0) {
			MemberDto kmdto = new MemberDto();
			kmdto.setMemail(memail);
			kmdto.setMnick(mnick); 
			
			request.getSession().setAttribute("kmdto", kmdto);
			
			return "/member/kakaosignup";
		}

		
		request.getSession().setAttribute("loginok","ok");
	    //입력된 이메일의 mdto를 가져옴.
	    MemberDto mdto=service.getData2(memail);
	    //mdto를 세션에 넣음.
		request.getSession().setAttribute("mdto",mdto);
		model.addAttribute("alert_title","환영합니다.");
		model.addAttribute("alert_icon","success");
		model.addAttribute("url","/");
		
		return "/member/alert";
    }
	
	
	
	//######################## 구글 로그인 ################################
	@RequestMapping("/member/googlelogin")
	   public String googleLogin(HttpServletRequest request ,Model model)
	   {
	      
	      
	      String memail=request.getParameter("memail");
	      String mnick=request.getParameter("mnick");
	      //System.out.println(memail+","+mnick);
	      
	      int emailcheck = service.mailCheck(memail);
	      
	      if(emailcheck==0) {
	         MemberDto gmdto = new MemberDto();
	         gmdto.setMemail(memail);
	         gmdto.setMnick(mnick); 
	         
	         request.getSession().setAttribute("gmdto", gmdto);
	         
	         return "/member/googlesignup";
	      }
	      
	      request.getSession().setAttribute("loginok","ok");
	       //입력된 이메일의 mdto를 가져옴.
	       MemberDto mdto=service.getData2(memail);
	       //mdto를 세션에 넣음.
	      request.getSession().setAttribute("mdto",mdto);
	      model.addAttribute("alert_title","환영합니다.");
	      model.addAttribute("alert_icon","success");
	      model.addAttribute("url","/");
	      
	      return "/member/alert";
	   }

	
	
	

//	==================================아이디 찾기
	 @RequestMapping(value="/member/findmid", method=RequestMethod.POST,  produces = "application/text; charset=utf8")
	 @ResponseBody
	 public String findmemeberid(String memail) {
		 
		 int emailcheck=service.mailCheck(memail);
		 if(emailcheck==1) {
			String mid=service.getMailId(memail).getMid();
			String answer="해당 이메일로 가입된 아이디는 \' "+mid+" \' 입니다.";
			return answer;
		 }else {
			 return "해당하는 이메일이 없습니다.";
		 }
	 }
	 
//	====================================패스워드 찾기	 
	 @RequestMapping(value="/member/findmpw", method=RequestMethod.POST,  produces = "application/text; charset=utf8")
	 @ResponseBody
	 public String findmemberpw(String memail,String mid) {
		 System.out.println(memail);
		 System.out.println(mid);
		 int idandemailcheck=service.findPwToLogin(mid, memail);
		 System.out.println(idandemailcheck);
		 if(idandemailcheck==1) {
			String newpw = Double.toString(Math.random()*1000000000);
			service.updatePW(mid,newpw);
			try {
				MimeMessage message=mailSender.createMimeMessage();

				message.addRecipient(RecipientType.TO, new InternetAddress(memail));
				message.addFrom(new InternetAddress[] {
						new InternetAddress("bitcovidout@gmail.com","COVIDOUT")
				});
				String htmlContent = "<div style='width:800px; height:450px;background-color: #1f2c59; text-align: center;'><br><br><br><h1 style='color:white; text-align: center;'>COVID-OUT</h1><br><h3 style='color:white; text-align: center;'>귀하의 패스워드가 변경되었습니다.</h3><br><input style='width:500px;padding: 14px 20px;box-sizing: border-box;border: 4px solid #ccc;height: 55px;font-size: 16px;vertical-align: middle; ' type='text' value="+newpw+"></div>";
			    message.setText(htmlContent, "UTF-8", "html");
				message.setSubject("COVIDOUT입니다", "utf-8");

				
				mailSender.send(message);
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return "변경된 비밀번호가 이메일로 전송되었습니다.";
		 }else {
			 return "해당하는 아이디 또는 이메일이 없습니다.";
		 }
	 }
}