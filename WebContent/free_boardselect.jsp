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
	List<CommentDto> comment_list = (List<CommentDto>)request.getAttribute("comment_list");
	if(member_dto==null){
		member_dto=new Member_BoardDto();
	}
%>
<script type="text/javascript">
	function commentinsert(){
		if(<%=member_dto.getNickname()==null%>){
			alert("먼저 로그인을 해주세요.");
			return false;
		}
	}
</script>
<style type="text/css">
	.line{display: inline-block;}
</style>
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
			<td><%=free_dto.getFree_content() %></td>
		</tr>
		<tr>
			<td colspan="2" align="right">
			<%
				if(member_dto.getNickname().equals(free_dto.getNickname())&& member_dto.getNickname()!=null){
			%>		
				<input class="btn btn-warning"  type="button" value="수정" onclick="location.href='move.do?command=freeupdatepage&free_no=<%=free_dto.getFree_no()%>'"/>
				<form class="line" action="board.do" method="post" enctype="multipart/form-data">
					<input type="hidden" name="command" value="free_delete"/>
					<input type="hidden" name="free_no" value="<%=free_dto.getFree_no()%>">
					<input class="btn btn-warning"  type="submit" value="삭제"/>
				</form>
			<%		
				}
			%>
				
				<input type="button" value="목록" onclick="location.href='move.do?command=freeboard&currentPage=1'"/>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				--------------댓글--------------
			</td>
		</tr>
		<tr>
			<td>이름</td>
			<td>댓글내용</td>
		</tr>
		<%
		if(comment_list.size()==0){
			
		}else{
			for(int i=0;i<comment_list.size();i++){
		%>
		<tr>
			<td><%=comment_list.get(i).getNickname() %></td>
			<td><%=comment_list.get(i).getComment_content() %>
			<%
			if(member_dto.getNickname().equals(free_dto.getNickname())&& member_dto.getNickname()!=null){
			%>	
				<form class="line" action="board.do" method="post" enctype="multipart/form-data">
					<input type="hidden" name="command" value="free_comment_delete"/>
					<input type="hidden" name="free_no" value="<%=free_dto.getFree_no()%>">
					<input type="hidden" name="comment_no" value="<%=comment_list.get(i).getComment_no()%>">
					<input type="submit" value="삭제"/>
				</form>
					
			<%	
			}
			%>
			</td>
		</tr>
		
		<%
			}
			}
		%>
	</table>
	<form action="board.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="command" value="free_comment_insert"/>
		<input type="hidden" name="member_seq" value="<%=member_dto.getMember_seq()%>">
		<input type="hidden" name="free_no" value="<%=free_dto.getFree_no()%>"/>
		<input type="text" name="comment_content"/>
		<input type="submit" value="댓글작성" onclick="commentinsert()"/>
	</form>
</body>
</html>