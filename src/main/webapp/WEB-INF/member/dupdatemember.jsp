<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="<%=request.getContextPath() %>"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<div class="insert_member_container">
	<div class="insert_member_wrapper">
		<form action="updatemember" method="post" id="signupform">
			<input type="hidden" name="mrole" value="1">
			
			
			<h2 class="signup_main_title">전문인 정보수정</h2>
			
			<label class="signup_input">
				<input type="text" name="mid" class="mid" value="${mdto.mid}" readonly>
				<span class="signup_input_sp update"> <span class="glyphicon glyphicon-user"></span> ID</span>
			</label>
			
			<label class="signup_input">
				<input type="text" name="mnick" class="mnick" value="${mdto.mnick}" required>
				<span class="signup_input_sp"> <span class="glyphicon glyphicon-user"></span> Nick Name</span>
			</label>
			
			<label class="signup_input">
				<input type="text" name="memail" class="memail" value="${mdto.memail}" readonly>
				<span class="signup_input_sp update"> <span class="glyphicon glyphicon-envelope"></span> Email</span>
			</label>
			
			<input type="hidden" name="mpw" class="mpw" required>
			
			<label class="signup_input">
				<input type="text" name="mhp" class="mhp" value="${mdto.mhp}" required>
				<span class="signup_input_sp"> <span class="glyphicon glyphicon-earphone"></span> Phone Number</span>
			</label>
			
			<div class="signup_exbox">
				<div class="signup_explain">
				 저희 코드아웃사이트는 고객과의 채팅프로그램이 설계되어 있습니다.<br>
				해당 기능을 희망하시면 희망함에 체크해주세요.
				</div>
				
				
				
				
				<div class="signup_radio">
					<label>
					
					
						<input type="radio" name="mchat" value="1" <c:if test="${mdto.mchat==1}">checked</c:if>>
						<span>Yes</span>
					</label>
					<label>
						<input type="radio" name="mchat" value="0" <c:if test="${mdto.mchat==0}">checked</c:if>>
						<span>No</span>
					</label>
				</div>
			</div>
			
			
			
			
			<div class="insert_member_btn">
				<button class="insrt_membtn" type="submit">수정</button><br>
				<button class="insrt_membtn insrt_membtn2" type="button" onclick="history.back();">취소</button>
			</div>
		</form>
	</div>
</div>
</body>
</html>