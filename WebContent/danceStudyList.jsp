<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

	var num = 1;
	
	function prevGallery(){
		num--;
		if(num < 1){
			num = 2;
		}
		document.getElementById("gallery").src="resources/img/danceStudyCssImg/img0" + num + ".png";
		document.getElementById("gallery").href="danceStudySelect"+ num + ".jsp";
		// 이벤트 전파 막기(jQuery에서 자세히 배움)
		return false;
	}
	
	function nextGallery(){
		num++;
		if(num > 2){
			num = 1;
		}
		document.getElementById("gallery").src="resources/img/danceStudyCssImg/img0" + num + ".png";
		document.getElementById("gallery").href="danceStudySelect"+ num + ".jsp";
		// 이벤트 전파 막기(jQuery에서 자세히 배움)
		return false;

	}
</script>

<style type="text/css">
	a > img{
		width: 50px; height: 50px;
	}
	#gallery{
		width: 200px; height: 200px;
	}
	p {
		width: 350px; height: 250px;
	}
	img{
		vertical-align: middle;
	}
	a{
		text-decoration: none;
	}

</style>
</head>
<body>
<%
Member_BoardDto member_dto=(Member_BoardDto)session.getAttribute("login");
if(member_dto == null){
	member_dto= new Member_BoardDto();
}
%>
<%@ include file="./format/header.jsp" %>
	<h1>동작을 따라해 봐</h1>
	
	<div id="gallerywrap">
		<p>
			<a onclick="return prevGallery();">
				<img alt="이전 그림" src="resources/img/danceStudyCssImg/arrowleft.png" width="50px" height="50px"/>
			</a>
			<a href="danceStudySelect1.jsp">
			<img alt="갤러리 그림" src="resources/img/danceStudyCssImg/img01.png" id="gallery"/>
			</a>
			<a onclick="return nextGallery();">
				<img alt="다음 그림" src="resources/img/danceStudyCssImg/arrowright.png" width="50px" height="50px"/>
			</a>
		</p>
	</div>
		

<% 			
		if(member_dto.getGrade() == null || member_dto == null){
%>
			<div>
				<span><a href ="dancemain.jsp">돌아가기</a></span>
			</div>
<% 		
			}
%>



<%@ include file="./format/footer.jsp" %>	
</body>
</html>