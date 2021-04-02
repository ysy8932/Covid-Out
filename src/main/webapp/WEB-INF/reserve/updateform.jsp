<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">

<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
</head>
<body>
<div class="mypage_wrapper">
	<div class="mypage_hadder">
		<div class="header_title">
			My Reservation
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
		
			<li>
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
			<li class="mpick">
				<a href="${root}/mypage.reservation">
					<div class="mypage_icon icon_reservation"></div>
					예약내역
				</a>
			</li>
			<li>
				<a href="${root}/mypage.information">
					<div class="mypage_icon icon_myinformation"></div>
					나의 정보
				</a>
			</li>
		</ul>
	</div>
	
	
	<!-- 내용 시작 -->
	<div class="mycontent_reservation">
<div class="rsv__con">
<div class="rsv__container1">
 		<input type="hidden" name="name" value="${name}" />
		<h2 class="rsv__title">병원 예약 수정</h2>
		
		<h3 class="rsv__section_title">${name}</h3>
		<p class="rsv__section_txt">
			날짜와 시간, 진료보실 내용만 수정이 가능합니다.<br> 다른 병원 예약을 원하시면 다시 예약해주세요<br>
		<hr>		
		<form action="update" method="post" enctype="multipart/form-data">
	<!-- hidden -->
	<input type="hidden" name="rnum" value="${dto.rnum}">

	<div class="rsv__section4">
				<input type="text" id="rsv__select_date" name="rdate"
					value="${dto.rdate}"/> 
					<input type="text"
					id="rsv__select_time" class="rsv__select" name="rtime"
					value="${dto.rtime}"/>
			</div>
			<div class="rsv__section4">
				<input type="hidden" name="rmnum" class="rsv__select_name" value="${dto.rmnum}" readonly="readonly"> 
				<input type="hidden" name="rdmnum" class="rsv__select" value="${dto.rdmnum}" readonly="readonly">
				<label>증 상 내 용</label><br>
				<input id="rsv__memo" name="rmemo" class="rsv__select" value="${dto.rmemo}">
			</div>
		
		<div class="rsv__section3">
			<hr>
			<button type="submit" class="rsv__updateformbtn">예약수정</button>
			<button type="button" class="rsv__gotolistbtn" onclick="location.href='${root}/mypage.reservation'">목록</button>
		</div>
		</form>
</div>
</div>
</div>
</body>
<script type="text/javascript">

//datepicker기능
$("#rsv__select_date").flatpickr({ 
inline: true,
dateFormat: "Y-m-d",
minDate:"today",//오늘이전은 선택불가 
//maxDate: new Date().fp_incr(30) //오늘로부터 30일이후까지만 선택가능
});

//timepicker기능
$("#rsv__select_time").flatpickr({ 
	enableTime: true,
    noCalendar: true,
    dateFormat: "H:i",    
    minTime: "08:00",
    maxTime: "20:00",
    minuteIncrement : "30"	
	});

</script>

</html>