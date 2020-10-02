<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.container{
		position: relative;
		width: 100%;
		overflow-x: hidden;
	} 
	
	.slider-container{
		position: absolute;
		width: 100%;
	}
	
	.slide{
		position: absolute;
		width: 100;
		paddiong: 0 10%;
		box-sizing:border-box;
		top: 50%;
		transform: translateY(-50%);
		text-align: center;
		overflow: hidden;
	}
	.slider-container.animated{
		-webkit-transition: left .3s ease-in;
		transition: left .3s ease-in; 
	}
	#prev,#next{
		position: absolute;
		top: 50%;
		left: 50%;
		transform: translateY(-50%);
		z-index: 999;
		display: inline-block;
		hight: 5em;
		width: 5em;
		border-radius: 50%;
		background-position: center center;
		background-repeat: no-repeat;
		-webkit-transition: all .3s ease-in;
		transition: all .3 ease-in;
	}
	
	#prev.disabled, #next.disabled{display:none;}
	#prev{background-image: url('arrow-left-out.svg'); margin-left:-480px;}
	#prev:hover {background-image: url('arrow-left-over.svg');}
	#next{
		margin-left:380px; 
		background-image: url('arrow-left-over.svg');
	}
	#next:hover{background-image: url('arrow-left-over.svg');}
	 

</style>
</head>
<body>
<%
Member_BoardDto member_dto=(Member_BoardDto)session.getAttribute("login");
if(member_dto == null){
	member_dto= new Member_BoardDto();
}
%>
<%@ include file="./format/header.jsp" %>
	<h1>동작을 따라해 봐</h1>
	
	<div class="container">
		<ul class="slider-container" id="slider">
			<li class="slide"></li>
		</ul>
		
		<a href="#" id="prev"></a>
		<a href="#" id="nect"></a>
	</div>
		

<% 			
		if(member_dto.getGrade() == null || member_dto == null){
%>
			<div>
				<span><a href ="dancemain.jsp">돌아가기</a></span>
			</div>
<% 		
			}else if(member_dto.getGrade().equals("ADMIN")){
%>
			<div>
				<button onclick="location.href='danceStudyUpload.jsp'">Teachable Machine 추가</button>
			</div>
<% 
			}
%>


	</div>



</div>


<%@ include file="./format/footer.jsp" %>	
</body>
</html>