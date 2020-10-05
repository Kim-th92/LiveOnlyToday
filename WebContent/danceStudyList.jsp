<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="js/dance_study_list.js"></script>
<style type="text/css">
	body {background-color: #fdde60;}
	table {
        width: 100%;
      }
      td {
      	text-align: center;
        padding: 10px;
        font-size: 15pt;
        font-weight: bold;
      }
</style>
</head>
<body>
<%
Member_BoardDto member_dto=(Member_BoardDto)session.getAttribute("login");
if(member_dto == null){
	member_dto= new Member_BoardDto();
}
%>
<%@ include file="./format/header.jsp" %>
	<h1>움직이는 이미지의 제목을 선택하세요</h1>
	<h4>이미지에 마우스를 올려보세요</h4>
	<table>
		<tr>
			<td><img id="img01" src="resources/img/danceModel/danceMonkey01-static.png" width="450px" height="240px" /></td>
			<td><img id="img02" src="resources/img/danceModel/danceMonkey02-static.png" width="450px" height="240px" /></td>
			<td><img id="img03" src="resources/img/danceModel/diet01-static.png" width="450px" height="240px" /></td>
		</tr>
		<tr>
			<td><a href="danceStep01.jsp">anceMonkey01</a></td>
			<td><a href="#">준비중 입니다.</a></td>
			<td><a href="danceStep02.jsp">diteDance</a></td>
		</tr>
	

	</table>





<%@ include file="./format/footer.jsp" %>	
</body>
</html>