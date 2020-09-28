<%@page import="com.whatsup.dto.Member_BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<script src="https://apis.google.com/js/platform.js?onload=onLoad" async
	defer></script>
	<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">
</body>
<meta name="google-signin-client_id"
	content="910896443172-llnq01i6rrc8hlgruf3sm3c40bqhvvp4.apps.googleusercontent.com">

<style type="text/css">
ul ,section{
font-family: 'Do Hyeon', sans-serif;
}
body {
	background-color: #fdde60;
}

#logo {
	width: 300px;
	height: 70px;
	padding: 20px 0px 0px 20px;
	margin: 0;
}

header>div {
	display: inline-block;
}

section {
	padding:50px 0px 0px 40px;
	height:600px;
}
section+div.col{
 display: grid;
  grid-template-columns:50% 50% ;
  grid-gap: 10px;
  grid-auto-rows: minmax(600px, auto);
}
#main,#shortcut-btn{transform:translate(200px,20px);}

#img{
float:right;
transform:translate(-100px,-600px);
}


ul {
	margine: 0;
	padding: 0;
	list-style: none;
	font-size: 20pt;
	transform: translate(50px, -40px);
}

ul li {
	float: left;
	line-height: 40px;
	list-style: none;
	width: 150px;
	height: 40px;
	text-align: left;
}

ul li ul li {
	display: none;
}

ul li>a:hover {
	color: darkgray;
	border-bottom: 1px solid black;
}

ul li:hover ul li {
	display: block;
	transform: translate(-50px, 35px);
}

#login {
	float: right;
	padding: 40px 80px 0px 20px;
}

#dance {
	margin: 0;
	padding: 0;
	width: 600px;
	height: 600px;
}
p{
	font-size: 30pt;
}

a {
	color: black;
	text-decoration: none;
}

.login {
	padding: 20px;
	margin-left: 30px;
	background-color: black;
	color: white;
	font-weight: bold;
	border-radius: 20px;
} 

#main h1{  


font-size:50pt;
background: linear-gradient(to right, red,darkorange,green); 
background-clip: text;
  -webkit-background-clip: text;
  -moz-background-clip: text;
  -moz-text-fill-color: transparent;
  -webkit-text-fill-color: transparent;
  display: inline-block;
  
  }

.login:hover {
	background-color: grey;
	box-shadow: 3px 3px 2px 1px rgba(0, 0, 255, .2);
}
.shortcut{
  background-color: red;
  border: none;
  color: white;
  padding: 20px 40px;
  text-align: center;
  font-size: 20px;
  margin: 4px 50px;
  opacity: 0.6;
  transition: 0.3s;
  display: inline-block;
  text-decoration: none;
  cursor: pointer;
  border-radius:15px;
  font-family: 'Do Hyeon', sans-serif;
}

.shortcut:hover {opacity: 1}
footer {
	
}
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
			<li><a href="move.do?command=musicselect">노래</a>
				<ul>
					<li><a href="#">혼자 부르기 </a></li>

					<li><a href="move.do?command=streamboard">ON-AIR </a></li>

					<li><a href="#">ON-AIR </a></li>

				</ul></li>

			<li><a href="dancemain.jsp">춤</a></li>

			<li><a href="move.do?command=mainboardpage">게시판</a>
				<ul>
					<li><a href="move.do?command=freeboard">자유 게시판</a></li>
					<li><a href="#"> 춤</a></li>
					<li><a href="#"> 노래</a></li>
					<li><a href="#">채팅</a></li>
				</ul></li>
			<li><a href="#">고객센터</a>
				<ul>
					<li><a href="#">자주묻는 질문</a></li>
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



	</header>
	<section>
		<div id="main" class="col">
			<h1> 오늘만 사는 그대들을 <br/>위한 최적의 사이트❤︎︎</h1>
			<p>방구석에서 노래방을 즐기고 싶은가?</p>
			<p>방구석에서 춤을 추고 싶나요?!</p>
			<p> 아래 버튼을 눌러주세요!</p>
		</div>
		<div id="shortcut-btn" class="col">
			<button class="shortcut left"
				onclick="location.href='move.do?command=musicselect'">
				노래부르러 가기</button>
			<button class="shortcut right" onclick="dancemain.jsp">춤 추러 가기</button>
		</div>

		<div id="img" class="col">
			<img id="dance" alt="춤그림" src="resources/dance.png">
		</div>
	</section>
	<%
		String success = (String) request.getAttribute("successs");
	if (success != null) {
	%>
	<script type="text/javascript"> 
		alert('<%=success%>');
		</script>
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
	<%@include file="./format/footer.jsp"%>
</body>
</html>
