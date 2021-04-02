<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>

<body>
	<div class="mypage_wrapper">
		<div class="mypage_hadder">
			<div class="header_title">My Reservation</div>
		</div>


		<!-- 메뉴 -->

		<div class="mypage_menubar">
			<ul class="mypage_menu_icon">
				<li><a href="${root}/mypage.main">
						<div class="mypage_icon icon_mypage"></div> 마이페이지
				</a></li>

				<li><a href="${root}/mypage.content">
						<div class="mypage_icon icon_mycontent"></div> 내가 쓴 글
				</a></li>
				<li><a href="${root}/mypage.scrap">
						<div class="mypage_icon icon_scrap"></div> 스크랩
				</a></li>
				<li class="mpick"><a href="${root}/mypage.reservation">
						<div class="mypage_icon icon_reservation"></div> 예약내역
				</a></li>
				
			</ul>
		</div>


		<!-- 내용 시작 -->
		<div class="mycontent_reservation">
			
			<!-- 안에 채우시오. -->
			<div class="rsv__con">
				<div class="rsv__container">

					<c:if test="${totalCount==0}">
						
							<h2 class="rsv__title">예약하신 내역이 없습니다.</h2>
							<p class="rsv__section_txt">
								코비다웃 예약서비스를 이용해주셔서 감사합니다.<br> 예약서비스 이용시 불편함이 없도록 최선을
								다하겠습니다.
							</p>
						
					</c:if>
					<c:if test="${totalCount>0}">
						<h2 class="rsv__title">예약 확인</h2>
						<p class="rsv__section_txt">
							코비다웃 예약서비스를 이용해주셔서 감사합니다.<br> 예약서비스 이용시 불편함이 없도록 최선을 다하겠습니다.
						</p>
					</c:if>


					<hr>
					<div class="rsv_list">
						<c:forEach var="a" items="${list}" varStatus="i">
							<input type="hidden" name="rnum" value="${a.rnum}" />
							<input type="hidden" name="rmnum" value="${a.rmnum }" />
							<div class="rsv__listbox">
								<div class="rsv__listbox_time">
									<div class="rsv__listbox_timeinfo">
										<div>${a.rdate}</div>
										<div>${a.rtime}</div>
									</div>
								</div>
								<div class="rsv_listbox_info">
									<div class="rsv__list_name">예 약 자 : ${mdto.mid}님</div>
									<div class="rsv__list_hname">병 원 이 름 : ${a.mnick}</div>
									<div>증 상 내 용 :${a.rmemo}</div>
									<div>예약되어있습니다.</div>
									<div class="rsv__list_btn">
										<input type="button" class="rsv__btn_update"
											onclick="location.href='reserve/updateform?rnum=${a.rnum}&name=${a.mnick}'"
											value="예약변경하기" /> 
											<input type="button"
											class="rsv__btn_delete" value="예약취소하기"
											onclick="delReserve(${a.rnum})" />
									</div>
								</div>

							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
		

	</div>
	<script type="text/javascript">
function delReserve(rnum) {
swal({
    title: "예약을 취소 하시겠습니까?",
    icon: "warning",
    buttons: true,
    dangerMode: true,
}).then((willDelete) => {
	  if (willDelete) {
		    swal('', '예약이 취소되었습니다.', "success")
		     
		      location.href="/reserve/delete?rnum="+rnum;
		   
		  } else {
		    swal("예약 취소를 중단하였습니다.");
		  }
		});
}
</script>
</body>
</html>