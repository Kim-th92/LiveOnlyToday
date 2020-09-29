<%@page import="com.whatsup.dto.Member_BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.ckeditor.com/4.15.0/full/ckeditor.js"></script>
</head>
<%
	Member_BoardDto member_dto=(Member_BoardDto)session.getAttribute("login");
%>
<body>
<%@ include file="./format/header.jsp" %>
	<form action="board.do" method="post">
		<input type="hidden" name="command" value="qna_insert"/>
		<input type="hidden" name="member_seq" value="<%=member_dto.getMember_seq()%>"/>
		<table border="1">
			<tr>
				<th>이름</th>
				<td><input type="text" name="nickname" value="<%=member_dto.getNickname() %>" readonly="readonly" /></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="qna_title" /></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="10" cols="60" name="qna_content"></textarea></td>
				<script>
                     CKEDITOR.replace( 'qna_content' );
                </script>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="button" value="취소" onclick="location.href='move.do?command=mainboard'" />
					<input type="submit" value="작성" />
				</td>
			</tr>
		</table>
	</form>
	<%@ include file="./format/footer.jsp" %>
</body>
</html>