<%@page import="com.whatsup.dto.Dance_BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	Dance_BoardDto dance_dto=(Dance_BoardDto)request.getAttribute("dto");
%>
<%@include file="./format/header.jsp"%>

<body>
	<form action="board.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="command" value="dance_update">
		<input type="hidden" name="dance_no" value="<%=dance_dto.getDance_no()%>" />
		<table border="1">
			<tr>
				<th>이름</th>
				<td><input type="text" value="<%=dance_dto.getNickname() %>" readonly="readonly" /></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="dance_title" value="<%=dance_dto.getDance_title() %>"  /></td>
			</tr>
			<tr>
				<th>파일 업로드</th>
				<td><input type="file" name="dacne_file"/></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="10" cols="60" name="dance_content" id="dance_content" ><%=dance_dto.getDance_content() %></textarea></td>
				<script>
                        CKEDITOR.replace( 'dance_content' );
                </script>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="button" value="취소" onclick="location.href='move.do?command=selectdancepage&dance_no=<%=dance_dto.getDance_no()%>'"/>
					<input type="submit" value="수정" />
				</td>
			</tr>
		</table>
	</form>
<%@include file="./format/footer.jsp"%>
</body>
</html>