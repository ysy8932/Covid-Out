<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="<%=request.getContextPath() %>"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="${root}/css/mypage/mycontents.css" />

</head>
<body>
<div class="mypage_wrapper">
	<div class="mypage_hadder">
		<div class="header_title">
			My Contents
		</div>
	</div>
	
	<!-- 메뉴 -->
	
	<div class="mypage_menubar">
		<ul class="mypage_menu_icon">
			<li>
				<a href="${root}/mypage.main">
					<div class="mypage_icon icon_mypage"></div>
					마이페이지
				</a>
			</li>
		
			<li class="mpick">
				<a href="${root}/mypage.content">
					<div class="mypage_icon icon_mycontent"></div>
					내가 쓴 글
				</a>
			</li>
			<li>
				<a href="${root}/mypage.scrap">
					<div class="mypage_icon icon_scrap"></div>
					스크랩
				</a>
			</li>
			<li>
				<a href="${root}/mypage.reservation">
					<div class="mypage_icon icon_reservation"></div>
					예약내역
				</a>
			</li>
		</ul>
	</div>
	
	
	<!-- 내용 시작 -->
	<div class ="my_board_list">
			<h4> 총 ${totalCount} 개의 글이 있습니다. </h4>
			<div class="w3-row-padding" style = "margin-top : 10px">
				<c:forEach var="b" items="${list}">
				<div class="w3-third w3-container w3-margin-bottom my_boardtu">

				<img src="${pageContext.request.contextPath}/resources/save/${b.bphoto}" alt="Norway" 
								class="w3-hover-opacity my_boardimg"
								onclick="location.href='../board/boardcontent?bnum=${b.bnum}&pageNum=${currentPage}'"
								 onerror = "this.src='/image/no_image.png'">
							
						
					<div class="w3-container w3-white">
						<p>
							<b>${b.bsubject}</b>
						</p>
						<p><fmt:formatDate value="${b.bwritedate}" pattern="yyyy.MM.dd"/></p>
					</div>
				</div>
				</c:forEach>
				
				</div>
			</div>
			
			
			<div style="width: 800px; text-align: center;">
		
		<ul class="pagination">
			<c:forEach var="pp" begin="${startPage}" end="${endPage}">
				<c:if test="${pp==currentPage}">
					<li class="active"><a href="list?pageNum=${pp}">${pp}</a></li>
				</c:if>
				<c:if test="${pp!=currentPage}">
					<li><a href="mypage.content?pageNum=${pp}">${pp}</a></li>
				</c:if>
			</c:forEach>
			<c:if test="${endPage<totalPage}">
				<li><a href="mypage.content?pageNum=${endPage+1}">다음</a></li>
			</c:if>

		</ul>
	</div>

</div>
</body>
</html>