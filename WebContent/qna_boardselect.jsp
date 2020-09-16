<%@page import="com.whatsup.dto.Member_BoardDto"%>
<%@page import="com.whatsup.dto.QNA_BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	QNA_BoardDto qna_dto=(QNA_BoardDto)request.getAttribute("dto");
    Member_BoardDto member_dto = (Member_BoardDto)session.getAttribute("login");
%>
</head>
<body>
	<table border="1">
		<tr>
			<th>이름</th>
			<td><input type="text" name="myname" value="<%=qna_dto.getNickname() %>" readonly="readonly" /></td>
		</tr>
		<tr>
			<th>제목</th>
			<td><input type="text" name="mytitle" value="<%=qna_dto.getQna_title()%>" readonly="readonly" /></td>
		</tr>
		<tr>
			<th>답변여부</th>
			<td><input type="text" name="myanswer" value="<%=qna_dto.getQna_answer()%>" readonly="readonly" /></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea rows="10" cols="60" name="mycontent" readonly="readonly"><%=qna_dto.getQna_content() %></textarea></td>
		</tr>
		<tr>
			<td colspan="2" align="right">
			<%
				if(qna_dto.getNickname() == member_dto.getNickname()){
			%>		
				<input type="button" value="수정" onclick="location.href='move.do?command=updatepage&qna_no=<%=qna_dto.getQna_no()%>'"/>
				<input type="button" value="삭제" onclick="location.href='move.do?command=delete&qna_no=<%=qna_dto.getQna_no()%>'"/>
			<%		
				}
			%>
				
				<input type="button" value="목록" onclick="location.href='move.do?command=qnaboard'"/>
			</td>
		</tr>
	</table>
<%@ include file="./format/footer.jsp" %>	
</body>
</html>