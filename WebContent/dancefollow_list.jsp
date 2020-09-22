<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.side-nav-bar { width:15% ; position:fixed;top:0; height:100% ;background-color: grey; z-index: -1;}
.section {width : 70%;}
footer{z-index: 2;   position: absolute;  left: 0;   bottom: 0;   width: 100%; padding: 0;
	color: white;background: blue;}
.dance-card { width:300px ;height:200px;margin :30px; line-height: 20px; float:left;} 
.dance-card>video{width:300px;height:200px;}
</style>
</head>
<body>
<%@ include file="./format/header.jsp" %>

<div class = "side-nav-bar">


</div>

<div class="section">
<h1> 춤</h1>
	<div class="card">
		
		<div class="dance-card">
			<video src="" controls="controls" ></video>
			<span> 이름  </span>
		</div>
	
		
	</div>
	<button onclick="location.href='danceupload.jsp'">동영상 업로드</button>

</div>


<%@ include file="./format/footer.jsp" %>
</body>
</html>