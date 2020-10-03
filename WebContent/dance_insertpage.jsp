<%@page import="com.whatsup.dto.Member_BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//cdn.ckeditor.com/4.15.0/full/ckeditor.js"></script>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<style type="text/css">
table {width:80%;    line-height: 50px; margin : 50px 0px 50px 50px;}
	body {margin-bottom: 100px;}
	.content{    padding: 30px 20px 300px;
    background-color: #e9ecef;
   }
   form{width:80%; margin-left: 100px;}
</style>

</head>

<body style="background-color: #fdde60;">

<%
	Member_BoardDto member_dto=(Member_BoardDto)session.getAttribute("login");
%>
<h1>춤 게시판 작성</h1>
<form action="board.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="command" value="dance_insert"/>
		<input type="hidden" name="member_seq" value="<%=member_dto.getMember_seq()%>"/>
		<% System.out.println("memberseq : "+ member_dto.getMember_seq()); %>
		<table>
		<colgroup width="100px">
		<colgroup width ="600px">
			<tr>
				<th>이름</th>
				<td><input type="text" class="form-control form-control-lg" name="nickname" value="<%=member_dto.getNickname() %>" readonly="readonly" /></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" class="form-control form-control-lg" name="dance_title" /></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="30" class="form-control form-control-lg content" cols="60" name="dance_content" id="dance_content"></textarea></td>
				<script>
                     CKEDITOR.replace( 'dance_content' );
                </script>
			</tr>
			<tr>
				<th>파일 업로드</th>
				<td><input  type="file" name="dance_file"/></td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="button" class="btn btn-warning" value="취소" onclick="location.href='move.do?command=main'" />
					<input type="submit" class="btn btn-warning" value="작성" />
				</td>
			</tr>
		</table>
	</form>




</body>
</html>