package spring.medicine.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MedicineController {
	
	@GetMapping({"/medicine"})
	   public String goMed() 
	 {	
		//222222
		
	      return "/medicine/medlayout";
	 }
	
	
	@GetMapping({"/medicine/search"})
	public String medicinetest() {
		
		
		
		return "/medicine/meditest";
	}
	
	

}
