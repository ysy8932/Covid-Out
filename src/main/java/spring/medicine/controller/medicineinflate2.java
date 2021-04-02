package spring.medicine.controller;

import java.util.Arrays;
import java.util.HashMap;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

public class medicineinflate2 {
		
		public static HashMap<String, String> getInflectionData() {
			try{
				
	            /*chap1. 문서의 주소*/
	            //공공데이터 주소 서비스까지.
	            String addr="http://apis.data.go.kr/1471000/DrbEasyDrugInfoService/getDrbEasyDrugList?serviceKey=";
	            
	            //주소에 들어갈 내 키
	            String servicekey="rxb%2FMc%2BKpaYw%2BENrbWx0Q3KvrSp0W%2BN1g8ee7cFa3B3412ZLvOpSM4FAU8Hf%2FMgu0TuFohVNc%2FPY8cRipYRFkg%3D%3D";
	            
	            //주소에 들어갈 파라미터 넣기.
	            String parameter="&itemName=한미아스피린장용정100밀리그램";
	            //parameter = parameter + "&" + "pageNo=1";
	            //parameter = parameter + "&" + "numOfRows=31";
	            //주소 완성하기!
	            addr = addr + servicekey + parameter;
	            
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
	                inflectionpeople[temp] = Integer.parseInt(getTagValue("entpName", eElement));
	                inflectionday[temp] = getTagValue("itemName", eElement);
	            }	// if end

	            int[] inflectionPeopleResult = new int[31];
	            String[] inflectionDayResult = new String[31];
	            for (int i = 0; i < inflectionpeople.length-1; i++) {
	            	inflectionPeopleResult[i]=inflectionpeople[30-i]-inflectionpeople[31-i];
	            }
	            for (int i = 0; i < inflectionday.length-1; i++) {
	            	inflectionDayResult[i]= inflectionday[30-i];
	            }

	            String a = Arrays.toString(inflectionPeopleResult);
	            String b = Arrays.toString(inflectionDayResult);
	            //System.out.println(a);
	            //System.out.println(b);
	            HashMap<String, String> params=new HashMap<>();
	            params.put("inflectionPeople", a);
	    		params.put("inflectionDay", b);
	    		
	    		return params;
	    		
			} catch (Exception e){	
				
				e.printStackTrace();
				return null;
			}	// try~catch end
			
		}	// main end
		

		// tag값의 정보를 가져오는 메소드
		private static String getTagValue(String tag, Element eElement) {
		    NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
		    Node nValue = (Node) nlList.item(0);
		    if(nValue == null) 
		        return null;
		    return nValue.getNodeValue();
		}
	}	// class end

