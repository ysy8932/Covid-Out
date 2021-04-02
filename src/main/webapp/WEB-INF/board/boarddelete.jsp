<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    
<!-- css -->
<link rel="stylesheet" href="${root}/css/board/boarddel.css" />

<!-- smarteditior -->
<script type="text/javascript" src="../se2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>

</head>
<body>
	<div class="board_dellayout">

		<div class="board_delmain">
			<h3 onclick = "location.href='../board/'" >의료정보 커뮤니티</h3>
		</div>
	</div>
	
	<form action ="delete" method = "post" class ="form-inline board_delsc">
	<div class="board_delform">						
		<input type ="hidden" name="num" value="${num}">	
		<h2>해당 글을 삭제하시겠습니까?</h2>
			
		</div>
		<div class ="board_delgrp">
			<button type="button" class="board_clistbtn" onclick = "location.href='../board/list'">목록</button>			
			<button type ="submit" class ="board_cdelbutton">삭제</button>
			</div>

	</form>		
			
</body>

</html>


