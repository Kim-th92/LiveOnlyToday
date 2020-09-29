<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style type="text/css">
body {
	background-color: #fdde60;
}

#shortcut-btn {
	transform: translate(200px, 20px);
}

.button01 {
	background-color: red;
	border: none;
	color: white;
	padding: 60px 80px;
	text-align: center;
	font-size: 20px;
	margin: 4px 50px;
	opacity: 0.6;
	transition: 0.3s;
	display: inline-block;
	text-decoration: none;
	cursor: pointer;
	border-radius: 15px;
	font-family: 'Do Hyeon', sans-serif;
}

.button02 {
	background-color: red;
	border: none;
	color: white;
	padding: 60px 60px;
	text-align: center;
	font-size: 20px;
	margin: 4px 50px;
	opacity: 0.6;
	transition: 0.3s;
	display: inline-block;
	text-decoration: none;
	cursor: pointer;
	border-radius: 15px;
	font-family: 'Do Hyeon', sans-serif;
}

.button01:hover {
	opacity: 1
}

.button02:hover {
	opacity: 1
}

#viewmember>button01 {
	position: absolute;
	top: 50%;
	left: 50%;
}

h1 {
	position: absolute;
	left: 45%;
}

h2, p {
	text-align: center;
}

#viewmember {
	position: absolute;
	left: 30%;
	top: 30%;
}

#qnaboard {
	position: absolute;
	left: 50%;
	top: 30%;
}

#img {
	float: right;
	transform:translate(-50px,300px);
}
</style>
<body>
	<%@include file="./format/header.jsp"%>



	<%@include file="./format/footer.jsp"%>
</body>
</html>