<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
window.onload=function(){
	var url = "https://192.168.219.107:3000//client.html";
	var title = "myframe";
	var prop = "";
	window.open(url, title, prop);
}
</script>
<style type="text/css">
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
<%@ include file="./format/header.jsp" %>
<div id="boardview">
		<iframe id="myframe" name="myframe"></iframe>
	</div>
<%@ include file="./format/footer.jsp" %>
</body>
</html>