<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.11.3.js"></script>
<script type="text/javascript">
	
	function freeboard() {
		var url = "move.do?command=freeboard";
		var title = "myframe";
		var prop = "";
		window.open(url, title, prop);
	}
	function songboard() {
		var url = "move.do?command=songboard";
		var title = "myframe";
		var prop = "";
		window.open(url, title, prop);
	}
	function danceboard() {
		var url = "move.do?command=danceboard";
		var title = "myframe";
		var prop = "";
		window.open(url, title, prop);
	}
	function chatingboard() {
		var url = "move.do?command=chatingboard";
		var title = "myframe";
		var prop = "";
		window.open(url, title, prop);
	}
	
	
	
</script>
<style type="text/css">
	#pageselect{
		width: 100px;
		height: 800px;
		float: left;
	}
	#maintag{
		font-weight: bold;
	}
	p{
		border-bottom: 1px solid #bcbcbc;
	}
	#boardview{
		widows: 1000px;
		height: 800px;
	}
	#myframe{
		width: 1000px;
		height: 800px;	
	}
</style>
</head>
<body>
<!-- header -->
<%@ include file="./format/header.jsp" %>
<!-- 좌측 메뉴(페이지 이동) -->
	<div id="pageselect">
		<nav>
			
			<p id="maintag">게시판 선택</p>
			<p><a onclick="freeboard()">자유게시판</a></p>
			<p><a onclick="songboard()">노래게시판</a></p>
			<p><a onclick="danceboard()">춤 게시판</a></p>
			<p><a onclick="chatingboard()">채팅</a></p>
			
		</nav>
	</div>
	<!-- 게시판 리스트 보여주는 영역 -->
	<div id="boardview">
		<iframe id="myframe" name="myframe"></iframe>
	</div>
<!-- footer -->
<%@ include file="./format/footer.jsp" %>
</body>
</html>