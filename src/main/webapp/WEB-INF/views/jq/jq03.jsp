<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<h3> 입력값 확인 </h3>
	<input type="text" name="id" id="id1" />
	<button>확인</button>
	
	<br/>
	<br/>
	<br/>
	<h3> 과목 선택 </h3>
	<select>
		<option>java</option>
		<option>html/css</option>
		<option>sql</option>
		<option>framwork</option>
	</select>
	<span id="span1"></span>
	
	<button id="showBtn">show</button>
	<button id="hideBtn">hide</button>
	<br/>
	<img src="/resources/imgs/ccc.png" width="300" height="300"/>
	
	<script >
		$(document).ready(function(){
			$("select").change(function(){
				$("#span1").text($(this).val());
			});

			$("#showBtn").click(function(){
				$("img").fadeIn();
			});
			$("#hideBtn").click(function(){
				$("img").fadeOut();
			});
			
			
			
			
			
			
			/*
			$("button").click(function(){
				let value = $("#id1").val();
				alert($("#id1").val());
				$("h3").text(value);
				$("#id1").val("");
				
				
			})
			*/
		});
	</script>
	
	
</body>
</html>