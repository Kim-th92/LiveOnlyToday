<%@page import="com.whatsup.dto.Member_BoardDto"%>
<%@page import="com.whatsup.dto.Dance_BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//cdn.ckeditor.com/4.15.0/standard/ckeditor.js"></script>
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
			<td>
			<%if(dance_dto.getDancerealpath()==null){
				System.out.println(dance_dto);
			}else{
				int dot = dance_dto.getDancerealfname().lastIndexOf(".");
				String extension = dance_dto.getDancerealfname().substring(dot);
				if(extension.equals(".mov")||extension.equals(".mp4")||extension.equals(".webm")||extension.equals(".avi")||extension.equals(".wmv")||extension.equals(".mkv")
						||extension.equals(".ts")||extension.equals(".tp")||extension.equals(".flv")||extension.equals(".3gp")||extension.equals(".mpg")||extension.equals(".asf")){
			%>
			
				<video src="upload/<%=dance_dto.getDancerealfname()%>" controls="controls" loop="loop"></video>
				
			<%	
				}else if(extension.equals(".jpg")||extension.equals(".png")||extension.equals(".bmp")||extension.equals(".jpeg")||extension.equals(".gif")||extension.equals(".tiff")||extension.equals(".psd")||
				extension.equals(".tga")||extension.equals(".ai")||extension.equals(".svg")){
				
			%>
				<img alt="이미지" src="upload/<%=dance_dto.getDancerealfname()%>">
			<%		
				}
		
			}
			
			%>
			
			<%=dance_dto.getDance_content() %>
			
					
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
				
				<input type="button" value="목록" onclick="location.href='move.do?command=danceboard&currentPage=1'"/>
			</td>
		</tr>
	</table>

	<form action="board.do" method="post">
		<input type="hidden" name="command" value="dancecommentinsert"/>
		<input type="hidden" name="member_seq" value="<%=member_dto.getMember_seq() %>">
		<input type="hidden" name="dance_no" value="<%=dance_dto.getDance_no() %>">
		<input type="text" name="comment_content"/>
		<input type="submit" value="댓글 작성" onclick="commentinsert()">
	</form>

</body>
</html>