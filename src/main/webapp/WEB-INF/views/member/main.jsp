<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Main 페이지 입니다.</title>
	<link href="/resources/css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<br/>
	<h1 align="center"> 메인 페이지 </h1>
	<h2 style="color:red">세션에 담긴 ID 값 : ${sessionScope.memId }</h2>
	
	로그아웃 상태
	<c:if test="${sessionScope.memId==null}">
		<table>
		<tr>
			<td>
				로그인을 원하시면 버튼을 클릭하세요.<br/>
				<button onclick="window.location='/member/login'">로그인</button>			Get 방식으로 호출한다. login을 
			</td>
		</tr>
		<tr>
			<td>
				<a href="/member/signup">회원가입</a>
			</td>
		</tr>
	</table>
	
	
	로그인 상태
	</c:if>
	<c:if test="${sessionScope.memId!=null}">
		<table>
			<tr>
				<td>
					<button onclick="window.location='/member/mypage'">마이페이지</button>
				</td>
			</tr>
			<tr>
				<td>
					<a href="/member/logout">로그아웃</a>
				</td>
			</tr>
		</table>
	</c:if>
	
	
	<br/><br/><br/><br/>
	<div align="center">
		<img src="/resources/imgs/aaa.jpg" width="800px" height="800px" />
	</div>
	
	
</body>
</html> --%>









<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Main 페이지 입니다.</title>
	<link href="/resources/css/style.css" rel="stylesheet" type="text/css">
    <meta name="google-signin-scope" content="profile email">
    <meta name="google-signin-client_id" content="YOUR_CLIENT_ID.apps.googleusercontent.com">
    <script src="https://apis.google.com/js/platform.js" async defer></script>
</head>
<body>
	<br/>
	<h1 align="center"> 메인 페이지 </h1>
	<h2 style="color:red">세션에 담긴 ID 값 : ${sessionScope.memId }</h2>
	
	<%-- 로그아웃 상태 --%>
	<c:if test="${sessionScope.memId==null}">
		<table>
		<tr>
			<td>
				로그인을 원하시면 버튼을 클릭하세요.<br/>
				<button onclick="window.location='/member/login'">로그인</button>			<%-- Get 방식으로 호출한다. login을 --%> 
			</td>
		</tr>
		<tr>
			<td>
				<a href="/member/signup">회원가입zz</a>
			</td>
		</tr>
	</table>
	
	
	<%-- 로그인 상태 --%>
	</c:if>
	<c:if test="${sessionScope.memId!=null}">
		<table>
			<tr>
				<td>
					<button onclick="window.location='/member/mypage'">마이페이지</button>
				</td>
			</tr>
			<tr>
				<td>
					<a href="/member/logout">로그아웃z</a>
				</td>
			</tr>
		</table>
	</c:if>
	
	
	<br/><br/><br/><br/>
	<div align="center">
		<img src="/resources/imgs/aaa.jpg" width="800px" height="800px" />
	</div>
	
	
	
	
	
	<div class="g-signin2" data-onsuccess="onSignIn" data-theme="dark"></div>
    <script>
      function onSignIn(googleUser) {
        // Useful data for your client-side scripts:
        var profile = googleUser.getBasicProfile();
        console.log("ID: " + profile.getId()); // Don't send this directly to your server!
        console.log('Full Name: ' + profile.getName());
        console.log('Given Name: ' + profile.getGivenName());
        console.log('Family Name: ' + profile.getFamilyName());
        console.log("Image URL: " + profile.getImageUrl());
        console.log("Email: " + profile.getEmail());

        // The ID token you need to pass to your backend:
        var id_token = googleUser.getAuthResponse().id_token;
        console.log("ID Token: " + id_token);
      }
    </script>
	
</body>
</html>

