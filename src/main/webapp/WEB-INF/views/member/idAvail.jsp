<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>idAvail</title>
	<link href="/resources/css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<h3>ID 중복 확인</h3>
	<h3> result : ${result}</h3>
	<%-- 사용 불가 --%>
	<c:if test="${result ==1 }">
		<table>
			<tr>
				<td>${trialId}는, 이미 사용중인 아이디 입니다.</td>
			</tr>
		</table>
		<form action="/member/idAvail" method="post" name="checkForm" onsubmit="check()">
			<table>
				<tr>
					<td>다른 아이디를 선택하세요.<br/>
						<input type="text" name="id"/>
						<input type="submit" name="아이디중복확인"/>
					</td>
				</tr>
			</table>
		</form>
	</c:if>
	
	<%-- 사용 가능 --%>
	<c:if test="${result != 1}">
		<table>
				<tr>
					<td>입력하신 ${trialId}은/는 사용하실수 있습니다.<br/>
						<input type="button" value="사용하기" onclick="setId()" />
						
					</td>
				</tr>
			</table>
	</c:if>
	
	<script type="text/javascript">
		// 아이디 유효성 검사
		function inputCheck(){
			let inputForm = document.checkForm;
			if(!inputForm.id.value){
				alert("아이디를 입력하세요");
				return false;
			}
		}
		
		// 아이디 사용하기 버튼 클릭시 처리 함수
		function setId(){
			// 팝업을 띄워준 부모페이지(opener) 에 id입력란에 검증한 id로 바꿔주고
			opener.document.inputForm.id.value = "${trialId}"
			// 팝업 닫기
			self.close();
		}
			
			
			
	</script>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>