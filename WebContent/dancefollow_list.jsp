
<%@page import="com.whatsup.dto.DanceAdminDto"%>
<%@page import="com.whatsup.dao.DanceAdminDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.side-nav-bar { width:15% ; position:fixed;top:0; height:100% ;background-color: grey; z-index: -1;}
.section {width : 70%;}
footer{z-index: 2;   position: absolute;  left: 0;   bottom: 0;   width: 100%; padding: 0;
	color: white;background: blue;}

</style>
</head>
<body>
<%
Member_BoardDto member_dto=(Member_BoardDto)session.getAttribute("login");
if(member_dto == null){
	member_dto= new Member_BoardDto();
}
DanceAdminDao dao = new DanceAdminDao();
List<DanceAdminDto> list = dao.selectList();
%>
<%@ include file="./format/header.jsp" %>

<div class = "side-nav-bar">


</div>

<div class="section">
<h1> 춤</h1>
	<div class="card">
		
<%
	if(list.size()==0){
%>
	<div class="dance-card">
		<h1> 등록된 글이 존재하지 않습니다.</h1>
	</div>
<% 		
	}else{
		for (int i = 0; i < list.size(); i++) {		
%>
		<div class="dance-card">
			<iframe src="<%=list.get(i).getDanceadminsrc()%>" controls="controls" muted="muted"></iframe>
			<h4> <a href="dance.do?command=selectOne&seq=<%=list.get(i).getDanceadmin_seq()%>"><%=list.get(i).getDanceadmintitle() %></a></h4>
			
		</div>
<% 			
		}
	}

		if(member_dto.getGrade()==null ||member_dto == null){
			
%>
			<div>
				<span><a href ="dancemain.jsp">돌아가기</a></span>
			</div>
<% 		
			}else if(member_dto.getGrade().equals("ADMIN")){
%>
			<button onclick="location.href='dancefollow_upload.jsp'">동영상 업로드</button>
			
<% 
			}
		
%>


	</div>



</div>


<%@ include file="./format/footer.jsp" %>
</body>
</html>