<%@page import="com.whatsup.dto.QNA_CommentDto"%>
<%@page import="java.util.List"%>
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
    List<QNA_CommentDto> qna_comment_list = (List<QNA_CommentDto>)request.getAttribute("qna_comment_list");
    if(member_dto==null){
		member_dto=new Member_BoardDto();
	}
%>
</head>
<body>
	<table border="1">
		<tr>
			<th>이름</th>
			<td><input type="text" name="myname" value="<%=qna_dto.getNickname()%>" readonly="readonly" /></td>
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
			<td><%=qna_dto.getQna_content() %></td>
		</tr>
		<tr>
			<td colspan="2" align="right">
			<%
			if(member_dto.getNickname().equals(qna_dto.getNickname())&& member_dto.getNickname()!=null){
			%>		
				<input type="button" value="수정" onclick="location.href='move.do?command=updatepage&qna_no=<%=qna_dto.getQna_no()%>'"/>
				<input type="button" value="삭제" onclick="location.href='move.do?command=delete&qna_no=<%=qna_dto.getQna_no()%>'"/>
			<%		
				}
			%>
				<input type="button" value="목록" onclick="location.href='move.do?command=qnaboard&currentPage=1'"/>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
		--------------댓글--------------
			</td>
		</tr>
		<tr>
			<td>답글</td>
		</tr>
		<%
		if(qna_comment_list.size()==0){
			
		}else{
			for(int i=0;i<qna_comment_list.size();i++){
		%>
		<tr>
			<td colspan="2">
				<textarea rows="10" cols="60"><%=qna_comment_list.get(i).getQna_comment_content() %></textarea> 
			</td>
		</tr>
		<%
			}
		}
		%>	
	</table>
	
	<form action="board.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="command" value="qna_comment_delete"/>
		<input type="hidden" name="qna_no" value="<%=qna_dto.getQna_no() %>">
<%
		if (member_dto.getMember_seq() == 1) {
%>		
		<input type="submit" value="삭제"/>
<%
		}
%>
	</form>
	
	<form action="board.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="command" value="qnacommentinsert"/>
		<input type="hidden" name="member_seq" value="<%=member_dto.getMember_seq()%>">
		<input type="hidden" name="qna_no" value="<%=qna_dto.getQna_no() %>">
		
		<%
			   if (member_dto.getMember_seq() == 1) {
		%>
		<input type="text" name="qna_comment_content"/>
		<input type="submit" value="답글 작성" onclick="location.href='move.do?command=qnaboard&currentPage=1">
		<%
			   }
		%>
	</form>
	
<%@ include file="./format/footer.jsp" %>	
</body>
</html>