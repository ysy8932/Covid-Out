<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="<%=request.getContextPath() %>"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Insert title here</title>
<!-- JQuery minimal version 입니당.-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Sweet Alert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!-- Chart JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js"></script>
<!-- Boot Strap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!-- Fabicon error -->
<link rel="shortcut icon" href="data:image/x-icon" type="image/x-icon">
<!-- slick -->
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<title>Insert title here</title>
<!-- CSS 파일 -->
<link rel="stylesheet" href="${root}/css/fullpage.min.css" />
<link rel="stylesheet" href="${root}/css/layout.css" />
<link rel="stylesheet" href="${root}/css/hospital/hospital.css" />
<link rel="stylesheet" href="${root}/css/member.css" />
<link rel="stylesheet" href="${root}/css/mypage/m_member.css" />
<link rel="stylesheet" href="${root}/css/mypage/Mypage.css" />
<link rel="stylesheet" href="${root}/css/mypage/myinformation.css" />
<link rel="stylesheet" href="${root}/css/dcommu/dcomlist.css">
<link rel="stylesheet" href="${root}/css/dcommu/normalize.8.0.1.css">
<link rel="stylesheet" href="${root}/css/hospital/reservation.css" />

<link rel="stylesheet" href="${root}/css/mainsafe/safelist.css">

<!-- JS 파일 -->
<script src="${root}/js/fullpage.min.js" ></script>
<script src="${root}/js/map.js"></script>
<script src="${root}/js/mainpage.js"></script>
<script src="${root}/js/mypage.js"></script>
<script type="text/javascript" src="${root }/js/safelist.js"></script>



</head>
<body>
<div class="layout">
	<div id="header">
		<%//세션에서 로그인 상태를 알 수 있는 loginok 얻기
	        String loginok=(String)session.getAttribute("loginok");
	        if(loginok==null){%>
            	<tiles:insertAttribute name="header"/>
            <%}else{%>
            	<tiles:insertAttribute name="header2"/>
          	<%}%>
	</div>
	
	<div id="main">
	   <tiles:insertAttribute name="main"/>
	</div>
	
	<div id="footer">
	   <tiles:insertAttribute name="footer"/>
	</div>
</div>
</body>

</html>