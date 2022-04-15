<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>마이페이지</title>
   <link href="/resources/css/style.css" rel="stylesheet" type="text/css"> 
</head>
<body>
	<br />
   	<h1 align="center"> 마이페이지</h1>
   	<table>
      <tr>
         <td> <a href="/member/modify"> 회원정보수정</a> </td>
      </tr>
      <tr>
         <td> <a href="/member/delete"> 회원탈퇴</a> </td>
      </tr>
      <tr>
         <td> <a href="/member/main"> 메인</a> </td>
      </tr>
   	</table>
</body>
</html>