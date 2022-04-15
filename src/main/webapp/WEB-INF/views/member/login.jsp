<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>login 페이지</title>
	<link href="/resources/css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<script>
		let msg = '${msg}';
		console.log(msg);
		if(msg) {
			alert(msg + " : 로그인 해주세요..."); 
		}
	</script>
	<br/>
	<h1 align="center">로그인</h1>
	<form action="/member/login" method="post">
		<table>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="id"/></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pw"/></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="checkbox" name="auto" value="1"/>자동로그인
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="로그인"/>
					<input type="button" value="회원가입" onclick="window.location='/member/signup'"/>
					<input type="button" value="메인" onclick="window.location='/member/main'"/>
				</td>
			</tr>
		</table>
	</form>


</body>
</html>