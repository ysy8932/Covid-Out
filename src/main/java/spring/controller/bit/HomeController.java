package spring.controller.bit;


import java.util.HashMap;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.GetMapping;


/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@GetMapping({"/","/home"})
	public String goMain(HttpServletRequest request, HttpServletResponse response)
	{
//		그래프데이터
		HashMap<String, String> inflectionData=inflection2.getInflectionData();
		request.getSession().setAttribute("inflectionpeople", inflectionData.get("inflectionPeople"));
		request.getSession().setAttribute("inflectiondate", inflectionData.get("inflectionDay"));
//		Map 데이터
		HashMap<String, String[]> inflecMapData=inflection2.getinflectionMapData();
		request.getSession().setAttribute("inflecMapData", inflecMapData);
		return "/layout/main";
	}
}

