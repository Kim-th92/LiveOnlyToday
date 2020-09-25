<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.whatsup.dto.CommentDto"%>
<%@page import="java.util.List"%>
<%@page import="com.whatsup.dto.Member_BoardDto"%>
<%@page import="com.whatsup.dto.Free_BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	Free_BoardDto free_dto=(Free_BoardDto)request.getAttribute("dto");
	Member_BoardDto member_dto=(Member_BoardDto)session.getAttribute("login");
	List<CommentDto> comment_list=(List<CommentDto>)request.getAttribute("comment_list");
	SimpleDateFormat hms = new SimpleDateFormat("HH:mm");
	if(member_dto==null){
		member_dto=new Member_BoardDto();
	}
%>

</head>
<body>
	<table border="1">
		<tr>
			<th>이름</th>
			<td><input type="text" name="myname" value="<%=free_dto.getNickname() %>" readonly="readonly" /></td>
		</tr>
		<tr>
			<th>제목</th>
			<td><input type="text" name="mytitle" value="<%=free_dto.getFree_title()%>" readonly="readonly" /></td>
		</tr>
		<tr>
			<th>조회수</th>
			<td><input type="text" name="mytitle" value="<%=free_dto.getFree_cnt()%>" readonly="readonly" /></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea rows="10" cols="60" name="mycontent" readonly="readonly"><%=free_dto.getFree_content() %></textarea></td>
		</tr>
		<tr>
			<td colspan="2" align="right">
			<%
				if(free_dto.getMember_seq()==member_dto.getMember_seq()){
			%>		
				<input type="button" value="수정" onclick="location.href='move.do?command=updatepage&free_no=<%=free_dto.getFree_no()%>'"/>
				<input type="button" value="삭제" onclick="location.href='move.do?command=delete&free_no=<%=free_dto.getFree_no()%>'"/>
			<%		
				}else{
			%>
				<input type="hidden"/>
			<%		
				}
			%>
				
				<input type="button" value="목록" onclick="location.href='move.do?command=freeboard'"/>
			</td>
		</tr>
		<tr>
			<td colspan="2">-------------------댓글----------------</td>
		</tr>
<%
		for(int i=0;i<comment_list.size();i++){
%>
		<tr>
			<td><%=comment_list.get(i).getNickname() %></td>
			<td><%=comment_list.get(i).getComment_content() %></td>
			<td><%=hms.format(comment_list.get(i).getComment_regdate()) %></td>
		</tr>
<%
			if(comment_list.get(i).getMember_seq()==member_dto.getMember_seq()){
%>
		<tr>
			<td colspan="2">
				<input type="button" value="수정"/>
				<input type="button" value="삭제" onclick="location.href='board.do?command=commentdelete&comment_no=<%=comment_list.get(i).getComment_no()%>'"/>
			</td>
		</tr>
				
<%			
			}
		}
%>
	
	</table>
	<form action="board.do">
		<input type="hidden" name="command" value="freecommentinsert"/>
		<input type="hidden" name="member_seq" value="<%=member_dto.getMember_seq() %>">
		<input type="hidden" name="free_no" value="<%=free_dto.getFree_no() %>">
		<input type="text" name="comment_content"/>
		<input type="submit" value="댓글 작성" onclick="commentinsert()">
	</form>
</body>
</html>