<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>loginPro 페이지입니다.</title>
	<link href="/resources/css/style.css" rel="stylesheet" type="text/css">
</head>
<body>

	<h2 align="center"> loginPro Page </h2>
	
	<c:if test="${sessionScope.memId!=null}">
		<script>
			alert("로그인 성공!!");
			window.location="/member/main";
		</script>
	</c:if>
	<c:if test="${sessionScope.memId==null}">
		<script>
			alert("로그인 실패.... 다시시도해주세요..");
			history.go(-1);
		</script>
	</c:if>
	


</body>
</html>