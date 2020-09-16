<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="./format/header.jsp"%>
<h1>관리자 페이지</h1>
<div id ="viewmember">
	<h2>가입자 조회<button onclick="#">회원 전체 조회</button></h2>
	
	<p> 오늘의 가입자 수는 ? </p>
</div>
<div id="viewpayment">
	<h2>결제 내역<button onclick="#">결제 내역 전체</button></h2>
</div>

<div id="qnaboard">
	<h2>문의게시판 관리<button onclick="#">문의내역 전체 보기</button></h2>
</div>

<div id="statistics">
	<h2>통계보기<button onclick="#">무엇을 통계해야돼?</button></h2>
</div>





<%@include file="./format/footer.jsp"%>
</body>
</html>