package spring.medicine.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class medicineinflate {

@RequestMapping(value="medicine/medicinetest", method= {RequestMethod.GET, RequestMethod.POST},produces="text/plain;charset=UTF-8")
public String callFlectionData(@RequestParam String keyword) throws Exception {

		
		//1안 공부하기...
		/* 문서의 주소 -> 읽고 -> 태그값을 사용해서 -> 웹페이지에 출력한다 */
		
		
		/*chap1. 문서의 주소*/
		//공공데이터 주소 서비스까지.
		String addr="http://apis.data.go.kr/1471000/DrbEasyDrugInfoService/getDrbEasyDrugList?serviceKey=";
		
		//주소에 들어갈 내 키 (encode)
		//String servicekey="rxb%2FMc%2BKpaYw%2BENrbWx0Q3KvrSp0W%2BN1g8ee7cFa3B3412ZLvOpSM4FAU8Hf%2FMgu0TuFohVNc%2FPY8cRipYRFkg%3D%3D";
		// decode ver;
		//String servicekey = "rxb/Mc+KpaYw+ENrbWx0Q3KvrSp0W+N1g8ee7cFa3B3412ZLvOpSM4FAU8Hf/Mgu0TuFohVNc/PY8cRipYRFkg==";
		//재 인코딩 ver
		String servicekey ="rxb%2fMc%2bKpaYw%2bENrbWx0Q3KvrSp0W%2bN1g8ee7cFa3B3412ZLvOpSM4FAU8Hf%2fMgu0TuFohVNc%2fPY8cRipYRFkg%3d%3d";
		
		//주소에 들어갈 "필수" 파라미터 넣기. -> 의약품은 필수 파라미터 서비스 키 외에 없음!!! 페이지는 필요하면 넣기@!@!!!
		String parameter="";
		//parameter = parameter + "&" + "pageNo=1";
		//parameter = parameter + "&" + "numOfRows=31";
		
		//여기에 컨트롤러에서 값을 받아오면 되는것같습니다.
		
		String serviceurl = addr + servicekey;
		
		//주소 완성하기!
		//addr = addr + servicekey + parameter;
		
		//직접 웹url에 테스트 해보세요~ 되는거 확인
		//System.out.println(addr);
		StringBuilder urlBuilder = new StringBuilder(serviceurl);
		urlBuilder.append("&" + URLEncoder.encode("itemName","UTF-8") + "=" + URLEncoder.encode(keyword, "UTF-8")); /*제품명 -> 인코딩을 진행해줘야 한글이 먹힙니다*/ 
		
		System.out.println(urlBuilder.toString());
		/*chap2. 데이터 읽기!*/
		
		//사이트의 데이터를 읽어오기! java는 사이트데이터 읽어올 때 html, json, xml, 등을 읽어올 수 이써여
		//1. url 객체를 생성하면서 주소를 넣어줍니다! (웹상에 존재하는 자원에 접근할 때 사용합니당.)
		URL url = new URL(urlBuilder.toString());
		
		//URLConnection : 사용자인증이나 보안이 설정되어있지 않은 웹서버에 접속할 떄 사용.
		//해당 URL에서 페이지 정보를 가져오기 위해 사용함.
		HttpURLConnection con = (HttpURLConnection)url.openConnection();
		
		// 어떤 메소드로 호출할건가여? get / post => 나는 get 메소드만 지원하기 때문에 get만 가져온다
		con.setRequestMethod("GET");
		//con.setRequestMethod("post");
		//json데이터일 경우.(안해봐서 확실치 않음)
		//con.setRequestProperty("Content-type", "application/json");
		//System.out.println("Response code: " + con.getResponseCode());
		
		//여기서 여러 방법이 나뉜댜ㅏ... 사람마다 다른데 inputStream과 outputstream을 이용할수도 있고...
		//그냥 inputStream으로 받고 버퍼에 저장해서 받아오기도 하고.... 여기선 버퍼로 해보자.
		
		//inputStream : byte : read();
		//inputStreamReader : char : read();
		//BufferedReader : String : readLine(); (줄줄이 읽어옴.)
		
		//버퍼리더로 읽어오자! 
		//스트림(파이트) -> 스트림리더(char) -> 버퍼리더(String)
		BufferedReader rd;
        if(con.getResponseCode() >= 200 && con.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(con.getInputStream(),"UTF-8"));
        } else {
            rd = new BufferedReader(new InputStreamReader(con.getErrorStream(),"UTF-8"));
        }
		//스트링뷜더를 사용하는 이유는 스트링객체들을 서로 + 하면 메모리가 새로 생성되어 성능적으로 좋지 않다고 한다. 따라서 기존 메모리 값만 추가하는 stringbuilder을 추천한다.
		StringBuilder sb=new StringBuilder();
		String line;
		//한줄한줄 읽어와서 스트링뷜더에 append 한다.
		while ((line=rd.readLine()) != null) {
			sb.append(line+"\n");
		}
		
		rd.close(); 
		con.disconnect();
		
		/* chap3. 출력하기! */
		//System.out.println(sb.toString());
		return sb.toString();
	}
	

}
