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
	<div id="body">
		<div id="one" style="left:0%;width:424px;height:500px">
			<img src="/resources/imgs/ccc.png" style="width:424px;height:500px"/>
		</div>
		<div id="two" style="left:25%;width:424px;height:500px">
			<img src="/resources/imgs/aaa.jpg"style="width:424px;height:500px"/>
		</div>
		<div id="three" style="left:50%">
			<img src="/resources/imgs/mint.png"/>
		</div>
		<div id="four" style="left:75%">
			<img src="/resources/imgs/mouse.png"/>
		</div>
	</div>
</body>
<style>
	#body > div {
		transition: all 0.5s ease-out;
		float:left;
		position: absolute;
		border:4px solid #F6F6F6;
		position: absolute;
	}
	 #one{
         z-index: 1;
         width: 60%;
     }
     #two{
         z-index: 2;
         left: 25%;
         width: 60%;
     }
     #three{
         z-index: 3;
         left: 50%;
         width: 60%;
     }
     #four{
         z-index: 4;
         left: 75%;
         width: 60%;
     }
</style>
<script>


	//마우스 오버시 이벤트 발생
	$("#one").mouseover(function(){
	    $("#two").css("left","40%");
	    $("#three").css("left","60%");
	    $("#four").css("left","80%");
	});
	$("#two").mouseover(function(){
	    $("#two").css("left","20%");
	    $("#three").css("left","60%");
	    $("#four").css("left","80%");
	});
	$("#three").mouseover(function(){
	    $("#two").css("left","20%");
	    $("#three").css("left","40%");
	    $("#four").css("left","80%");
	});
	$("#four").mouseover(function(){
	    $("#two").css("left","20%");
	    $("#three").css("left","40%");
	    $("#four").css("left","60%");
	});
	//마우스 아웃시 이벤트 발생 
	$("#one").mouseout(function(){
	    $("#two").css("left","25%");
	    $("#three").css("left","50%");
	    $("#four").css("left","75%");
	});
	$("#two").mouseout(function(){
	    $("#two").css("left","25%");
	    $("#three").css("left","50%");
	    $("#four").css("left","75%");
	});
	 $("#three").mouseout(function(){
	    $("#two").css("left","25%");
	    $("#three").css("left","50%");
	    $("#four").css("left","75%");
	});
	  $("#four").mouseout(function(){
	    $("#two").css("left","25%");
	    $("#three").css("left","50%");
	    $("#four").css("left","75%");
	});
	  
	  
</script>
</html>