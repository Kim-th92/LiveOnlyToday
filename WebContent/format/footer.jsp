<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.0/css/all.css" integrity="sha384-OLYO0LymqQ+uHXELyx93kblK5YIS3B2ZfLGBmsJaUyor7CpMTBsahDHByqSuWW+q" crossorigin="anonymous">
<style type="text/css">



footer{
background-color: grey;
 position: fixed;
font-family: 'Do Hyeon', sans-serif;
    bottom:0;
    width:100%;
	z-index:2;
    height:70px;   
left:0px;
	}
.rightdiv{
	margin-left : 600px;
}

footer>div{display:inline-block;
}
#rightalign{
	display:inline-block;
	margin-left: 600px;
}
</style>

</head>
<body>

	<footer>
		<div>
			<a href="./index.jsp"> <img id="logo" alt="로고"
				src="./resources/logo.png" style="width:200px;height:40px;">
			</a>
		</div>
		<div id="rightalign">
		<div class="rightdiv left"><a href = "./map.jsp">노래방 찾으러가기<i class="fas fa-map"></i></a></div>
		
		<div class="rightdiv"><h2>KH정보교육원 오늘만 살조</h2></div>
		</div>
	</footer>
</body>
</html>