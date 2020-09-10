<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	String nickname=(String)session.getAttribute("nickname");
%>
<body>
	<form action="board.do" method="post">
		<input type="hidden" name="command" value="free_insert"/>
		<table border="1">
			<tr>
				<th>이름</th>
				<td><input type="text" name="nickname" value="<%=nickname %>" readonly="readonly" /></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="free_title" /></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="10" cols="60" name="free_content"></textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="button" value="취소" onclick="location.href='move.do?command=main'" />
					<input type="submit" value="작성" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>