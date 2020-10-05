<%@page import="com.whatsup.dto.Dance_BoardDto"%>
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
	Dance_BoardDto dance_dto=(Dance_BoardDto)request.getAttribute("dto");
%>
<body style="background-color: #fdde60;">
<h1><i class="fas fa-arrow-circle-right"></i>댄스게시판 수정</h1>
	<form action="board.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="command" value="dance_update">
		<input type="hidden" name="dance_no" value="<%=dance_dto.getDance_no()%>" />
		<table>
			<tr>
				<th>이름</th>
				<td><input type="text" class="form-control form-control-lg" value="<%=dance_dto.getNickname() %>" readonly="readonly" /></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" class="form-control form-control-lg" name="dance_title" value="<%=dance_dto.getDance_title() %>"  /></td>
			</tr>
			
			<tr>
				<th>내용</th>
				<td><textarea rows="10" class="form-control form-control-lg content" cols="60" name="dance_content" id="dance_content" ><%=dance_dto.getDance_content() %></textarea></td>
				<script>
                        CKEDITOR.replace( 'dance_content' );
                </script>
			</tr>
			<tr>
				<th>파일 업로드</th>
				<td><input type="file" name="dacne_file"/></td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="button" class="btn btn-warning"  value="취소" onclick="location.href='move.do?command=selectdancepage&dance_no=<%=dance_dto.getDance_no()%>'"/>
					<input type="submit" class="btn btn-warning"  value="수정" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>