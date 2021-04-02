package spring.hospital.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import spring.dto.MemberDto;
import spring.dto.ReserveDto;
import spring.member.dao.MemberDao;

@Controller
public class HospitalController {
	
	@Autowired
	private MemberDao mdao;
   @GetMapping("/hospitalmain")
   public String goHospital() {
      return "/hospital/hospitalmain";
   }
   
	
	@GetMapping("/hospitallist") 
	public String goHlist(Model model) {
		
		int mrole = 1; 
		//전체 데이터 얻기		
		List<MemberDto> list=mdao.getData3(mrole);
		
		//model에 저장	
		model.addAttribute("list", list);
	  
	 return "/hospital/hospitallist"; }
	 
	
   @GetMapping("/hospitaldetail")
   public String goHdetail(@RequestParam String name
         ,@RequestParam String addr
         ,@RequestParam String tel
         ,@RequestParam String num
         ,@RequestParam String role       
         ,Model model) {
      //System.out.println(name);
      
      model.addAttribute("name",name);
      model.addAttribute("addr",addr);
      model.addAttribute("tel",tel);
      model.addAttribute("num",num);
      model.addAttribute("role",role);
      
      return "/hospital/hospitaldetail";
   }
   

}