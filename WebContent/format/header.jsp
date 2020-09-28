<%@page import="com.whatsup.dto.Member_BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); 
response.setHeader("Pragma", "no-cache"); //HTTP 1.0
response.setHeader("Cache-Control", "no-cache"); //HTTP 1.1
response.setHeader("Cache-Control", "no-store"); //HTTP 1.1
response.setDateHeader("Expires", 0L); // Do not cache in proxy server
%> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<meta name="google-signin-client_id" content="910896443172-llnq01i6rrc8hlgruf3sm3c40bqhvvp4.apps.googleusercontent.com">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">
<style>
ul{
font-family: 'Do Hyeon', sans-serif;}
body{padding:0;margin:0;}
#logo {
	width: 300px;
	height: 70px;
	padding: 20px 0px 0px 20px;
	margin : 0;
}
.login {padding :20px ;margin-left:30px; background-color : black; color:white; font-weight : bold;border-radius: 20px;}
.login:hover{background-color: grey;box-shadow:3px 3px 2px 1px rgba(0, 0, 255, .2);}
p{paddin:0;}
a{text-decoration: none; color:black;}
header{ background-color:#fdde60; margin :0;}
header>div{	display : inline-block;  }
section {padding : 50px;}
ul { margine:0; padding:0;list-style: none;font-size: 20pt; transform:translate(50px,-40px);}
ul li{float : left; line-height:40px; list-style: none;width : 150px;height:40px;text-align:left; }
ul li ul li {display:none;}
ul li>a:hover{color:darkgray; font-weight: bold;  }
ul li:hover ul li {display:inline;transform:translate(-50px,35px);}
#login {float :right ;padding :40px 80px 0px 20px;}
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
			<li><a href="aboutus.jsp">회사소개</a>
				<ul>
				
					<li><a href="aboutus.jsp">회사소개</a></li>
					<li><a href="liveonlytoday.jsp">오늘만 살조</a></li>
				</ul></li>
			<li><a href="move.do?command=musicselect">노래</a>
				<ul>
					<li><a href="move.do?command=musicselect">혼자 부르기 </a></li>

					<li><a href="move.do?command=streamboard">ON-AIR </a></li>


				</ul></li>

			<li><a href="dancemain.jsp">춤</a></li>

			<li><a href="move.do?command=mainboardpage">게시판</a>
				
			<li><a href="csmain.jsp">고객센터</a>
				<ul>
					<li><a href="move.do?command=qnaboard">문의게시판</a></li>
					<li><a href="adminchat.jsp">1:1문의</a></li>
				</ul></li>
				
			  
				<li><a href="KakaopayController?command=checklogin" onclick="openPopup()">결제하기</a></li>
				
					
		</ul>

		</div>
		<%
			Member_BoardDto dto = (Member_BoardDto) session.getAttribute("login");
		if (dto == null) {
		%>
		<div id="login">
			<button class="login" onclick="location.href='./login.jsp'">
				로그인</button>
			<button class="login" onclick="location.href='./register.jsp'">
				회원가입</button>
		</div>
		<%
			} else {
		%>
		<div id="login">
			<span><%=dto.getNickname()%>님 반갑습니다. <%
				if (dto.getGrade().equals("USER")) {
			%> <a href="mypage.jsp">마이페이지</a> <%
 	} else {
 %> <a href="admin.jsp">관리자페이지</a> <%
 	}
 if (dto.getAddr().equals("google")) {
 %>
				<button class="login" onclick="signOut()">로그아웃</button> </span>
			<%
				} else {
			%>
			<button class="login"
				onclick="location.href='member.do?command=logout'">로그아웃</button>
			</span>
			<%
				}
			%>


		</div>
		<%
			}
		%>
		
	<script>
  function signOut() {
	
    var auth2 = gapi.auth2.getAuthInstance();
    auth2.signOut().then(function () {
      $.ajax({
    	 url: "member.do?command=logout",
    	success : function(){
    		console.log('logout successed');
    		location.reload();
    	},error:function(){
    		alert("통신 실패....");
    	}
      });
    });
  }
  function onLoad() {
      gapi.load('auth2', function() {
        gapi.auth2.init();
      });
    }
  function openPopup() {
		
		
		var url = "KakaopayController?command=checklogin"; //url이란 변수에 html을 넣어주자. 
		var title = "";	
		var prop = "top=200px,left=600px,width=500px,height=500px";
		window.open(url, title, prop); 
}
  </script>
	</header>
</body>
</html>