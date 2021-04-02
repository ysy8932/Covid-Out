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
	<div class="insert_member_wrapper mform">
		<form action="savemember" method="post" id="signupform">
			<input type="hidden" name="mrole" value="0">
			<input type="hidden" name="mchat" value="0">
			
			<h2 class="signup_main_title">일반인 회원가입</h2>
			
			<label class="signup_input">
				<input type="text" name="mid" class="mid" required>
				<span class="signup_input_sp"> <span class="glyphicon glyphicon-user"></span> ID</span>
			</label>
			
			<label class="signup_input">
				<input type="text" name="mnick" class="mnick" required>
				<span class="signup_input_sp"> <span class="glyphicon glyphicon-user"></span> Nick Name</span>
			</label>
			
			<label class="signup_input">
				<input type="text" name="memail" class="memail" required>
				<span class="signup_input_sp"> <span class="glyphicon glyphicon-envelope"></span> Email</span>
			</label>
			
			<label class="signup_input">
				<input type="password" name="mpw" class="mpw" style="font-family:serif;" required>
				<span class="signup_input_sp"> <span class="glyphicon glyphicon-lock"></span> Password</span>
			</label>
			
			<label class="signup_input">
				<input type="password" name="mpw1" class="mpw" style="font-family:serif;" required>
				<span class="signup_input_sp"> <span class="glyphicon glyphicon-lock"></span> Check Your Password</span>
			</label>
			
			<label class="signup_input">
				<input type="text" name="mhp" class="mhp" required>
				<span class="signup_input_sp"> <span class="glyphicon glyphicon-earphone"></span> Phone Number</span>
			</label>
			
			<div class="insert_member_btn">
				<button class="insrt_membtn" type="submit">가입</button><br>
				<button class="insrt_membtn insrt_membtn2" type="button" onclick="history.back();">취소</button>
			</div>
		</form>
	</div>
</div>



</body>
</html>