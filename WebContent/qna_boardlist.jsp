<%@page import="com.whatsup.util.PageNavigator"%>
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
<style type="text/css">
body{
	background-color: #fdde60;
}

#karaoke {
	width: 800px;
	height: 400px;
	padding: 80px 40px 150px 40px;
	position: absolute;
	text-align: center;
	left: 50%;
	top: 50%;
	transform: translate(-50%, -50%);
	line-height: 40px;
}

h1{
	position:absolute;
	top:20px;
	left: 40%;
	margin: 10px;
}
table {
	position: relative;
	left: 5%;
	top: 10%;
}

#firstrow {
	border-bottom: 1px solid black;
}


input[type="button"]{
	
  background-color: red;
  border: none;
  color: white;
  padding: 6px 10px;
  text-align: center;
  font-size: 14px;
  margin: 4px 50px;
  opacity: 0.6;
  transition: 0.3s;
  display: inline-block;
  text-decoration: none;
  cursor: pointer;
  border-radius:10px;

}

#insert{
	
	position: absolute;
	left: 90%;
	top: 104%;
}

#page{
	position: absolute;
	left: 40%;
	top: 104%;
	
}

</style>
<%
	QNA_BoardDao dao = new QNA_BoardDao();

	PageNavigator navi = (PageNavigator)request.getAttribute("navi");
	int startPageGroup = (int)request.getAttribute("startPage");
	int endPageGroup = (int)request.getAttribute("endPage");

	int startWrite = (int)request.getAttribute("startWrite");
	int endWrite = (int)request.getAttribute("endWrite");
	int totalPageCount = (int)request.getAttribute("totalPageCount");

	List<QNA_BoardDto> list = dao.selectList(startWrite,endWrite);
	SimpleDateFormat ymd = new SimpleDateFormat("MM.dd");
	SimpleDateFormat hms = new SimpleDateFormat("HH:mm");
	Timestamp ts = new Timestamp(new Date().getTime());
	
	String nickname = (String)session.getAttribute("nickname");
%>
</head>
<body>
<%@ include file="./format/header.jsp" %>

	<div id="karaoke" style="border: 1px solid black;">
	<h1 id="qna">문의게시판</h1>
	<table class="qna">
		<col width="80px" />
		<col width="150px" />
		<col width="300px" />
		<col width="100px" />
		<tr id="firstrow">
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
			<td><%=list.get(i).getQna_no()%></td>
			<td><%=list.get(i).getNickname()%></td>
			<td>
<% 
			if(session.getAttribute("login") ==null){
%>						
			<a href="#"><%=list.get(i).getQna_title()%></a></td>
<%	
			}else{
%>
			<a href="move.do?command=selectpageBasics&qna_no=<%=list.get(i).getQna_no()%>"><%=list.get(i).getQna_title()%></a></td>
<%
			}
%>
			<td><a><%=hms.format(list.get(i).getQna_regdate())%></a></td>
			<td align="center"><a><%=list.get(i).getQna_answer()%></a></td>
		</tr>
<%
		}
	}
%>
		<tr>
			<td colspan="5" align="right" id="insert">
				<input type="button" value="글작성" onclick="location.href='move.do?command=qnainsertpage'" />
			</td>
		</tr>
		<tr>
			<td colspan="5" align="center" id="page">
<%
	if(list.size() != 0){
%>	
	<a href="move.do?command=qnaboard&currentPage=1">&lt;&lt;</a> &nbsp;
	<a href="move.do?command=qnaboard&currentPage=<%=(endPageGroup >startPageGroup)? 1:endPageGroup - startPageGroup%>">&lt;</a> &nbsp;
<%
	}
	int[] end = new int[endPageGroup]; 
	for(int j = 0; j<end.length; j++){
		end[j] = j+1;
	}
	for(int i = startPageGroup - 1; i < end.length; i++ ){
%>
	<a href="move.do?command=qnaboard&currentPage=<%=end[i]%>"><%=end[i]%></a> &nbsp; 
<%	
	}
	if(list.size() != 0){
%>
	<a href="move.do?command=qnaboard&currentPage=<%=(startPageGroup + 5 < totalPageCount)? (startPageGroup + 5):totalPageCount%>">&gt;</a> &nbsp;
	<a href="move.do?command=qnaboard&currentPage=${totalPageCount}">&gt;&gt;</a>
<%
	}
%>	
	
			</td>
		</tr>
	</table>
	</div>
<%@ include file="./format/footer.jsp" %>	
</body>
</html>