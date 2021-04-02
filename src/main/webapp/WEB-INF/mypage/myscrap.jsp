<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="root" value="<%=request.getContextPath() %>"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>

<!-- css -->
<link rel="stylesheet" href="${root}/css/mypage/m_scrap.css" />

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
					<div class="mypage_icon icon_mycontent"></div>
					마이페이지
				</a>
			</li>
			<li>
				<a href="${root}/mypage.content">
					<div class="mypage_icon icon_mycontent"></div>
					내가 쓴 글
				</a>
			</li>
			<li class="mpick">
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
	
	<div class="mycontent_scrap">
	<!-- 내용 시작 -->
	<h2><b>스크랩</b></h2>
	<div class="scrapbtn">
		<button type="button" class="sbtn bscrap" onclick="location.href='/mypage.scrap'" style="float:left;">커뮤니티</button>
		<button type="button" class="sbtn cscrap" onclick="location.href='/mypage.cscrap'" style="float:right;">카드뉴스</button>
	</div>
	<c:if test="${totalCount==0}">
		<table class="bscrap-table">
				<thead>
					<tr>
						<th style="width: 10%">번호</th>
						<th style="width: 50%">제목</th>
						<th style="width: 20%">작성자</th>
						<th style="width: 20%">작성날짜</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td colspan="4">등록된 글이 없습니다.</td>
					</tr>
				</tbody>
		</table>
	</c:if>
	<c:if test="${totalCount>0}">
		<table class="bscrap-table">
				<thead>
					<tr>
						<th style="width: 10%">번호</th>
						<th style="width: 40%">제목</th>
						<th style="width: 30%">작성자</th>
						<th style="width: 20%">작성날짜</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="bdto" items="${list }" varStatus="i">
						<tr>
							<td>${i.count }</td>
							<td style="cursor: pointer;"><a href="board/boardcontent?bnum=${bdto.bnum}&pageNum=1">${bdto.bsubject }</a></td>
							<td>${bdto.bwriter }</td>
							<td><fmt:formatDate value="${bdto.bwritedate }" pattern="yyyy-MM-dd"/></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
			<div style="width: 800px; text-align: center;">
				
				<ul class="pagination">
					<c:forEach var="pp" begin="${startPage}" end="${endPage}">
						<c:if test="${pp==currentPage}">
							<li class="active"><a href="mypage.scrap?pageNum=${pp}">${pp}</a></li>
						</c:if>
						<c:if test="${pp!=currentPage}">
							<li><a href="mypage.scrap?pageNum=${pp}">${pp}</a></li>
						</c:if>
					</c:forEach>
					<c:if test="${endPage<totalPage}">
						<li><a href="mypage.scrap?pageNum=${endPage+1}">다음</a></li>
					</c:if>
		
				</ul>
			</div>
	</c:if>
	</div>
</div>
</body>
</html>