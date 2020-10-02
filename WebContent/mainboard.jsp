<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.11.3.js"></script>



<style type="text/css">
	#pageselect{
		width: 180px;
		height: 800px;
		float: left;
	}
	#maintag{
		font-weight: bold;
	}
	p{	
		margin-left :20px;
		border-bottom: 1px solid #bcbcbc;
	}
	p>a:hover {
		color: darkorange;
	}
	#boardview{
		widows: 1000px;
		height: 800px;
	}
	#myframe{
		width: 1000px;
		height: 800px;	
	}
	table {
	line-height: 40px;
}
	#bor{border-bottom: 2px solid red;}
	
</style>
</head>
<body>
<!-- header -->
<%@ include file="./format/header.jsp" %>
<!-- 좌측 메뉴(페이지 이동) -->
	<div id="pageselect">
		<nav>
			
			<p style ="font-size : 14pt;" id="maintag">게시판 선택</p>
			<p><a id="free" onclick="freeboard()">자유게시판</a></p>
			<p><a id="song" onclick="songboard()">노래게시판</a></p>
			<p><a  id ="dance" onclick="danceboard()">춤 게시판</a></p>
			<p><a id ="chat" onclick="chatingboard()">채팅</a></p>
			
		</nav>
	</div>
	<!-- 게시판 리스트 보여주는 영역 -->
	<div id="boardview">
		<iframe id="myframe" name="myframe" frameBorder="0" style="width:80%"></iframe>
	</div>
<!-- footer -->
<%@ include file="./format/footer.jsp" %>


<script type="text/javascript">
var free =document.getElementById('free');
var song =document.getElementById('song');
var dance =document.getElementById('dance');
var chat =document.getElementById('chat');
	
<%
String board = request.getParameter("board");
if(board ==null || board.trim()==""){
	
%>
window.onload=function(){
	freeboard();
}
	
	
<%		
}else if(board.equals("danceboard")){

%>
setTimeout(dance.click(),20000);
<%

}
%>
	function freeboard() {
		var url = "move.do?command=freeboard&currentPage=1";
		var title = "myframe";
		var prop = "";
		window.open(url, title, prop);
	}
	function songboard() {
		var url = "move.do?command=songboard&currentPage=1";
		var title = "myframe";
		var prop = "";
		window.open(url, title, prop);
	}
	function danceboard() {
		var url = "move.do?command=danceboard&currentPage=1";
		var title = "myframe";
		var prop = "";
		window.open(url, title, prop);
	}
	function chatingboard() {
		var url = "move.do?command=chatingboard&currentPage=1";
		var title = "myframe";
		var prop = "";
		window.open(url, title, prop);
	}
	
	
	
</script>
</body>
</html>