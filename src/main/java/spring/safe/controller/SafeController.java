package spring.safe.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
@Controller
public class SafeController {
	
	@GetMapping("/safe/list")
	public String gosafeList()
	{
		return "/mainsafe/safelist";
	}
	
	@GetMapping("/safe/detail")
	public String gosafeDetail()
	{
		return "/mainsafe/safedetail";
	}

}
