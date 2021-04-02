<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="<%=request.getContextPath() %>"/>
<html>
<head>
    <title>알림창</title>
</head>
<style>
	div.memeber_alert{
		background-color:#fff;
		width:100%;
		height:1980px;;
	}
	
</style>
<body>
<div class="memeber_alert">

</div>
<script>
	swal({
        title: "${alert_title}",
        icon: "${alert_icon}",
        button: true,
        closeOnClickOutside: false
    })
        .then(function () {
            location.href = "${url}";
        });
    
</script>
</body>
</html>