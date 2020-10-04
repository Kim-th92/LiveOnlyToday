<%@page import="com.whatsup.dto.Member_BoardDto"%>
<%@page import="com.whatsup.dto.Free_BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.0/css/all.css" integrity="sha384-OLYO0LymqQ+uHXELyx93kblK5YIS3B2ZfLGBmsJaUyor7CpMTBsahDHByqSuWW+q" crossorigin="anonymous">
<style type="text/css">
table {width:80%;    line-height: 50px; margin : 50px 0px 50px 50px;}
	body {margin-bottom: 100px;}
	.content{    padding: 30px 20px 300px;
    background-color: #e9ecef;
   }
   form{width:80%; margin-left: 100px;}
</style>
</head>
<%
	Free_BoardDto free_dto=(Free_BoardDto)request.getAttribute("dto");
%>
<body style="background-color: #fdde60;">
<h1><i class="fas fa-arrow-circle-right"></i>자유게시판 수정</h1>
	<form action="board.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="command" value="free_update">
		<input type="hidden" name="free_no" value="<%=free_dto.getFree_no()%>" />
		<table>
			<tr>
				<th>이름</th>
				<td><input type="text" class="form-control form-control-lg" value="<%=free_dto.getNickname() %>" readonly="readonly" /></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" class="form-control form-control-lg" name="free_title" value="<%=free_dto.getFree_title() %>"  /></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="10" class="form-control form-control-lg" cols="60" name="free_content" ><%=free_dto.getFree_content() %></textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="button" value="취소" onclick="location.href='move.do?command=freeselectpage&free_no=<%=free_dto.getFree_no()%>'"/>
					<input type="submit" value="수정" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>