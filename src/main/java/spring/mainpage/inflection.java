package spring.mainpage;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class inflection {
	
	public void callFlectionData() throws Exception {

		
		
		/* 문서의 주소 -> 읽고 -> 태그값을 사용해서 -> 웹페이지에 출력한다 */
		
		
		/*chap1. 문서의 주소*/
		//공공데이터 주소 서비스까지.
		String addr="http://openapi.data.go.kr/openapi/service/rest/Covid19/getCovid19InfStateJson?serviceKey=";
		
		//주소에 들어갈 내 키
		String servicekey="KLRsg8XwdmlVRNMjR2RLNRJqTtVc1KFTIPz%2BwNu8cuhlSEuF7Jg3V7CJ%2Bw0pXOx1VurMlU93VuWMn8IJOsP%2Bwg%3D%3D";
		
		//주소에 들어갈 파라미터 넣기.
		String parameter="";
		parameter = parameter + "&" + "pageNo=1";
		parameter = parameter + "&" + "numOfRows=31";
		
		//오늘 날짜, 한달전 날짜 구하기
		Calendar cal = Calendar.getInstance();
        cal.setTime(new Date());
        DateFormat df = new SimpleDateFormat("yyyyMMdd");
        String enddate=df.format(cal.getTime());
        cal.add(Calendar.MONTH, -1);
        String startdate=df.format(cal.getTime());
        
        //파라미터 날짜 데이터 추가
		parameter = parameter + "&" + "startCreateDt="+startdate;
		parameter = parameter + "&" + "endCreateDt="+enddate;
		
		//주소 완성하기!
		addr = addr + servicekey + parameter;
		
		//직접 웹url에 테스트 해보세요~
		//System.out.println(addr);
		
		
		/*chap2. 읽기!*/
		
		//사이트의 데이터를 읽어오기! java는 사이트데이터 읽어올 때 html, json, xml, 등을 읽어올 수 이써여
		//1. url 객체를 생성하면서 주소를 넣어줍니다! (웹상에 존재하는 자원에 접근할 때 사용합니당.)
		URL url = new URL(addr);
		
		//URLConnection : 사용자인증이나 보안이 설정되어있지 않은 웹서버에 접속할 떄 사용.
		
		//해당 URL에서 페이지 정보를 가져오기 위해 사용함.
		HttpURLConnection con = (HttpURLConnection)url.openConnection();
		
		// 어떤 메소드로 호출할건가여? get / post
		con.setRequestMethod("GET");
		//con.setRequestMethod("post");
		//json데이터일 경우.(안해봐서 확실치 않음)
		//con.setRequestProperty("Content-type", "application/json");
		
		
		
		//여기서 여러 방법이 나뉜댜ㅏ... 사람마다 다른데 inputStream과 outputstream을 이용할수도 있고...
		//그냥 inputStream으로 받고 버퍼에 저장해서 받아오기도 하고.... 여기선 버퍼로 해보자.
		
		//inputStream : byte : read();
		//inputStreamReader : char : read();
		//BufferedReader : String : readLine(); (줄줄이 읽어옴.)
		
		//버퍼리더로 읽어오자! 
		//스트림(파이트) -> 스트림리더(char) -> 버퍼리더(String)
		BufferedReader bfr = new BufferedReader(new InputStreamReader(con.getInputStream(),"utf-8"));
		
		//스트링뷜더를 사용하는 이유는 스트링객체들을 서로 + 하면 메모리가 새로 생성되어 성능적으로 좋지 않다고 한다. 따라서 기존 메모리 값만 추가하는 stringbuilder을 추천한다.
		StringBuilder sb=new StringBuilder();
		String line;
		//한줄한줄 읽어와서 스트링뷜더에 append 한다.
		while ((line=bfr.readLine()) != null) {
			sb.append(line+"\n");
		}
		
		bfr.close(); 
		con.disconnect();
		
		/* chap3. 출력하기! */
		System.out.println(sb.toString());
	}
}
