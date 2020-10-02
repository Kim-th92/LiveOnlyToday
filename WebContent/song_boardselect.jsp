<%@page import="com.whatsup.dto.Member_BoardDto"%>
<%@page import="com.whatsup.dto.Song_BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.0/css/all.css" integrity="sha384-OLYO0LymqQ+uHXELyx93kblK5YIS3B2ZfLGBmsJaUyor7CpMTBsahDHByqSuWW+q" crossorigin="anonymous">
<style>
	table {width:80%;    line-height: 50px; margin : 50px 0px 50px 50px;}
#content{    padding: 30px 20px 100px;
    background-color: #e9ecef;
   }
  
</style>
<%
	Song_BoardDto song_dto=(Song_BoardDto)request.getAttribute("dto");
	Member_BoardDto member_dto=(Member_BoardDto)session.getAttribute("login");
	if(member_dto==null){
		member_dto=new Member_BoardDto();
	}
%>
</head>
<body style="    background-color: #fdde60;">
<h1><i class="fas fa-arrow-circle-right"></i>노래게시판</h1>
	<table>
		<tr>
			<th>이름</th>
			<td><input class="form-control form-control-lg"  type="text" name="myname" value="<%=song_dto.getNickname() %>" readonly="readonly" /></td>
		</tr>
		<tr>
			<th>제목</th>
			<td><input  class="form-control form-control-lg"  type="text" name="mytitle" value="<%=song_dto.getSong_title()%>" readonly="readonly" /></td>
		</tr>
		<tr>
			<th>조회수</th>
			<td><input class="form-control form-control-lg"  type="text" name="mytitle" value="<%=song_dto.getSong_cnt()%>" readonly="readonly" /></td>
		</tr>
		<tr>
			<th>내용</th>
			<td id ="content"><%=song_dto.getSong_content() %></td>
		</tr>
		<tr>
			<td colspan="2" align="right">
			<%
				if(song_dto.getMember_seq()==member_dto.getMember_seq()){
			%>		
				<input class="btn btn-warning" type="button" value="수정" onclick="location.href='move.do?command=updatepage&song_no=<%=song_dto.getSong_no()%>'"/>
				<input class="btn btn-warning"class="btn btn-warning" type="button" value="삭제" onclick="location.href='move.do?command=delete&song_no=<%=song_dto.getSong_no()%>'"/>
			<%		
				}
			%>
				
				<input class="btn btn-warning" type="button" value="목록" onclick="location.href='move.do?command=songboard&currentPage=1'"/>
			</td>
		</tr>
	</table>
</body>
</html>