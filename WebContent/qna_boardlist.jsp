<%@page import="java.util.Date"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.whatsup.dto.QNA_BoardDto"%>
<%@page import="java.util.List"%>
<%@page import="com.whatsup.dao.QNA_BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	QNA_BoardDao dao = new QNA_BoardDao();
	List<QNA_BoardDto> list = dao.selectList();
	SimpleDateFormat ymd = new SimpleDateFormat("MM.dd");
	SimpleDateFormat hms = new SimpleDateFormat("HH:mm");
	Timestamp ts = new Timestamp(new Date().getTime());
	
	String nickname = (String)session.getAttribute("nickname");
	



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
			<th>답변여부</th>
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
			<td><%=list.get(i).getQna_no() %></td>
			<td><%=list.get(i).getNickname() %></td>
			<td><a href="move.do?command=selectpage&qna_no=<%=list.get(i).getQna_no() %>"><%=list.get(i).getQna_title() %></a></td>			
			<td><a><%=hms.format(list.get(i).getQna_regdate()) %></a></td>
			<td align="center"><a><%=list.get(i).getQna_answer() %></a></td>
<% 				


%>
		    
		</tr>
<%
		}
	}
%>
		<tr>
			<td colspan="5" align="right">
				<input type="button" value="글작성" onclick="location.href='move.do?command=qnainsertpage'" />
			</td>
		</tr>
	</table>
<%@ include file="./format/footer.jsp" %>	
</body>
</html>