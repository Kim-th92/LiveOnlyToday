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