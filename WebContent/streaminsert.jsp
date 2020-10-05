<%@page import="com.whatsup.dto.Member_BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	Member_BoardDto member_dto=(Member_BoardDto)session.getAttribute("login");
	if(member_dto==null){
		member_dto=new Member_BoardDto();
	}
%>
<style type="text/css">
	body{
		background-color: #fdde60;
		margin : 30px 50px;
	}
	h1{
		margin : 30px 20px;
	}
	table {
		margin-top : 30px;
		
		line-height: 30px;
		width:400px;
		
	}
	input[type="button"]{
	
  background-color: red;
  border: none;
  color: white;
  padding: 6px 10px;
  text-align: center;
  font-size: 14px;
  margin: 4px 50px;
  opacity: 0.6;
  transition: 0.3s;
  display: inline-block;
  text-decoration: none;
  cursor: pointer;
  border-radius:10px;

}
	#bor{padding-bottom:20px;}
	td:nth-child(1){text-align: center;}
	td:nth-child(4){text-align : center;}
	td:nth-child(3){ font-weight:bold;}
	td:nth-child(3)>a{font-weight:bold; text-decoration: none; color:black;}
</style>
</head>
<body>
<%@ include file="./format/header.jsp" %>
	<form action="move.do" method="post">
		<input type="hidden" name="command" value="streaming_start">
		<input type="hidden" name="member_seq" value="<%=member_dto.getMember_seq()%>">
		
		<table border="1">
			<tr>
				<th>닉네임</th>
				<th>방송 제목</th>
			</tr>
			<tr>
				<td><%=member_dto.getNickname() %></td>
				<td><input type="text" name="stream_title"></td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="방송생성">
				</td>
			</tr>
		</table>
	</form>
<%@ include file="./format/footer.jsp" %>
</body>
</html>