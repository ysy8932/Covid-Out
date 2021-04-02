<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="root" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- css -->
<link rel="stylesheet" href="${root}/css/medicine/mainlayout.css" />


<!-- jquery -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<script type="text/javascript">
	$(function() {

		$("#med_searchbtn").click(
			function() {
						var keyword = $("#med_text1").val();
							$.ajax({
									url : 'medicinetest',
									type : 'get',
									dataType : 'xml', // 리턴해주는 타입을 지정해줘야함
									data : {
										"keyword" : keyword},
									beforeSend : function(jqXHR) {
											console.log("ajax호출전");
									},// 서버 요청 전 호출 되는 함수 return false; 일 경우 요청 중단
									success : function(data) {
											//요소이름 뽑아내기
								var len = data.getElementsByTagName("item").length;
								var item = data.getElementsByTagName("entpName"); // 기업
								var item2 = data.getElementsByTagName("itemName"); // 이름
								var item3 = data.getElementsByTagName("itemSeq"); 
								var item4 = data.getElementsByTagName("efcyQesitm");
								var item5 = data.getElementsByTagName("atpnQesitm");
								var item6 = data.getElementsByTagName("depositMethodQesitm");
								var totalCount = data.getElementsByTagName("totalCount");
								console.log(data);

								var s = "<h4>총 "+len+"개의 검색 결과가 있습니다.</h4>";

									for (var i = 0; i < len; i++) {
									
									  s +="<div class='medi_test'><div class='medi_click' id='medi"+i+"' onclick ='answer_list(this)'><div class='medi_no'>"+(i+1)+"</div>";
									  s +="<div class='medi_title'>"+item2[i].childNodes[0].textContent+"<span class='glyphicon glyphicon-list'></span></div></div>";
									  s +="<div class='medi_contents'>";
									  s +="<a>"+item[i].childNodes[0].textContent+"</a></br>";
									  s +="<a> ● 약 소개 : </a>";									  
									  s +="<p> "+item4[i].childNodes[0].textContent+"</p>";
									  s +="<a> ● 복용시 주의 사항 : </a>";									  
									  s +="<p>"+item5[i].childNodes[0].textContent+"</p>";
									  s +="<a> ● 보관시 주의 사항 : </a>";									  	
									  s +="<p>"+item6[i].childNodes[0].textContent+"</p>";
									  s +="</div>";		
											}
											

									$("#med_searchlist").html(s);

									}// success
									}); //ajax 끝

						});// btn 끝

		// 토글 관련 구현
		/* $(".medi_click").on("click", function() {
			//$(this).next(".medi_contents").slideToggle(100);
			alert("??");
		}); */
	});
	
	function answer_list(e){
			if($(".medi_contents").css("display")=="none"){
	            
				$(".medi_contents").slideDown("fast");
	            } else {
	            $(".medi_contents").slideUp("fast");
	            }
			//var a = $(this).attr("id");
			//alert(a);
		
	}
	
</script>

</head>
<body>
	<div class="med_layout_title">
		<div class="med_search_container">
			<h3 onclick="location.href='../medicine/search'">의약품 검색</h3>
		</div>
		<div class="med_search">
			<h4>가지고 있는 약품을 검색해보세요!</h4>
			<input class="med_text1" id="med_text1" type="text" />
			<button type="button" class="med_searchbtn" id="med_searchbtn">
				검색하기</button>
		</div>
	</div>
	<div class="med_searchlist" id="med_searchlist">
		<h3>코비다웃과 함께 의약품을 찾아보아요!</h3>
		<video width="600" height="450" src="${root}/image/medvirus.mp4"
			data-autoplay autoplay muted loop></video>
		<p>※ 해당 검색 화면은 식약처에서 제공해주는 '약은요'api 에서 가져오고 있습니다. 
		정확한 복약지도는 의사 및 약사와 상담하세요</p>
	</div>

</body>

</html>