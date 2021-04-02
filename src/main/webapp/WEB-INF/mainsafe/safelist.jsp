<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="${root}/js/jquery-1.8.3.min.js" type="text/javascript"/>
<script src="${root}/js/jquery.royalslider.min.js" type="text/javascript"/>
<link href="${root}/css/mainsafe/royalslider.css" rel="stylesheet">
<link href="../assets/royalslider/skins/default/rs-default.css" rel="stylesheet">
<script src="${root}/js/jquery.royalslider.js" ></script>
<title>Insert title here</title>
</head>
<body>
<!-- 배너 -->
	<div class="sub_visual bg-menu">
		<div class="txt">
		</div>
		<div class="img-cover"></div>
	</div>
<!-- 배너 -->
	
<!-- 메뉴바 -->
<nav class="tabs">
  <div>
    <button class="tab active" onclick="callApiXml()">
      <span class="glyphicon glyphicon-user tab-icon"></span>
      <span class="tab-label">입국</span>
    </button>
    <button class="tab" onclick="callApiAir()">
      <span class="glyphicon glyphicon-plane tab-icon"></span>
      <span class="tab-label">운항</span>
    </button>
    <button class="tab" onclick="callApiCorona()">
      <span class="glyphicon glyphicon-certificate tab-icon"></span>
      <span class="tab-label">코로나</span>
    </button>
    <button class="tab" onclick="callApiIsolation()">
      <span class="glyphicon glyphicon-ban-circle tab-icon"></span>
      <span class="tab-label">격리</span>
    </button> 
  </div>
</nav>
<!-- 메뉴바 -->

<!-- 타이틀 -->
<div class="safe-title-bar">
	<div class="safe-title-box">
		<div class="safe-title"></div>
	</div>
</div>
<!-- 타이틀 -->

<!-- 아코디언 리스트 -->
 <div style="margin: 0 auto;">
	<div class="options">
	   <div class="option active opt1 op1 o1 opti1" id="option1">
	      <div class="label">
	         <div class="icon">
	            <i class="fas fa-angle-double-right"></i>
	         </div>
	         <div class="main" id="countryName1"></div>
	         <div class="info">
	            <div class="sub sub1" id="title1"></div>
	            <div class="sub sub2" id="content1"></div>
	      		<div class="sub sub3" id="wrtDt1"></div>
	         </div>
	      </div>
		</div>
		<div class="option opt2 op2 o2 opti2" id="option2">
	      <div class="label">
	         <div class="icon">
	            <i class="fas fa-snowflake"></i>
	         </div>
	         <div class="main" id="countryName2"></div>
	         <div class="info">
	            <div class="sub sub1" id="title2"></div>
	            <div class="sub sub2" id="content2"></div>
	      		<div class="sub sub3" id="wrtDt2"></div>
	         </div>
	      </div>
	   </div>
	   <div class="option opt3 op3 o3 opti3" id="option3">
	      <div class="label">
	         <div class="icon">
	            <i class="fas fa-tree"></i>
	         </div>
	         <div class="main" id="countryName3"></div>
	         <div class="info">
	            <div class="sub sub1" id="title3"></div>
	            <div class="sub sub2" id="content3"></div>
	      		<div class="sub sub3" id="wrtDt3"></div>
	         </div>
	      </div>
	   </div>
	   <div class="option opt4 op4 o4 opti4" id="option4">
	      <div class="label">
	         <div class="icon">
	            <i class="fas fa-tint"></i>
	         </div>
	         <div class="main" id="countryName4"></div>
	         <div class="info">
	            <div class="sub sub1" id="title4"></div>
	            <div class="sub sub2" id="content4"></div>
	      		<div class="sub sub3" id="wrtDt4"></div>
	         </div>
	      </div>
	   </div>
	   <div class="option opt5 op5 o5 opti5" id="option5">
	      <div class="label">
	         <div class="icon">
	            <i class="fas fa-sun"></i>
	         </div>
	         <div class="main" id="countryName5"></div>
	         <div class="info">
	            <div class="sub sub1" id="title5"></div>
	            <div class="sub sub2" id="content5"></div>
	      		<div class="sub sub3" id="wrtDt5"></div>
	         </div>
	      </div>
	   </div>
	</div>
<!-- 아코디언 리스트 -->

</body>
</html>