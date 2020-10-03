<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">
<style type="text/css">
footer{
}

footer{
background-color: grey;
 position: fixed;
font-family: 'Black Han Sans', sans-serif;
    bottom:0;
    width:100%;
	z-index:2;
    height:70px;   
left:0px;
	}
footer>div{display:inline-block;}</style>
</head>
<body>

	<footer>
		<div>
			<a href="./index.jsp"> <img id="logo" alt="로고"
				src="./resources/logo.png" style="width:200px;height:40px;">
			</a>
		</div>
		<div><a href = "./map.jsp">노래방 찾으러가기</a></div>
		
		<div><h2>KH정보교육원 오늘만 살조</h2></div>
	</footer>
</body>
</html>