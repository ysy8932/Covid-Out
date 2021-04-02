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
		<div class="alert alert-info" style="width: 1260px; height: 330px; text-align: center; font-size: 1.2em;">
			<div class="nonelink" style="margin-top: 110px; line-height: 30px;"><a href="doctor/list"><b>스크랩한 글이 없습니다.<br>카드뉴스페이지로 이동하시겠습니까?</b></a></div>
		</div>
	</c:if>
	<c:if test="${totalCount>0}">
		<div class="cscrap-wrap">
			<div class="cscrap-card-wrap">
				<ul class="cscrap-row">
					<c:forEach var="cdto" items="${list }" varStatus="i">
							<li class="dcom-cell">
								<a href="doctor/detail?num=${cdto.cnum}&pageNum=1&key=list">
									<input type="hidden" value="${i.count}">
									<div class="cscrap-con">
										<div class="img-box">
											<!-- 상대경로  ${pageContext.request.contextPath}-->
											<img src="${pageContext.request.contextPath}/resources/save/${cdto.cphoto }" 
													alt="" onerror="this.src='${pageContext.request.contextPath}/resources/image/nonimg.png'">
										</div>
										<div class="cscrap-txt" style="position: relative; max-width: 100%; display: block; white-space: nowrap;">
											<div class="csubject">${cdto.csubject}</div>
											<div class="cwriter">${cdto.cwriter}</div>
											<div class="cday">
												<fmt:formatDate value="${cdto.cwritedate}" pattern="yyyy MM-dd HH:mm" />
											</div>
										</div>
									</div>
								</a>
							</li>
					</c:forEach>
				</ul>
			</div>
			<br>
			<!-- 페이징 -->
			<div class="cpagination">
				
				<ul class="pagination">
					<c:forEach var="pp" begin="${startPage}" end="${endPage}">
						<c:if test="${pp==currentPage}">
							<li class="active"><a href="mypage.cscrap?pageNum=${pp}">${pp}</a></li>
						</c:if>
						<c:if test="${pp!=currentPage}">
							<li><a href="mypage.cscrap?pageNum=${pp}">${pp}</a></li>
						</c:if>
					</c:forEach>
					<c:if test="${endPage<totalPage}">
						<li><a href="mypage.cscrap?pageNum=${endPage+1}">다음</a></li>
					</c:if>
		
				</ul>
			</div>	
		</div>
	</c:if>
	</div>
</div>
</body>
</html>









