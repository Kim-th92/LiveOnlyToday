<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	img {width:400px;height:400px; border-radius: 50px 50px;border:1px soild black;}
	a>span{display :block;}
	#left{ float:left;}
	div{padding:50px;}
	#container{}
</style>
<body>
	<%@include file="./format/header.jsp"%>
		<div id= "container">
		<div id="left">
			<a href="dancevideo.jsp"><img src="resources/danceimg1.jpg" alt= " 춤 영상보러가기"/><span> 춤 영상보러가기! </</span></a>
		</div>
		<div id="right">
			<a href="danceboard.jsp"><img src="resources/danceimg2.jpeg" alt= " 춤 게시판으로"/><span> 춤 게시판으로 가기!</span></a>
		</div>
		</div>
	<%@include file="./format/footer.jsp"%>
</body>
</html>