<%@page import="com.whatsup.dto.Member_BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body{padding:0;margin:0;}
#logo {
	width: 300px;
	height: 70px;
	padding: 20px 0px 0px 20px;
	margin : 0;
}
a{text-decoration: none; color:black;}
header{ background-color:#fdde60; margin :0;}
header>div{	display : inline-block;  }
section {padding : 50px;}
.navigation { margine:0; padding:0;list-style: none;font-size: 20pt;padding-left: 200px; transform:translate(50px,-25px);}
.navigation li{float : left;list-style: none;width : 150px;height:40px;text-align: center; }
.navigation li>ul>li {display : none;}
.navigation li>a:hover{color:white;}
.navigation li:hover .navigation li>ul>li {display :block;}
#login {float :right ;padding :40px 80px 0px 20px;}
#dance {
	margin:0;
	padding:0;
	width: 600px;
	height: 600px;
}
#img{float:right;margin:0;
	padding:0;
}

</style>
</head>
<body>
	<header>
		<div id="logo">
			<a href="../index.jsp"> <img id="logo" alt="로고"
				src="../resources/logo.png">
			</a>
		</div>

		<div id="nav-bar">
		<ul class="navigation">
			<li><a href="#">회사소개</a>
				<ul>
				
					<li><a href="#">회사소개</a></li>
					<li><a href="#">오늘만 살조</a></li>
				</ul></li>
			<li><a href="#">노래</a>
				<ul>
					<li><a href="#">혼자 부르기 </a></li>
					<li><a href="#">ON-AIR </a></li>
				</ul></li>
			<li><a href="#">춤</a></li>
			<li><a href="#">게시판</a>
				<ul>
					<li><a href="#">자유 게시판</a></li>
					<li><a href="#"> 춤</a></li>
					<li><a href="#"> 노래</a></li>
					<li><a href="#">채팅</a></li>
				</ul></li>
			<li><a href="#">고객센터</a>
				<ul>
					<li><a href="#">자주묻는 질문</a></li>
					<li><a href="#">문의게시판</a></li>
				</ul></li>
		</ul>
		</div>
		<% Member_BoardDto dto = (Member_BoardDto)session.getAttribute("login");
	 		if(dto ==null){
	 	
	 	%>
	 	<div id="login">
			<button class= "login" onclick="location.href='../login.jsp'"> 로그인 </button>
			<button class= "login" onclick="location.href='../register.jsp'"> 회원가입 </button>
		</div>
	 	<%		
	 		}else{
	 	%>		
	 	<div id="login">
	 		<p><%=dto.getNickname() %>님 반갑습니다. <a href="#">마이페이지</a> </p>
	 	</div>
	 	<% 		
	 		}
		%>
		

	</header>
</body>
</html>