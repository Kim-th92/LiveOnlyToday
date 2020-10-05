
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
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.0/css/all.css" integrity="sha384-OLYO0LymqQ+uHXELyx93kblK5YIS3B2ZfLGBmsJaUyor7CpMTBsahDHByqSuWW+q" crossorigin="anonymous">
<style type="text/css">

.side-nav-bar{ position:fixed;top:0; height:100% ;background-color: grey; }
.section {}


div.wrapper{
	display : grid;
	grid-template-columns: 25% 25% 25% 25%;
	}
#section {
	padding :30px 40px;
}
button {
	
}h4>a{
translate : .5s;}
h4>a:hover {
	color:darkorange;
	
}
h4>a:hover i{
	margin-left:30px;
	translate : 0.5s;
}
.dance-card {
	font-size:16pt;
	margin :20px;
	text-align: center;
}
ifram {
	margin-top : 20px;
}
#section>h1 {
	text-align: center;
}
#button{
	text-align: right;
}
.btn{
  background-color: red;
  border: none;
  color: white;
  padding: 10px 20px;
  text-align: center;
  font-size: 18pt;
  margin: 4px 50px;
  opacity: 0.6;
  transition: 0.3s;
  display: inline-block;
  text-decoration: none;
  cursor: pointer;
  border-radius:10px;
  margin-right: 100px;
	
}
.btn:hover{
	background-color:red;
}
.btn:hover .btn>i{
	margin-left: 3px;
}

</style>
</head>
<body style ="background-color: #fdde60;">
<%
Member_BoardDto member_dto=(Member_BoardDto)session.getAttribute("login");
if(member_dto == null){
	member_dto= new Member_BoardDto();
}
DanceAdminDao dao = new DanceAdminDao();
List<DanceAdminDto> list = dao.selectList();
%>
<%@ include file="./format/header.jsp" %>



<div id="section">
	<h1> 춤</h1>
	<div class="wrapper">
		
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
			<h4> <a href="dance.do?command=selectOne&seq=<%=list.get(i).getDanceadmin_seq()%>"><%=list.get(i).getDanceadmintitle() %><i class="fas fa-arrow-circle-right"></i></a></h4>
			
		</div>
		
<% 			
		}
	}
%>
	</div>
<% 
	if(member_dto.getGrade()==null ||member_dto == null||member_dto.getGrade().equals("USER")){
			
%>
			<div id="button">
				<button  class ="btn" onclick="location.href='dancemain.jsp'"><span>돌아가기<i class="fas fa-arrow-right"></i></span></button>
				
			</div>
<% 		
			}else if(member_dto.getGrade().equals("ADMIN")){
%>
			<div id="button">
			<button class="btn" onclick="location.href='dancefollow_upload.jsp'">동영상 업로드</button>
			</div>
<% 
			}
		
%>


	



</div>


<%@ include file="./format/footer.jsp" %>
</body>
</html>