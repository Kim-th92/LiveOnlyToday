<%@page import="com.whatsup.dto.QNA_BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	QNA_BoardDto qna_dto=(QNA_BoardDto)request.getAttribute("dto");
%>
<body>
<%@ include file="./format/header.jsp" %>
	<form action="board.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="command" value="qna_update">
		<input type="hidden" name="qna_no" value="<%=qna_dto.getQna_no()%>" />
		<table border="1">
			<tr>
				<th>이름</th>
				<td><input type="text" value="<%=qna_dto.getNickname() %>" readonly="readonly" /></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="qna_title" value="<%=qna_dto.getQna_title() %>"  /></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="10" cols="60" name="qna_content" ><%=qna_dto.getQna_content() %></textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="button" value="취소" onclick="location.href='move.do?command=selectpageBasics&qna_no=<%=qna_dto.getQna_no()%>'"/>
					<input type="submit" value="수정" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>