<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<link href="css/admin.css" rel="stylesheet" type="text/css"/>

</head>

<body>
	<%@include file="./format/header.jsp"%>

	<h1>고객센터</h1>
	<div class="csmain">
		<div class="cs">
		
			<button onclick="location.href='move.do?command=qnaboard'" class="button button1">문의게시판<i class="far fa-question-circle fa-5x"></i></button>			
		
		</div>
		
		<div class="adminchat">
		
				<button onclick="location.href='move.do?command=adminchat'" class="button button2">1:1 관리자 문의<i class="far fa-comments fa-5x"></i></button>
		
		</div>
	</div>


	<%@include file="./format/footer.jsp"%>
</body>
</html>