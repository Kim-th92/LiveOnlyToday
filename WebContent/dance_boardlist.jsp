<%@page import="com.whatsup.util.PageNavigator"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.whatsup.dto.Dance_BoardDto"%>
<%@page import="java.util.List"%>
<%@page import="com.whatsup.dao.Dance_BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
<style type="text/css">
	body {
		margin : 30px 50px;
	}
	h1{
		margin : 30px 20px;
	}
	table {
		margin-top : 30px;
		
		line-height: 30px;
		width:100%;
		
	}
	#bor{padding-bottom:20px;}
	td:nth-child(1){text-align: center;}
	td:nth-child(4){text-align : center;}
	td:nth-child(3){ font-weight:bold;}
td:nth-child(3)>a{font-weight:bold; text-decoration: none; color:black;}
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

</style>
<%
	Dance_BoardDao dao = new Dance_BoardDao();

	PageNavigator navi = (PageNavigator)request.getAttribute("navi");
	int startPageGroup = (int)request.getAttribute("startPage");
	int endPageGroup = (int)request.getAttribute("endPage");

	int startWrite = (int)request.getAttribute("startWrite");
	int endWrite = (int)request.getAttribute("endWrite");
	int totalPageCount = (int)request.getAttribute("totalPageCount");
	
	List<Dance_BoardDto> list = dao.selectList(startWrite,endWrite);
	SimpleDateFormat ymd = new SimpleDateFormat("MM.dd");
	SimpleDateFormat hms = new SimpleDateFormat("HH:mm");
	Timestamp ts = new Timestamp(new Date().getTime());
	

	
%>
</head>
<body body style="    background-color: #fdde60;">
	<h1> 댄스게시판 </h1>
	<hr>
	<table >
		<col width="100px" />
		<col width="200px" />
		<col width="500px" />
		<col width="150px" />
		<col width="100px" />
		<tr id="bor">
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
			<td><%=list.get(i).getDance_no() %></td>
			<td><%=list.get(i).getNickname() %></td>
			<td><a href="move.do?command=selectdancepage&dance_no=<%=list.get(i).getDance_no() %>"><%=list.get(i).getDance_title() %></a></td>			
			<td><a><%=hms.format(list.get(i).getDance_regdate()) %></a></td>
			<td align="center"><a><%=list.get(i).getDance_cnt() %></a></td>
<% 				


%>
		</tr>
<%
		}
	}
%>
		<tr><td></td>
			<td colspan="4" align="right">
				<input type="button" value="글작성" onclick="location.href='move.do?command=danceinsertpage'" />
			</td>
		</tr>
		<tr>
			<td colspan="5" align="center">
	<%
	if(list.size() != 0){
%>	
	<a href="move.do?command=danceboard&currentPage=1">&lt;&lt;</a> &nbsp;
	<a href="move.do?command=danceboard&currentPage=<%=(endPageGroup > startPageGroup)? 1:endPageGroup - startPageGroup%>">&lt;</a> &nbsp;
<%
	}
	int[] end = new int[endPageGroup]; 
	for(int j = 0; j<end.length; j++){
		end[j] = j+1;
	}
	for(int i = startPageGroup - 1; i < end.length; i++ ){
%>
	<a href=move.do?command=danceboard&currentPage=<%=end[i]%>><%=end[i]%></a> &nbsp; 
<%	
	}
	if(list.size() != 0){
%>
	<a href="move.do?command=danceboard&currentPage=<%=startPageGroup + 5%>">&gt;</a> &nbsp;
	<a href="move.do?command=danceboard&currentPage=${totalPageCount}">&gt;&gt;</a>
<%
	}
%>	
	
			</td>
		</tr>
	</table>

</body>
</html>