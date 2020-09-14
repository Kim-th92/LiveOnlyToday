<%@page import="com.whatsup.dto.Song_BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	Song_BoardDto song_dto=(Song_BoardDto)request.getAttribute("dto");
%>
<body>
	<form action="move.do" method="post">
		<input type="hidden" name="command" value="updateres">
		<input type="hidden" name="song_no" value="<%=song_dto.getSong_no()%>" />
		<table border="1">
			<tr>
				<th>이름</th>
				<td><input type="text" value="<%=song_dto.getNickname() %>" readonly="readonly" /></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="song_title" value="<%=song_dto.getSong_title() %>"  /></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="10" cols="60" name="song_content" ><%=song_dto.getSong_content() %></textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="button" value="취소" onclick="location.href='move.do?command=selectpage&song_no=<%=song_dto.getSong_no()%>'"/>
					<input type="submit" value="수정" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>