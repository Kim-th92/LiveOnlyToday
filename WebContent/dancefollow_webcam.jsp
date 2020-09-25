
<%@page import="com.whatsup.dto.DanceAdminDto"%>
<%@page import="com.whatsup.dao.DanceAdminDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, user-scalable=yes, initial-scale=1, maximum-scale=1">
<meta itemprop="description" content="Client-side WebRTC code samples">
<meta itemprop="name" content="WebRTC code samples">
<meta name="mobile-web-app-capable" content="yes">
<meta id="theme-color" name="theme-color" content="#ffffff">

<base target="_blank">

<link href="//fonts.googleapis.com/css?family=Roboto:300,400,500,700"
	rel="stylesheet" type="text/css">

<link rel="stylesheet" href="css/main.css">

<title>Insert title here</title>
</head>
<body>
<%
Member_BoardDto member_dto=(Member_BoardDto)session.getAttribute("login");
if(member_dto == null){
	member_dto= new Member_BoardDto();
}
DanceAdminDao dao = new DanceAdminDao();
DanceAdminDto danceadmin_dto = (DanceAdminDto)request.getAttribute("dto");
%>

<%@include file="./format/header.jsp"%>


	<div id="container">

		<iframe src="<%=danceadmin_dto.getDanceadminsrc() %>" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
		<video id="gum" playsinline autoplay muted></video>
	<!--<video id="recorded" playsinline loop></video>  -->	
	
		<div id="buttonContainer">
			<button class="grad" id="start">Start camera</button>
			<button class="grad" id="record" disabled>Start Recording</button>
			<button class="grad" id="play" disabled>Play</button>
			<button  class="grad" id="download" disabled>Download</button>
			<button class="grad" id="upload" disabled >Upload</button>
		</div>

		<div>
		
			<p>
				Echo cancellation: <input type="checkbox" id="echoCancellation">
			</p>
			</div>
		<div>
			<span id="errorMsg"></span>
		</div>


	</div>

	<!-- include adapter for srcObject shim -->
	<script src="https://webrtc.github.io/adapter/adapter-latest.js"></script>
	<script src="js/main.js" async></script>
	<script src="js/ga.js"></script>


	<%@include file="./format/footer.jsp"%>
</body>
</html>