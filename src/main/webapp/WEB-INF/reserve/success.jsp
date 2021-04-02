<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="root" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="rsv_success">
	<div class="rsv_success_logo"><img src="${root}/image/covid_symbol.png"></div>
	<div class="rsv_success_main">
	<span class="rsv_success_nick">${mdto.mnick} 님의 예약이 완료되었습니다.</span>
	<span class="rsv_success_text">코비다웃 예약 시스템을 이용해주셔서 감사합니다.</span>
	</div>
</div>
	<div class="rsv_success_btnlist">
		<button type="button" class="rsv__success_gotomainbtn" onclick="location.href='${root}/'">메인으로 돌아가기</button>
		<button type="button" class="rsv__success_gotolistbtn" onclick="location.href='${root}/mypage.reservation'">나의 예약목록보기</button>
	</div>

</body>
</html>