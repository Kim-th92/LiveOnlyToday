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
<style type="text/css">

body {
	background-color: #fdde60;
}

h1 {
	position: absolute;
	left: 45%;
}
.layer{
	position: relative;
	top: 150px;
	left: 15%;
}


</style>
<body>
	<%@include file="./format/header.jsp"%>

	<h1>고객센터</h1>
	<div id="csmain">
		<div id="qnaboard">
		
			<button onclick="location.href='move.do?command=qnaboard&currentPage=1'" class="button01">문의게시판<i class="far fa-question-circle fa-10x"></i></button>			
		
		</div>
		
		<div id="adminchat">
		
				<button onclick="location.href='move.do?command=adminchat'" class="button02">1:1 관리자 문의<i class="far fa-comments fa-10x"></i></button>
		
		</div>
	</div>


	<%@include file="./format/footer.jsp"%>
</body>
</html>