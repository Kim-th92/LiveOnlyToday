<%@page import="com.whatsup.dto.Stream_BoardDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	List<Stream_BoardDto> stream_list=(List<Stream_BoardDto>)request.getAttribute("stream_list");
	Member_BoardDto member_dto=(Member_BoardDto)session.getAttribute("login");
	if(member_dto==null){
		member_dto=new Member_BoardDto();
	}
%>
</head>
<body>
<%@ include file="./format/header.jsp" %>
	<table border="1">
		<col width="200px"/>
		<col width="100px"/>
		<tr>
			<th>방송제목</th>
			<th>닉네임</th>
		</tr>
		
<%
		if(stream_list.size()==0){

%>
		<tr>
			<td colspan="2">-----방송중인 사람이 없습니다---------</td>
		</tr>		

<%		
		}
		for(int i=0;i<stream_list.size();i++){
%>
		<tr>
<%
			if(stream_list.get(i).getMember_seq()==member_dto.getMember_seq()){
%>
				<td><a href="http://localhost:3000/index.html?stream_no=<%=stream_list.get(i).getStream_no()%>&member_seq=<%=member_dto.getMember_seq()%>"><%=stream_list.get(i).getStream_title() %></a></td>
<%
			}else{
%>				
				
				<td><a href="http://localhost:3000/index.html?stream_no=<%=stream_list.get(i).getStream_no()%>&member_seq=<%=member_dto.getMember_seq()%>"><%=stream_list.get(i).getStream_title() %></a></td>			
<%				
			}
%>			
			
			<td><%=stream_list.get(i).getNickname() %></td>
		</tr>		
<% 			
		}
%>
		<tr>
			<td colspan="2" align="right">
				<input type="button" value="방송하기" onclick="location.href='move.do?command=streaminsertpage'"/>
			</td>
		</tr>
	</table>
<%@ include file="./format/footer.jsp" %>
</body>
</html>