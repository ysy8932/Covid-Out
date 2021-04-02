<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>지도 생성하기</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b6754d93f8d097bb07dd758c1b12ba4c&libraries=services"></script>

</head>
<body>
	<div class="hospital_detail_container">
		<input type="hidden" id="loginok" value="${mdto.mid}" /> 
		<input type="hidden" id="keyword" name="keyword" value="${name}">
		<input type="hidden" id="hlist_name" value="${name}" /> 
		<input type="hidden" id="hlist_role" value="${role}"/> 
		<input 	type="hidden" id="hlist_mnum" value="${num}" />
		<div class="hospital_detail_informa">
			<div id="hospital__detail_title" name="hname" value="">${name}</div><br>
			<div class="hospital_detail_txt">
				<div class="hospital__detail_addr">
					<label>위 치 안 내:</label> ${addr}
				</div><br>
				<div class="hospital__detail_tel">
					<label>전 화 번 호:</label>${tel}
				</div><br>
			</div>
			<div>
				<button type="button" id="rsv__btn-insert" class="rsv__btn_update">예약하기</button>
			</div>
		</div>

		<!-- 지도를 표시할 div 입니다 -->
		<div id="hospital__map" class="form-control"></div>
	</div>

</body>
	<script type="text/javascript">
		$(function() {

			$(document).ready(function() {
				var mr = $("#hlist_role").val();
				if (mr == 1) {
					$("#rsv__btn-insert").css("display", "block");
					$(".hospital_detail_txt").css("display", "none");
				}
			});

			$("#rsv__btn-insert").click(function() {
						var loginok = $("#loginok").val();
						var hnum = $("#hlist_mnum").val();
						var hname = $("#hlist_name").val();
						if (loginok != "") {
							location.href = "/reserve/writeform?num="+hnum+"&name="+hname+"";
						} else {
							swal("로그인후 다시 이용해주세요", "", "warning")
						.then(function() {
							location.href = "/member/login";
						});
					}
				});
		});
	</script>
</html>