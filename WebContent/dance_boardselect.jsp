<%@page import="com.whatsup.dto.CommentDto"%>
<%@page import="java.util.List"%>
<%@page import="com.whatsup.dto.Member_BoardDto"%>
<%@page import="com.whatsup.dto.Dance_BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table {width:80%;    line-height: 50px; margin : 50px 0px 50px 50px;}
	body {margin-bottom: 100px;}
	#content{    padding: 30px 20px 100px;
    background-color: #e9ecef;
   }
   form{width:60%; margin-left: 100px;}
</style>
<script src="//cdn.ckeditor.com/4.15.0/standard/ckeditor.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.0/css/all.css" integrity="sha384-OLYO0LymqQ+uHXELyx93kblK5YIS3B2ZfLGBmsJaUyor7CpMTBsahDHByqSuWW+q" crossorigin="anonymous">
<%
	Dance_BoardDto dance_dto=(Dance_BoardDto)request.getAttribute("dto");
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
</head>

<body   style="    background-color: #fdde60;">
<h1><i class="fas fa-arrow-circle-right"></i>댄스게시판</h1>
	<table>
		<tr>
			<th>이름</th>
			<td><input type="text" name="myname"  class="form-control form-control-lg" value="<%=dance_dto.getNickname() %>" readonly="readonly" /></td>
		</tr>
		<tr>
			<th>제목</th>
			<td><input type="text" name="mytitle" class="form-control form-control-lg" value="<%=dance_dto.getDance_title()%>" readonly="readonly" /></td>
		</tr>
		<tr>
			<th>조회수</th>
			<td><input type="text" name="mytitle" class="form-control form-control-lg" value="<%=dance_dto.getDance_cnt()%>" readonly="readonly" /></td>
		</tr>
		<tr>
			<th>내용</th>
			<td id="content">
			<%if(dance_dto.getDancerealpath()==null){
				System.out.println(dance_dto);
			}else{
				int dot = dance_dto.getDancerealfname().lastIndexOf(".");
				String extension = dance_dto.getDancerealfname().substring(dot);
				if(extension.equals(".mov")||extension.equals(".mp4")||extension.equals(".webm")||extension.equals(".avi")||extension.equals(".wmv")||extension.equals(".mkv")
						||extension.equals(".ts")||extension.equals(".tp")||extension.equals(".flv")||extension.equals(".3gp")||extension.equals(".mpg")||extension.equals(".asf")){
			%>
			
				<video src="upload/<%=dance_dto.getDancerealfname()%>" controls="controls" loop="loop" style="width:100%;"></video>
				
				
			<%	
				}else if(extension.equals(".jpg")||extension.equals(".png")||extension.equals(".bmp")||extension.equals(".jpeg")||extension.equals(".gif")||extension.equals(".tiff")||extension.equals(".psd")||
				extension.equals(".tga")||extension.equals(".ai")||extension.equals(".svg")){
				
			%>
				<img alt="이미지" src="upload/<%=dance_dto.getDancerealfname()%>"  style="width:100%;">
			<%		
				}
		
			}
			
			%>
			
			<%=dance_dto.getDance_content() %>
			
					
		</tr>
		<tr>
			<td colspan="2" align="right">
			<%
				if(member_dto.getNickname().equals(dance_dto.getNickname())&& member_dto.getNickname()!=null){
			%>		
				<input type="button" class="btn btn-warning" value="수정" onclick="location.href='move.do?command=danceupdatepage&dance_no=<%=dance_dto.getDance_no()%>'"/>
				<input type="button"  class="btn btn-warning" value="삭제" onclick="location.href='move.do?command=dancedelete&dance_no=<%=dance_dto.getDance_no()%>'"/>

			<%		
				}
			%>
				
				<input type="button" class="btn btn-warning" value="목록" onclick="location.href='move.do?command=danceboard&currentPage=1'"/>
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
		%>
			<tr>
				<td colspan="2">
				댓글이 없습니다.
				</td>
			</tr>
		<%
		}else{
			for(int i=0;i<comment_list.size();i++){
		%>
		<tr>
			<td><%=comment_list.get(i).getNickname() %></td>
			<td><%=comment_list.get(i).getComment_content() %>
			<%
			if(member_dto.getNickname().equals(dance_dto.getNickname())&& member_dto.getNickname()!=null){
			%>	
				<input type="button" value="삭제" onclick="location.href='board.do?command=dance_comment_delete&comment_no=<%=comment_list.get(i).getComment_no()%>&dance_no=<%=dance_dto.getDance_no()%>'"/>	
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
		<input type="hidden" name="command" value="dance_comment_insert"/>
		<input type="hidden" name="member_seq" value="<%=member_dto.getMember_seq() %>">
		<input type="hidden" name="dance_no" value="<%=dance_dto.getDance_no() %>">
		<input type="text" name="comment_content"/>
		<input type="submit" value="댓글작성" onclick="commentinsert()"/>
	</form>
</body>
</html>