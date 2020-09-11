<%@page import="com.whatsup.dto.Member_BoardDto"%>
<%@page import="com.whatsup.dto.Free_BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	Free_BoardDto free_dto=(Free_BoardDto)request.getAttribute("dto");
%>
<body>
<%@ include file="./format/header.jsp" %>
	<form action="move.do" method="post">
		<input type="hidden" name="command" value="updateres">
		<input type="hidden" name="free_no" value="<%=free_dto.getFree_no()%>" />
		<table border="1">
			<tr>
				<th>이름</th>
				<td><input type="text" value="<%=free_dto.getNickname() %>" readonly="readonly" /></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="free_title" value="<%=free_dto.getFree_title() %>"  /></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="10" cols="60" name="free_content" ><%=free_dto.getFree_content() %></textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="button" value="취소" onclick="location.href='move.do?command=selectpage&free_no=<%=free_dto.getFree_no()%>'"/>
					<input type="submit" value="수정" />
				</td>
			</tr>
		</table>
	</form>
	<%@ include file="./format/footer.jsp" %>
</body>
</html>