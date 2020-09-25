<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<style type="text/css">

footer{ height:80px; background-color: grey;}
footer{z-index: 2;   position:fixed;   left: 0;   bottom: 0;   width: 100%; padding: 0;
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