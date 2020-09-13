<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.side-nav-bar { width:15% ; position:fixed; height:100% ;background-color: grey;z-index: -1;}
.section {width : 70%; left :35%;}
footer{z-index: 2;   position: absolute;   left: 0;   bottom: 0;   width: 100%; padding: 0;
	color: white;background: blue;}
</style>
</head>
<body>
<%@ include file="./format/header.jsp" %>

<div class = "side-nav-bar">


</div>

<div class="section">
<h1> 춤</h1>
	<div class="card">
		<video src="" controls="controls" style= "width:200px;height:200px" ></video>
		
	</div>

</div>


<%@ include file="./format/footer.jsp" %>
</body>
</html>