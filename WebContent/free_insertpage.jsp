
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
	Member_BoardDto member_dto = new Member_BoardDto();	

	if(session.getAttribute("login") ==null){
		String result = "<script> alert('로그인을 먼저 해주세요!'); location.href='index.jsp'; </script> ";
	    response.getWriter().append(result);
		
	}else{
	 member_dto=(Member_BoardDto)session.getAttribute("login");
%>
	<body>
	<form action="board.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="command" value="free_insert"/>
		<input type="hidden" name="member_seq" value="<%=member_dto.getMember_seq()%>"/>
		<table border="1">
			<tr>
				<th>이름</th>
				<td><input type="text" name="nickname" value="<%=member_dto.getNickname() %>" readonly="readonly" /></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="free_title" /></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="10" cols="60" name="free_content" id="free_content"></textarea></td>
				<script>
                        CKEDITOR.replace( 'free_content' );
                </script>
			</tr>
			<tr>
				<th>파일 업로드</th>
				<td><input type="file" name="free_file"/></td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="button" value="취소" onclick="location.href='move.do?command=main'" />
					<input type="submit" value="작성" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
<%		 
	}
%>
