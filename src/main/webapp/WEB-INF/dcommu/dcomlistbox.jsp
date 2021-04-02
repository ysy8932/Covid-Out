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
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

<body>

	<!-- card start-->
	<div class="dcom-prod-list-bar dcom-con">
		<div class="dcom-prod-list-box">
			<ul class="dcom-row">
				<c:forEach var="d" items="${list }" varStatus="i">
					<li class="dcom-cell"><a href="detail?num=${d.cnum}&pageNum=${currentPage }&key=list">
							<input type="hidden" value="${i.count}">
							<div class="dcom-img-bar">
								<div class="dcom-img-box">
								<!-- 상대경로  ${pageContext.request.contextPath}-->
									<img src="${pageContext.request.contextPath}/resources/save/${d.cphoto }"alt=""
										onerror="this.src='${pageContext.request.contextPath}/resources/image/nonimg.png'">
								</div>
								<div style="position: relative; max-width: 100%; display: block; white-space: nowrap;">
									<div class="dcom-prod-subject">${d.csubject}</div>
									<div class="dcom-prod-writer">${d.cwriter}</div>
									<div class="dcom-prod-day">
										<fmt:formatDate value="${d.cwritedate}" pattern="yyyy MM-dd HH:mm" />
									</div>
								</div>
							</div>
					</a></li>
				</c:forEach>
			</ul>
		</div>
	</div>
	<!-- card end-->
	
		
<div class="page-bar">
		<ul class="pagination page-box">
			<c:if test="${startPage>1 }">
				<li class="page-item">
					<a class="page-link" href="list?pageNum=${startPage-1 }">이전</a>
				</li>
			</c:if>
			<!-- 페이지 번호 -->
			<c:forEach var="pp" begin="${startPage }" end="${endPage }">
				<c:if test="${pp==currentPage }">
					<li class="page-item">
						<a class="page-link" href="list?pageNum=${pp }">${pp }</a>
					</li>
				</c:if>
				<c:if test="${pp!=currentPage }">
					<li class="page-item">
						<a class="page-link" href="list?pageNum=${pp }">${pp }</a>
					</li>
				</c:if>
			</c:forEach>
			<c:if test="${endPage<totalPage}">
				<li class="page-item">
					<a class="page-link" href="list?pageNum=${endPage+1 }">이전</a>
				</li>
			</c:if>
		</ul>
</div>
</body>
</html>