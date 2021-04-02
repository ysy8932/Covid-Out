<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<body>
   <div class="hospital__list">
      <div id="hospital__list_title">국민안심병원</div>
      <!--탭 박스-->
      <div class="hospital__list_tabbox">
         <div id="hospital__list_tablist">
         
            <a class="hospital__list_listitem active1" name="A0" id="tab1">국민안심병원</a> 
            <a class="hospital__list_listitem" name="97" id="tab2">호흡기전담클리닉</a> 
               <a class="hospital__list_listitem" name="99" id="tab3">선별진료소</a> 
               <a class="hospital__list_listitem" name="98" id="tab4">예약가능병원</a>
            <a class="hospital__list_listitem" name="" id="hlist_viewlistbtn">전체목록</a>   
         </div>
      </div>
      <!--검색창-->
      <!-- <div id="hospital__list_inputform" class="hospital__list_inputform">
         <div class="hospital__list_searchcont">         
            <form class="hospital__list_search_area" name="fmList" >
               <input type="hidden" name="page" value="1" id="hlist_page"> 
               <input class="hospital__list_search_text" id="hlist_searchtext" type="text" name="SEARCHVALUE" id="SEARCHVALUE" value="" placeholder="검색어를 입력하세요"> 
               <input type="button" id="hlist_searchbtn" class="hospital__list_search_btn
               " value="검색" /> 
               <button type="button" id="hlist_viewlistbtn" class="hospital__list_viewlist_btn">전체목록</button>-->
           <!--  </form>
            <div class="hospital__search_info">
               <p>시도 및 시군구, 기관명, 전화번호를 통합하여 검색합니다.</p>
               <span>검색어 예시 : <span class="line">'서울'</span> 또는 <span
                  class="line">'중구'</span>또는 <span class="line">'보건소'</span>또는 <span
                  class="line">'051'</span>(전화번호 일부)
               </span>
            </div>
         </div>
      </div> -->

      <!-- Cards section -->
      <div id="hospital__list_container">
      </div>
	
		<div id="hospital__list_container2">
     
      <div class="hospital__list_cards">
       <c:forEach var="m" items="${list}" varStatus="i">      
   		<div class="hospital__list_card">
         <h3 class="hospital__list_hname" id="hlist_name">${m.mnick }</h3>
        <input type="hidden" id="hlist_role" value="${m.mrole }">
        <input type="hidden" id="hlist_hnum" value="${m.mnum }">
      </div> </c:forEach>        
       </div>
        
      </div>
       
      <!-- 페이징처리할것 -->
    
      <nav aria-label="Page navigation example" id="pagination"></nav>
      
   </div>
   <!-- <button id="btn">버튼</button>
   <div id="idd">강남성모</div>  -->
   <script>
   var hcates =['', 'A0','97','99'];
   
   /* var fname =new URL(location.href).searchParams.get('fname');
   var page =new URL(location.href).searchParams.get('page');
   console.log(fname);
   console.log(page); */
   //console.log(pageNum);
   /* ajax로 xml에서 item객체목록가져오기 */
   function getData(hcate, pageNum) { 
      
       $.ajax({
          url:'/hospital/list',
          type:'get',
          dataType:'xml',
          data : {"hcate" : hcate, "pageNum" : pageNum},
          beforeSend:function(jqXHR) {
              console.log("ajax호출전");
          },// 서버 요청 전 호출 되는 함수 return false; 일 경우 요청 중단
          success: function(data) {                   
                 var container = document.getElementById("hospital__list_container");
                container.style.display="grid";
               //요소이름 뽑아내기
               var item = data.getElementsByTagName("item");
               var yadmNm = data.getElementsByTagName("yadmNm");
               var sidoNm = data.getElementsByTagName("sidoNm");
               var sgguNm = data.getElementsByTagName("sgguNm");
               var telno = data.getElementsByTagName("telno");

               //doc내의 class다 가져오기
                 //var cards = document.getElementById('hospital__list_cards');
                //var card = document.querySelectorAll('.hospital__list_card'); 
                //var h3 = document.getElementsByTagName('h3');
                                      
                var h = '<div class="hospital__list_cards">';
             for (var i=0; i< item.length; i++) {
                                
                var hname= yadmNm[i].textContent;
                var sido = sidoNm[i].textContent;
            var sggu = sgguNm[i].textContent;
            var tel =telno[i].textContent;
            var addr = sido + sggu;
            //console.log(addr);
               h += '<div class="hospital__list_card">';
                h += '<h3 class="hospital__list_hname" id="hlist_name">'+hname+'</h3>';
               h += '<p class="hospital__list_addr" id="hlist_addr">'+addr+'</p>';
               h += '<p class="hospital__list_tel" id="hlist_tel">'+tel+'</p>';
               h += '</div>';
                  }
                h += '</div>';
                $("#hospital__list_container").html(h);
                
                searchPagingList(hcate,pageNum); 
           }//success
       });
   }

   /* 전체목록보기 누르면 전체 데이터 불러오기 */
   //js방식
   const listbtn = document.getElementById("hlist_viewlistbtn");
   listbtn.addEventListener("click", function() {
      getData(hcates[0]);
   });
   //jquery방식 (동일하게작동)
   //$("#hlist_viewlistbtn").click(function(){
   //   getData(hcates[0]);
   //});       
       
   /* hospitalmain에서 아이콘 누르면 해당되는 목록 불러오기 */
    var tablist = document.getElementById("hospital__list_tablist");
    var title = document.getElementById("hospital__list_title");
    var btns = tablist.getElementsByClassName("hospital__list_listitem");
   
    $(document).ready(function(){
	
    if (location.hash == "#tab1"){
    		$('#hospital__list_tablist').find('a').eq(0).addClass(' active1').siblings().removeClass(' active1');
    		$('.hospital__list_listitem').find('#tab1').addClass(' active1').siblings().removeClass(' active1');
    		 
    } else if(location.hash == "#tab2"){
		$('#hospital__list_tablist').find('a').eq(1).addClass(' active1').siblings().removeClass(' active1');
		$('.hospital__list_listitem').find('#tab2').addClass(' active1').siblings().removeClass(' active1');
		 
    } else if(location.hash == "#tab3"){
		$('#hospital__list_tablist').find('a').eq(2).addClass(' active1').siblings().removeClass(' active1');
		$('.hospital__list_listitem').find('#tab3').addClass(' active1').siblings().removeClass(' active1');
		 
    } else if(location.hash == "#tab4"){
    	$('#hospital__list_tablist').find('a').eq(3).addClass(' active1').siblings().removeClass(' active1');
		$('.hospital__list_listitem').find('#tab4').addClass(' active1').siblings().removeClass(' active1');
	 
    }    
    var current = document.getElementsByClassName("active1");  
    for (i = 0; i < current.length; i++) {
    	var hcate =current[i].getAttribute('name');
    	 if(hcate=="98"){
      	   $("#hospital__list_container2").css("display", "grid");
      	   $("#hospital__list_container").css("display", "none");
      	 	$("#pagination").css("display", "none");
         }else{
         getData(hcate);
         $("#hospital__list_container2").css("display", "none");
         $("#pagination").css("display", "block");
         }
    	}
    });
		
     /*탭 클릭시 리스트불러오기*/
    for (var i = 0; i < btns.length; i++) {
       btns[i].addEventListener("click", function () {
       var current = document.getElementsByClassName("active1");  
          if (current.length > 0) {
             current[0].className = current[0].className.replace(" active1", "");                            
          }
         this.className += " active1"; 
       var hcate =$(this).attr('name');
       if(hcate=="98" && $(this).hasClass("active1")){
    	   console.log(this);
    	   $("#hospital__list_container2").css("display", "grid");
    	   $("#hospital__list_container").css("display", "none");
    	   $("#pagination").css("display", "none");
       }else{
       getData(hcate);
       $("#hospital__list_container2").css("display", "none");
       $("#pagination").css("display", "block");
       }
       })
    }
    
 
   
   /*  해당병원 카드 클릭하면 디테일페이지로 넘어가기 */
    const card = document.getElementsByClassName("hospital__list_card");
    $(document).ready(function(){
    $(document).on("click",".hospital__list_card",function(e) {
       //console.log(this);
       var hname = $(this).children("#hlist_name").text();
       var haddr = $(this).children("#hlist_addr").text();
       var htel = $(this).children("#hlist_tel").text();
       var mrole = $(this).children("#hlist_role").val();
       var hnum = $(this).children("#hlist_hnum").val();
       //console.log(mrole);
       //children에서 결과를 찾아도 되고 find로 해도 동일하게 작동함 
       //var htel = $(this).find("#hlist_tel").text();
              
       location.href="hospitaldetail?name="+hname+"&addr="+haddr+"&tel="+htel+"&role="+mrole+"&num="+hnum+"";
       
       });
    });
    
    
var nPageListCnt = "";

//페이지의 너비가 변경될 경우 페이징 번호를 변경한다.
$(document).ready(function(){
   $(window).resize(function(){
      
      var x = $(window).width();      // 현재 화면의 너비 값

      // 너비 값이 특정 값 이상 줄어들면 페이징을 변경한다.
      if(x < 1000){
          // 페이지 리스트 카운트 개수는 5개로 변경한다.
         nPageListCnt = 5
      }else{
          // 페이지 리스트 카운트 개수는 10개로 변경한다.
         nPageListCnt = 10
      }
      
      searchPagingList();      // 호출
      
   }).resize();
   
   $(document).on('click', '.hdn', function(){
     var pageNum=$(this).text();
     
     //console.log("버튼클릭 : "+ pageNum);
     
     var hcate =$(".hospital__list_listitem.active1").attr('name');
     $(this).addClass("active");
     //console.log("액티브:"+hcate);
       getData(hcate, pageNum);
       searchPagingList(hcate,pageNum);
   });
   
   
   $(document).on('click', '.next', function(){
        var pageNum=$(this).val();
        
        //console.log("버튼클릭 : "+ pageNum);
        
        var hcate =$(".hospital__list_listitem.active1").attr('name');
        $(this).addClass("active");
        //console.log("액티브:"+hcate);
          getData(hcate, pageNum);
          searchPagingList(hcate,pageNum);
   });
   
   $(document).on('click', '.prev', function(){
        var pageNum=$(this).val();
        
        //console.log("버튼클릭 : "+ pageNum);
        
        var hcate =$(".hospital__list_listitem.active1").attr('name');
        $(this).addClass("active");
        //console.log("액티브:"+hcate);
          getData(hcate, pageNum);
          searchPagingList(hcate,pageNum);
   });
   
   
});



//창 너비가 변경될 경우 호출하여 페이징 번호를 새로 뿌려준다.
   
function searchPagingList(hcate,pageNum){   
   
   if(hcate =="A0") {
      var totalCount = "261";
   }else if(hcate == "97") {
      var totalCount = "101";
   }else if(hcate == "99") {
      var totalCount = "653";
   }else 
      var totalCount = "1017";
   // 페이지 정보
   var nRowCount = "9";
   var totalCntDivide = "";
   //console.log("gggg:" +pageNum);
   //var nPage = pageNum;
   if(typeof pageNum !== 'undefined'){
       var nPage = pageNum;
       }else{
       var nPage = 1;
       }
   
   //var strListLink = "#hlist1";
   var strAnker = "";
   //console.log(nPage);
   if(totalCount > 0){
      var pageHtml = "";
   
      if((totalCount % nRowCount) == 0 ){
         totalCntDivide = 0;
      }else{
         totalCntDivide = 1;
      }
   
      var nTotalPageCnt = Math.floor((totalCount / nRowCount) + totalCntDivide);   // 총 페이지 건수, 소수점 아래 버린다.
      //console.log("ntotalpagecnt : " + nTotalPageCnt);
      var nPagePerCnt = Math.floor(( nPage - 1) / nPageListCnt);   // 소수점 아래 버린다.
      //console.log("nPagePerCnt : " + nPagePerCnt);
      var nStartPageNum = (nPageListCnt * nPagePerCnt) + 1;
      //console.log("nStartPageNum : " + nStartPageNum);
      var nEndPageNum = nPageListCnt * ( nPagePerCnt + 1);
      //console.log("nEndPageNum : " + nEndPageNum);
      
      
      
      var prevpage = nStartPageNum-1;
      var nextpage = nEndPageNum+1;
      
      
      
      pageHtml = "<ul>";
      
      if( nPage > nPageListCnt) {
         var nStartNum = nStartPageNum - 1;
         pageHtml += "<li class=\"prev\" value="+prevpage+">Prev</a></li>";
      }
      pageHtml += "</li>";
      
      var nPageCount = 0;
      var nPageNum = 0;
      
      
      
      while( nPageCount < nPageListCnt && ( nStartPageNum + nPageCount) <= nTotalPageCnt){
         nPageNum = nPageCount + nStartPageNum;
         nPageCount++;
         if( nPage == nPageNum) {
            pageHtml += "<li class=\"current\">" + nPageNum + "</li>";
         }else {
            pageHtml += "<li><b href=\"?page="+nPageNum + "" + strAnker + "\" title="+nPageNum+" class=\"hdn\">"+ nPageNum +"</b></li>";
         }
      }
      
      
      if( nTotalPageCnt > nEndPageNum) {
         var nEndNum = nEndPageNum + 1;
         pageHtml += "<li class=\"next\" value="+nextpage+">Next</a></li>";
      }
      pageHtml += "</ul>";
      /* if(nTotalPageCnt > 0){
         if(nTotalPageCnt == nPage){
            pageHtml += "<span class=\"last\"><strong>마지막페이지(예전)</strong>";
         } else {
            pageHtml += "<span class=\"last\"><a href=\"?page="+ nTotalPageCnt +""+ strAnker +"\" title=\"마지막페이지(예전) 이동\">마지막페이지(예전)</a>";
         }
      } */
      pageHtml += "</span>";
      
      $("#pagination").html(pageHtml);
      //console.log(pageHtml);
      //document.getElementById("pageNumHtml").innerHTML = pageHtml;
      }
   

   }

const btn = document.getElementById("btn");
const idd = document.getElementById("idd").textContent;
btn.addEventListener("click", function() {
	searchList(hcates[0], idd);
});

function searchList(hcate, keyword)
{
	$.ajax({
        url:'/hospital/list',
        type:'get',
        dataType:'xml',
        data : {"hcate" : hcate, "keyword" : keyword},
        beforeSend:function(jqXHR) {
            console.log("ajax호출전");
        },// 서버 요청 전 호출 되는 함수 return false; 일 경우 요청 중단
        success: function(data) {
        	console.log(keyword);
        	$(data).find('item').each(function(){ // xml 문서 item 기준으로 분리후 반복
        		var yadmNm = $(this).find("yadmNm").text(); 
        		var sidoNm = $(this).find("sidoNm").text(); 
        		var sgguNm = $(this).find("sgguNm").text(); 
        		var telno = $(this).find("telno").text();
        	
        		 if (yadmNm.indexOf(keyword) != -1) {

        			 var y =$(this).getElementsByTagName("yadmNm");
        			 console.log(y);
        		
        		} 
        		//var view_text = yadmNm + sidoNm + sgguNm + telno ;

        		//$("#idd").append(view_text); // #id 에 view_text 삽입
        		
        	}); 
        	}
	})
}

        		
	
	/* 
	var searchvalue = document.getElementById("SEARCHVALUE");
	var searchQuery	= searchvalue.value;

		if(searchQuery == ""){
			alert("검색어를 입력하세요");
			searchvalue.focus();
			return false;
		}
		//특수문자 체크
		if (containsChars(form.SEARCHVALUE,"~!@#$%^&*()+|`-=\\[]{};:'\",.<>/?")) {
			alert("검색 필드에는 특수 문자를 사용할 수 없습니다.");
			form.SEARCHVALUE.focus();
			return false;
		}
	console.log */
	//form.page.value = 1;
	
	//form.submit();


/* const btn = document.getElementById("btn");
btn.addEventListener("click", function() {
	searching(hcates[0]);
});
function searching (hcate) {
	
	$.ajax({
        url:'/hospital/list',
        type:'get',
        dataType:'xml',
        data : {"hcate" : hcate},
        beforeSend:function(jqXHR) {
            console.log("ajax호출전");
        },// 서버 요청 전 호출 되는 함수 return false; 일 경우 요청 중단
        success: function(data) {
           //console.log("ajax start page : "+pageNum);
           
           var item = data.getElementsByTagName("item");
           console.log(item);
 	XmlNodeList nodes = root.SelectNodes("//items/item");
 	console.log(nodes);
	foreach (XmlNode node in nodes)
	{
	    listBox1.Items.Add(node["name"].InnerText);
	}
        } 
	})

} */
</script>
</body>