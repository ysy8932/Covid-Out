<%@page import="java.util.List"%>
<%@page import="spring.card.dao.CardDao"%>
<%@page import="spring.dto.CardDto"%>
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
</head>
<script type="text/javascript">
	$(function() {
		$('head').append("<style>.slick-prev:before{color:black; font-size:36px; position:absolute; left:-25px; top:-3px;}"+
				".slick-next:before{color:black; font-size:36px;}"+"</style>")
		$('#dcom-slider-list').slick({
			slide: 'li',		//슬라이드 되어야 할 태그 ex)
			infinite : true, 	//무한 반복 옵션	 
			slidesToShow : 5,		// 한 화면에 보여질 컨텐츠 개수
			slidesToScroll : 3,		//스크롤 한번에 움직일 컨텐츠 개수
			speed : 1000,	 // 다음 버튼 누르고 다음 화면 뜨는데까지 걸리는 시간(ms)
			arrows : true, 		// 옆으로 이동하는 화살표 표시 여부
			dots : true, 		// 스크롤바 아래 점으로 페이지네이션 여부
			autoplay : true,			// 자동 스크롤 사용 여부
			autoplaySpeed : 5000, 		// 자동 스크롤 시 다음으로 넘어가는데 걸리는 시간 (ms)
			pauseOnHover : true,		// 슬라이드 이동	시 마우스 호버하면 슬라이더 멈추게 설정
			vertical : false,		// 세로 방향 슬라이드 옵션
			prevArrow : "<button type='button' class='slick-prev' style='color:black;'>Previous</button>",		// 이전 화살표 모양 설정
			nextArrow : "<button type='button' class='slick-next' style='color:black;'>Next</button>",		// 다음 화살표 모양 설정
			dotsClass : "slick-dots", 	//아래 나오는 페이지네이션(점) css class 지정
			draggable : true, 	//드래그 가능 여부 
			
			responsive: [ // 반응형 웹 구현 옵션
				{  
					breakpoint: 1000, //화면 사이즈 1000px
					settings: {
						//위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
						slidesToShow:4,
						slidesToScroll : 2
					} 
				},
				{ 
					breakpoint: 800, //화면 사이즈 800px
					settings: {	
						//위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
						slidesToShow:3,
						slidesToScroll : 2
					} 
				},
				{ 
					breakpoint: 600, //화면 사이즈 600px
					settings: {	
						//위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
						slidesToShow:2,
						slidesToScroll : 2
					} 
				},
				{ 
					breakpoint: 400, //화면 사이즈 400px
					settings: {	
						//위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
						slidesToShow:1,
						slidesToScroll : 1
					} 
				}
			]
		});
	})
	
</script>
<body>
	<!-- slide start-->
	<div class="dcom-slide-bar">
		<div class="dcom-slide-box">
			<div><h4><b>인기 조회 게시물 TOP10</b></h4></div>
			<ul class="dcom-slide-list" id="dcom-slider-list">
				<c:forEach var="d" items="${dlist }" varStatus="i">
					<li class="dcom-slide">
						<a href="detail?num=${d.cnum}&pageNum=${currentPage }&key=list">
							<input type="hidden" value="${i.count}">
							<div class="slide-img-bar" id="slide-img-bar">
								<div class="slide-img-box" id="slide">
								<!-- 상대경로  ${pageContext.request.contextPath}-->
									<img src="${pageContext.request.contextPath}/resources/save/${d.cphoto }" alt=""
										onerror="this.src='${pageContext.request.contextPath}/resources/image/nonimg.png'">
								</div>
								<div class="slide-txt-box">
									<div class="dcom-prod-subject">${d.csubject}</div>
									<div class="dcom-prod-writer">${d.cwriter}</div>
									<div class="dcom-prod-day">
										<fmt:formatDate value="${d.cwritedate}" pattern="yyyy MM-dd HH:mm" />
									</div>
								</div>
							</div>
						</a>
					</li>
				</c:forEach>
			</ul>
		</div>
	</div>
	<!-- slide end-->
</body>
</html>