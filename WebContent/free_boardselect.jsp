<%@page import="com.whatsup.dto.Free_BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	Free_BoardDto dto=(Free_BoardDto)request.getAttribute("dto");
%>
</head>
<body>
	<table border="1">
		<tr>
			<th>이름</th>
			<td><input type="text" name="myname" value="<%=dto.getNickname() %>" readonly="readonly" /></td>
		</tr>
		<tr>
			<th>제목</th>
			<td><input type="text" name="mytitle" value="<%=dto.getFree_title()%>" readonly="readonly" /></td>
		</tr>
		<tr>
			<th>조회수</th>
			<td><input type="text" name="mytitle" value="<%=dto.getFree_cnt()%>" readonly="readonly" /></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea rows="10" cols="60" name="mycontent" readonly="readonly"><%=dto.getFree_content() %></textarea></td>
		</tr>
		<tr>
			<td colspan="2" align="right">
				<input type="button" value="수정" onclick="location.href=''"/>
				<input type="button" value="삭제" onclick="location.href=''"/>
				<input type="button" value="목록" onclick="location.href='move.do?command=freeboard'"/>
			</td>
		</tr>
	</table>
</body>
</html>