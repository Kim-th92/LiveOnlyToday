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
<style type="text/css">
table {width:80%;    line-height: 50px; margin : 50px 0px 50px 50px;}
#content{    padding: 30px 20px 100px;
    background-color: #e9ecef;
   }
 

</style>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.0/css/all.css" integrity="sha384-OLYO0LymqQ+uHXELyx93kblK5YIS3B2ZfLGBmsJaUyor7CpMTBsahDHByqSuWW+q" crossorigin="anonymous">
<title>Insert title here</title>
<%
	Free_BoardDto free_dto=(Free_BoardDto)request.getAttribute("dto");
	Member_BoardDto member_dto=(Member_BoardDto)session.getAttribute("login");
	List<CommentDto> comment_list=(List<CommentDto>)request.getAttribute("comment_list");
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
</head>
<body style="    background-color: #fdde60;">
	<h1><i class="fas fa-arrow-circle-right"></i>자유게시판</h1>
	<table>
	
		<tr>
			<th>이름</th>
			<td><input type="text" name="myname"  class="form-control form-control-lg"  value="<%=free_dto.getNickname() %>" readonly="readonly" /></td>
		</tr>
		<tr>
			<th>제목</th>
			<td><input type="text" name="mytitle" class="form-control form-control-lg"  value="<%=free_dto.getFree_title()%>" readonly="readonly" /></td>
		</tr>
		<tr>
			<th>조회수</th>
			<td><input type="text" name="mytitle" class="form-control form-control-lg"  value="<%=free_dto.getFree_cnt()%>" readonly="readonly" /></td>
		</tr>
		<tr>
			<th>내용</th>
			<td id="content" class="form-control form-control-lg" ><%=free_dto.getFree_content() %></td>
		</tr>
		<tr>
			<td colspan="2" align="right">
			<%
				if(free_dto.getMember_seq()==member_dto.getMember_seq()){
			%>		

				<input type="button" value="수정" onclick="location.href='move.do?command=freeupdatepage&free_no=<%=free_dto.getFree_no()%>'"/>
				<input type="button" value="삭제" onclick="location.href='move.do?command=freedelete&free_no=<%=free_dto.getFree_no()%>'"/>

				<input class="btn btn-warning" type="button" value="수정" onclick="location.href='move.do?command=updatepage&free_no=<%=free_dto.getFree_no()%>'"/>
				<input class="btn btn-warning" type="button" value="삭제" onclick="location.href='move.do?command=delete&free_no=<%=free_dto.getFree_no()%>'"/>

			<%		
				}else{
			%>
				<input type="hidden"/>
			<%		
				}
			%>
				
				<input type="button"  class="btn btn-warning" value="목록" onclick="location.href='move.do?command=freeboard&currentPage=1'"/>
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
			if(member_dto.getMember_seq()==comment_list.get(i).getMember_seq()){
			%>	
				<input type="button" value="삭제" onclick="location.href='board.do?command=free_comment_delete&comment_no=<%=comment_list.get(i).getComment_no()%>&free_no=<%=free_dto.getFree_no()%>'"/>	
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
	<form action="board.do" method="post">
		<input type="hidden" name="command" value="free_comment_insert"/>
		<input type="hidden" name="member_seq" value="<%=member_dto.getMember_seq()%>">
		<input type="hidden" name="free_no" value="<%=free_dto.getFree_no()%>"/>
		<input type="text" name="comment_content"/>
		<input type="submit" value="댓글작성" onclick="commentinsert()"/>
	</form>
</body>
</html>