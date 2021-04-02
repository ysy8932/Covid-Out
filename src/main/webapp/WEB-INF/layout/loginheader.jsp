<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="<%=request.getContextPath() %>"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
    $(document).ready(function(){
    
       $('.total').click(function(){
            $(this).toggleClass('on');
            $('.slide_bar_out').toggleClass('on');
       });
       
       $('.menu_login').hover(function(){
    	   $('.login_icon0').css('opacity','0');
    	   $('.login_icon1').css('opacity','1');
       },function(){
    	   $('.login_icon0').css('opacity','1');
    	   $('.login_icon1').css('opacity','0');
       });
       
    });
    
</script>

</head>
<body>



<div class="menu_bar">

	<div class="total">
        <span></span>
    </div>
    
    
    
    <div class="menu_title">
    	<a href="${root}/home">
    	<b>COVID-OUT</b>
    	</a>
    </div>
    
    <div class="menu_login">
    	<a href="${root}/member/logout">
    		<img class="login_icon0" src="${root}/image/login_green.svg"/>
    	</a>
    </div>
	    
    
</div>




<div class="slide_bar_out">
	<div class="slide_bar">
		<ul class="slide_bar_list">
			<li><a href="${root}/hospitalmain">병원안내/예약</a></li>
			<li><a href="${root}/safe/list">방역수칙</a></li>
			<li><a href="${root}/doctor/list">카드뉴스</a></li>
			<li><a href="${root}/board/list">커뮤니티</a></li>
			<li><a href="${root}/medicine/search">의약품검색</a></li>
		</ul>
		<ul class="slide_bar_list end">
			<li><a href="${root}/mypage.main">마이페이지</a></li>
			<li><a href="${root}/member/logout">로그아웃</a></li>
		</ul>
	</div>
</div>

</body>
</html>