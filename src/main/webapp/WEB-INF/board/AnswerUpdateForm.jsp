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
<link rel="stylesheet" href="${root}/css/board/answerupdate.css" />

<!-- smarteditior -->
<script type="text/javascript"
	src="//code.jquery.com/jquery-1.11.0.min.js"></script>

</head>
<body>
	<div class="answer_updatelayout">

		<div class="answer_updatemain">
			<h3 "location.href='/board/list'" >의료정보 커뮤니티</h3>
			<div style="display: flex; justify-content: center;"></div>
		</div>
	</div>

	<div class="answer_updatec">
		 댓글 수정 
		<form action="ansupdate" method="post" enctype="multipart/form-data">
			<input type="hidden" class="form-control input-sm" name="aidx" value ="${adto.aidx}">
			
			<textarea  id ="amemo" name="amemo">${adto.amemo}</textarea>
			<hr>
			<div class ="answer_btngroup" >
			<button type="button" class="answer_listbtn" onclick="location.href='board/list'">목록</button>
			<button type="submit" class="answer_savebutton" >저장</button>
			
			</div>
		</form>
	</div>

</body>
</html>


