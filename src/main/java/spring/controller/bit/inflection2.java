package spring.controller.bit;

import java.text.DateFormat;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

public class inflection2 {
		
	public static HashMap<String, String> getInflectionData() {
		try{
			
            /*chap1. 문서의 주소*/
            //공공데이터 주소 서비스까지.
            String addr="http://openapi.data.go.kr/openapi/service/rest/Covid19/getCovid19InfStateJson?serviceKey=";
            
            //주소에 들어갈 내 키
            String servicekey="I7iTYNwpm48uv56il%2BOmX0zDiEUoAIlAn%2BU1HOFuGfVW8cT04smffOwzKRbEyOzdh%2BLzCFovf3OMp1uXmeP6aQ%3D%3D";
            
            //주소에 들어갈 파라미터 넣기.
            String parameter="";
            parameter = parameter + "&" + "pageNo=1";
            parameter = parameter + "&" + "numOfRows=40";
            
            //오늘 날짜, 한달전 날짜 구하기
            Calendar cal = Calendar.getInstance();
            cal.setTime(new Date());
            
            DateFormat df = new SimpleDateFormat("yyyyMMdd");
            DateFormat dft = new SimpleDateFormat("HH");
            //12시부터 출력되도록 하자.
            int gogogo=Integer.parseInt(dft.format(cal.getTime()));
            
            if(gogogo<12) {
            	cal.add(Calendar.DATE, -1);
            }
            String enddate=df.format(cal.getTime());
            
            cal.add(Calendar.DATE, -31);
            
            String startdate=df.format(cal.getTime());
            
            //파라미터 날짜 데이터 추가
            parameter = parameter + "&" + "startCreateDt="+startdate;
            parameter = parameter + "&" + "endCreateDt="+enddate;
            
            //주소 완성하기!
            addr = addr + servicekey + parameter;
            
            //System.out.println(addr);
            //직접 웹url에 테스트 해보세요~
            //System.out.println(addr);
			
            /*chap2. 읽기*/
    		/*
    		 * DOM이란 xml및 html문서를 응용프로그램에서 사용하기 위한 api 규격. 
    		 * DOM의 기본 인터페이스 
    		 * node : 모든 객체의 부모 인터페이스로서 공통적으로 기능하는 함수를 가진다.
    		 * nodelist : 노드들을 리스트로 받아서 처리하기 쉽도록 한 것. ( 주로 getElementsbyTagName("태그네임")메서드의 리턴타입으로서 사용된다.
    		 * Document : DOM 트리구조의 최상위 노드로서 xml문서 자체에 해당한다.
    		 * Element : xml의 엘리먼트에 해당하는 객체유형
    		 * Attr : xml의 Attribute에 해당하는 객체유형
    		 * CharacterData : xml의 데이터에 해당하는 객체유형
    		 * Text : 문자 데이터에 해당하는 객체 유형
    		 */
    		
         // DOM파서로 xml문서 파싱하기.
            //1. xml생성하는 팩토리 생성
			DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
			//2. 뷜더
			DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
			//3. xml생성.
			Document doc = dBuilder.parse(addr);
				
            // 문서  구조 안정화시키기.
            doc.getDocumentElement().normalize();
            // 루트(최상위) 엘리먼트의 노드이름 얻기.
            //System.out.println("Root element :" + doc.getDocumentElement().getNodeName());
			
            // 파싱할 tag
            //item태그네임을 기준으로 노드리스트 만들기.
            NodeList nList = doc.getElementsByTagName("item");
            //System.out.println("nList에는 무슨값이 들어가려나... : "+ nList); //com.sun.org.apache.xerces.internal.dom.DeepNodeListImpl@184f6be2...??????이상한값.
            
            // nList의 갯수 출력.
            //System.out.println("파싱할 리스트 수 : "+ nList.getLength());
            
			int[] inflectionpeople = new int[32];
			String[] inflectionday = new String[32];
            //반복문 0으로 시작해서 파싱될 tag의 갯수만큼!
            for(int temp = 0; temp < nList.getLength(); temp++){
            	
            	//item으로 파싱한 노드를 nNode에 담음 ( <item> ... <item> ) 
            	//(** nList.item은 태그 item이랑 상관없음!)
                Node nNode = nList.item(temp);
                //나눈 노드엘레먼트를 eElement에 저장.
                Element eElement = (Element) nNode;
                
                
                //if(nNode.getNodeType() == Node.ELEMENT_NODE){              	
                    //System.out.println("######################");                    
                    //System.out.println("확진자수  : " + getTagValue("decideCnt", eElement));
                    //System.out.println("기준일  : " + getTagValue("stateDt", eElement));
                //}	// for end
                inflectionpeople[temp] = Integer.parseInt(getTagValue("decideCnt", eElement));
                inflectionday[temp] = getTagValue("stateDt", eElement);
            }	// if end

            int[] inflectionPeopleResult = new int[15];
            String[] inflectionDayResult = new String[15];
            for (int i = 0; i < 15; i++) {
            	inflectionPeopleResult[i]=inflectionpeople[14-i]-inflectionpeople[15-i];
            }
            for (int i = 0; i < 15; i++) {
            	inflectionDayResult[i]= inflectionday[14-i];
            }

            String a = Arrays.toString(inflectionPeopleResult);
            String b = Arrays.toString(inflectionDayResult);
            //System.out.println(a);
            //System.out.println(b);
            HashMap<String, String> params=new HashMap<String, String>();
            params.put("inflectionPeople", a);
    		params.put("inflectionDay", b);
    		
    		return params;
    		
		} catch (Exception e){	
			
			e.printStackTrace();
			return null;
		}	// try~catch end
		
	}	// main end
	
	
	
	public static HashMap<String, String[]> getinflectionMapData() {
			try{
			
            String urlstr = "http://openapi.data.go.kr/openapi/service/rest/Covid19/getCovid19SidoInfStateJson?serviceKey=KLRsg8XwdmlVRNMjR2RLNRJqTtVc1KFTIPz%2BwNu8cuhlSEuF7Jg3V7CJ%2Bw0pXOx1VurMlU93VuWMn8IJOsP%2Bwg%3D%3D&pageNo=1&numOfRows=10&";
            
            Calendar cal = Calendar.getInstance();
            cal.setTime(new Date());
            DateFormat df = new SimpleDateFormat("yyyyMMdd");
            DateFormat dft = new SimpleDateFormat("HH");
            //12시부터 출력되도록 하자.
            int gogogo=Integer.parseInt(dft.format(cal.getTime()));
            
            if(gogogo<12) {
            	cal.add(Calendar.DATE, -1);
            }
            String searchDay=df.format(cal.getTime());
            String parameter = "&" + "startCreateDt="+searchDay;
            parameter = parameter + "&" + "endCreateDt="+searchDay;
            
            String addr = urlstr+parameter;

			DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
			DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
			Document doc = dBuilder.parse(addr);
            doc.getDocumentElement().normalize();
            NodeList nList = doc.getElementsByTagName("item");
            HashMap<String, String[]> params=new HashMap<String, String[]>();
            for(int temp = 0; temp < nList.getLength()-1; temp++){
                Node nNode = nList.item(temp);
                Element eElement = (Element) nNode;
                //System.out.println(getTagValue("gubunEn", eElement));
                String[] a = new String[2];
                a[0] = NumberFormat.getInstance().format(Integer.parseInt(getTagValue("defCnt", eElement)));
                a[1] = getTagValue("incDec", eElement);
                String b = getTagValue("gubunEn", eElement).replace("-", "");
        		params.put(b, a);
        		
            }
            return params;
		} catch (Exception e){	
			e.printStackTrace();
			return null;
		}	
		
	}	

	// tag값의 정보를 가져오는 메소드
	private static String getTagValue(String tag, Element eElement) {
	    NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
	    Node nValue = (Node) nlList.item(0);
	    if(nValue == null) 
	        return null;
	    return nValue.getNodeValue();
	}
}	// class end
