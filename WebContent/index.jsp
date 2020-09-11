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
<style type="text/css">
body {
	background-color: #fdde60;
	
}

#logo {
	width: 300px;
	height: 70px;
	padding: 20px 0px 0px 20px;
	margin : 0;
}
header>div{	display : inline-block; }
section {padding : 50px;}
ul { margine:0; padding:0;list-style: none;font-size: 20pt; transform:translate(50px,-40px);}
ul li{float : left; line-height:40px; list-style: none;width : 150px;height:40px;text-align:left; }
ul li ul li {display:none;}
ul li>a:hover{color:darkgray; border-bottom: 1px solid black;}

ul li:hover ul li {display :block;transform:translate(-50px,35px);}
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
#shortcut-btn,#main{ padding : 200px 100px 100px 50px;display:inline-block; border-radius: 10;}
a {
color: black;
	text-decoration: none;
}
.login {padding :20px ;margin-left:30px; background-color : black; color:white; font-weight : bold;}
footer{}

</style>
</head>
<body>

	<header>
		<div id="logo">
			<a href="index.jsp"> <img id="logo" alt="로고"
				src="resources/logo.png">
			</a>
		</div>

		<div id="nav-bar">
		<ul>
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
			<li><a href="move.do?command=freeboard">게시판</a>
				<ul>
					<li><a href="move.do?command=freeboard">자유 게시판</a></li>
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
			<button class= "login" onclick="location.href='login.jsp'"> 로그인 </button>
			<button class= "login" onclick="location.href='register.jsp'"> 회원가입 </button>
		</div>
	 	<%		
	 		}else{
	 	%>		
	 	<div id="login">
	 		<p><%=dto.getNickname() %>님 반갑습니다. <a href="#">마이페이지</a> <button class="login" onclick="location.href='member.do?command=logout'">로그아웃</button></p>
	 	</div>
	 	<% 		
	 		}
		%>
		

	</header>
	<section>
		<div id ="main">
			<h1>인싸가 되고 싶은 사람들 모여</h1>
		</div>
		<div id="shortcut-btn">
			<button class= "shortcut" onclick=""> 노래부르러 가기 </button>
			<button class= "shortcut" onclick=""> 춤 추러 가기</button>
		</div>
		
		<div id="img">
			<img id="dance" alt="춤그림" src="resources/dance.png">
		</div>
	</section>

<%@include file="./format/footer.jsp" %> 
</body>
</html>