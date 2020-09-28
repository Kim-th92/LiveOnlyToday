<%@page import="com.whatsup.dto.Member_BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>\
<%
	int member_seq=Integer.parseInt(request.getParameter("member_seq"));
	Member_BoardDto member_dto=(Member_BoardDto)session.getAttribute("login");
%>
<script type="text/javascript">
	window.onload=function(){
		navigator.mediaDevices.getUserMedia({
			audio:true,
			video:true
		});
		var url = "http://localhost:3000/";
		var title = "myframe";
		var prop = "";
		window.open(url, title, prop);
	}
</script>
<style type="text/css">
	#boardview{
		width: 1000px;
		height: 1000px;
	}
	#myframe{
		width: 1000px;
		height: 1000px;
	
	}
</style>
</head>
<body>
	<div id="boardview">
		<iframe id="myframe" name="myframe"></iframe>
	</div>
</body>
</html>