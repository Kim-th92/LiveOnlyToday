<%@page import="com.whatsup.dto.Member_BoardDto"%>
<%@page import="com.whatsup.dto.Song_BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	Song_BoardDto song_dto=(Song_BoardDto)request.getAttribute("dto");
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
			<td><input type="text" name="myname" value="<%=song_dto.getNickname() %>" readonly="readonly" /></td>
		</tr>
		<tr>
			<th>제목</th>
			<td><input type="text" name="mytitle" value="<%=song_dto.getSong_title()%>" readonly="readonly" /></td>
		</tr>
		<tr>
			<th>조회수</th>
			<td><input type="text" name="mytitle" value="<%=song_dto.getSong_cnt()%>" readonly="readonly" /></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><%=song_dto.getSong_content() %></td>
		</tr>
		<tr>
			<td colspan="2" align="right">
			<%
				if(song_dto.getMember_seq()==member_dto.getMember_seq()){
			%>		
				<input type="button" value="수정" onclick="location.href='move.do?command=updatepage&song_no=<%=song_dto.getSong_no()%>'"/>
				<input type="button" value="삭제" onclick="location.href='move.do?command=delete&song_no=<%=song_dto.getSong_no()%>'"/>
			<%		
				}
			%>
				
				<input type="button" value="목록" onclick="location.href='move.do?command=songboard&currentPage=1'"/>
			</td>
		</tr>
	</table>
</body>
</html>