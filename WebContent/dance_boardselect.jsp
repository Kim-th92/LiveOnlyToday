<%@page import="com.whatsup.dto.Member_BoardDto"%>
<%@page import="com.whatsup.dto.Dance_BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	Dance_BoardDto dance_dto=(Dance_BoardDto)request.getAttribute("dto");
	Member_BoardDto member_dto=(Member_BoardDto)session.getAttribute("login");
	if(member_dto==null){
		member_dto=new Member_BoardDto();
	}
%>
</head>
<body>
	<table border="1">
		<tr>
			<th>이름</th>
			<td><input type="text" name="myname" value="<%=dance_dto.getNickname() %>" readonly="readonly" /></td>
		</tr>
		<tr>
			<th>제목</th>
			<td><input type="text" name="mytitle" value="<%=dance_dto.getDance_title()%>" readonly="readonly" /></td>
		</tr>
		<tr>
			<th>조회수</th>
			<td><input type="text" name="mytitle" value="<%=dance_dto.getDance_cnt()%>" readonly="readonly" /></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea rows="10" cols="60" name="mycontent" readonly="readonly"><%=dance_dto.getDance_content() %></textarea></td>
		</tr>
		<tr>
			<td colspan="2" align="right">
			<%
				if(dance_dto.getMember_seq()==member_dto.getMember_seq()){
			%>		
				<input type="button" value="수정" onclick="location.href='move.do?command=updatepage&dance_no=<%=dance_dto.getDance_no()%>'"/>
				<input type="button" value="삭제" onclick="location.href='move.do?command=delete&dance_no=<%=dance_dto.getDance_no()%>'"/>
			<%		
				}
			%>
				
				<input type="button" value="목록" onclick="location.href='move.do?command=danceboard'"/>
			</td>
		</tr>
	</table>
</body>
</html>