<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="com.whatsup.dao.Member_BoardDao"%>
<%@page import="com.whatsup.dto.Free_BoardDto"%>
<%@page import="java.util.List"%>
<%@page import="com.whatsup.dao.Free_BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	Free_BoardDao dao = new Free_BoardDao();
	List<Free_BoardDto> list = dao.selectList();
<<<<<<< HEAD
	SimpleDateFormat ymd = new SimpleDateFormat("MM.dd");
	SimpleDateFormat hms = new SimpleDateFormat("HH:mm");
	Timestamp ts = new Timestamp(new Date().getTime());
	

	
=======
	String nickname=(String)session.getAttribute("nickname");
>>>>>>> e4b25ba7b7a2ccb6c739f2ad08c6860877aecb59
%>
</head>
<body>
<%@ include file="./format/header.jsp" %>

	<table border="1">
		<col width="50px" />
		<col width="100px" />
		<col width="300px" />
		<col width="100px" />
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>제목</th>
			<th>날짜</th>
			<th>조회수</th>
		</tr>
<%
	if(list.size()==0){
%>
		<tr>
			<td colspan="5" align="center">
				<a>작성된 글이 없습니다</a>
			</td>
		</tr>	
		
		
<%
	}

	else{
		
		for (int i = 0; i < list.size(); i++) {		
%>
		<tr>
			<td><%=list.get(i).getFree_no() %></td>
			<td><%=list.get(i).getNickname() %></td>
<<<<<<< HEAD
			<td><a href="move.do?command=selectpage&free_no=<%=list.get(i).getFree_no() %>"><%=list.get(i).getFree_title() %></a></td>			
			<td><a><%=hms.format(list.get(i).getFree_regdate()) %></a></td>
			<td align="center"><a><%=list.get(i).getFree_cnt() %></a></td>
<% 				


%>
=======
			<td><a href="move.do?command=selectpage&free_no=<%=list.get(i).getFree_no() %>"><%=list.get(i).getFree_title() %></a></td>
			<td><%=list.get(i).getFree_regdate() %></td>
>>>>>>> e4b25ba7b7a2ccb6c739f2ad08c6860877aecb59
		</tr>
<%
		}
	}
%>
		<tr>
			<td colspan="5" align="right">
<<<<<<< HEAD
				<input type="button" value="글작성" onclick="location.href='move.do?command=freeinsertpage'" />
=======
				<input type="button" value="글작성" onclick="location.href='move.do?command=freeinsertpage&'" />
>>>>>>> e4b25ba7b7a2ccb6c739f2ad08c6860877aecb59
			</td>
		</tr>
	</table>
<%@ include file="./format/footer.jsp" %>
</body>
</html>