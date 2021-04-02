package spring.hospital.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.io.BufferedReader;
import java.io.IOException;
 
@RestController
public class HospitaListController {
		
		@RequestMapping(value = "hospital/list",method = {RequestMethod.GET,RequestMethod.POST},produces="text/plain;charset=UTF-8")
    	 public static String getHlist(@RequestParam String hcate, @RequestParam(value = "pageNum",defaultValue = "1") String pageNum,
    			 @RequestParam(value = "numOfRows",defaultValue = "9") String perPage) throws IOException {
			

    		 StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/B551182/pubReliefHospService/getpubReliefHospList"); /*URL*/
    	        
    	        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=ELPlnUlo0CxXA8FbXT0V%2B0wkutn45xHxgWifiU35dIFwr3r1ngGdPJCbxlz59QRhYMoSmt2nzUIZYiCxjFQXgg%3D%3D"); /*Service Key*/
    	        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode(pageNum, "UTF-8")); /*페이지번호*/
    	        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode(perPage, "UTF-8")); /*한 페이지 결과 수*/
    	        urlBuilder.append("&" + URLEncoder.encode("spclAdmTyCd","UTF-8") + "=" + URLEncoder.encode(hcate, "UTF-8")); /*A0: 국민안심병원/97: 코로나검사 실시기관/99: 코로나 선별진료소 운영기관*/
    	        

    	        URL url = new URL(urlBuilder.toString());
    	        //웹url에 테스트해보기
    	        System.out.println(url);

    	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
    	        conn.setRequestMethod("GET");
    	        conn.setRequestProperty("Content-type", "application/json");
    	        //Response code값 확인해 보기
    	        //System.out.println("Response code: " + conn.getResponseCode());
    	        BufferedReader rd;
    	        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
    	            rd = new BufferedReader(new InputStreamReader(conn.getInputStream(),"UTF-8"));
    	        } else {
    	            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream(),"UTF-8"));
    	        }
    	        StringBuilder sb = new StringBuilder();
    	        String line;
    	        while ((line = rd.readLine()) != null) {
    	            sb.append(line);
    	        }
    	        rd.close();
    	        conn.disconnect();
    	        //결과 출력: 이클립스콘솔로 확인
    	        //System.out.println(sb.toString());
    	        return sb.toString();
    	    }
		

}
