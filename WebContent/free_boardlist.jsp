<%@page import="com.whatsup.dto.Member_BoardDto"%>
<%@page import="com.whatsup.util.PageNavigator"%>
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
</style>
<%
	Free_BoardDao dao = new Free_BoardDao();
	
	PageNavigator navi = (PageNavigator)request.getAttribute("navi");
	int startPageGroup = (int)request.getAttribute("startPage");
	int endPageGroup = (int)request.getAttribute("endPage");
	
	int startWrite = (int)request.getAttribute("startWrite");
	int endWrite = (int)request.getAttribute("endWrite");
	int totalPageCount = (int)request.getAttribute("totalPageCount");
	
	List<Free_BoardDto> list = dao.selectList(startWrite,endWrite);
	SimpleDateFormat ymd = new SimpleDateFormat("MM.dd");
	SimpleDateFormat hms = new SimpleDateFormat("HH:mm");
	Timestamp ts = new Timestamp(new Date().getTime());
	
	Member_BoardDto member_dto = new Member_BoardDto();
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
<body>
	<h1> 자유게시판 </h1>
	<hr>
	<table>
		<col width="100px" />
		<col width="200px" />
		<col width="500px" />
		<col width="150px" />
		<col width="100px" />
		<tr id="bor" >
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
			<td>
<% 
			if(session.getAttribute("login") ==null){
%>
				<a href="#"><%=list.get(i).getFree_title() %></a></td>	
<%	
			}else{
%>				
				<a href="move.do?command=freeselectpage&free_no=<%=list.get(i).getFree_no() %>"><%=list.get(i).getFree_title() %></a></td>	
<%
			}
%>			
			<td><a><%=hms.format(list.get(i).getFree_regdate()) %></a></td>
			<td align="center"><a><%=list.get(i).getFree_cnt() %></a></td>
<% 				


%>
		</tr>
<%
		}
	}
%>
		<tr>
		<td></td>
			<td colspan="4" align="right">
				<input type="button" value="글작성" onclick="location.href='move.do?command=freeinsertpage'" />
			</td>
		</tr>
		<tr>
			<td colspan="5" align="center">
			<%
	if(list.size() != 0){
%>	
	<a href="move.do?command=freeboard&currentPage=1">&lt;&lt;</a> &nbsp;
	<a href="move.do?command=freeboard&currentPage=<%=(endPageGroup > startPageGroup)? 1:endPageGroup - startPageGroup%>">&lt;</a> &nbsp;
<%
	}
	int[] end = new int[endPageGroup]; 
	for(int j = 0; j<end.length; j++){
		end[j] = j+1;
	}
	for(int i = startPageGroup - 1; i < end.length; i++ ){
%>
	<a href=move.do?command=freeboard&currentPage=<%=end[i]%>><%=end[i]%></a> &nbsp; 
<%	
	}
	if(list.size() != 0){
%>
	<a href="move.do?command=freeboard&currentPage=<%=(startPageGroup + 5 < totalPageCount)? (startPageGroup + 5):totalPageCount%>">&gt;</a> &nbsp;
	<a href="move.do?command=freeboard&currentPage=${totalPageCount}">&gt;&gt;</a>
<%
	}
%>	
	
			</td>
		</tr>
	</table>

</body>
</html>