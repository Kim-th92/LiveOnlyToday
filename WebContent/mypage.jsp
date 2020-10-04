<%@page import="com.whatsup.dao.Member_BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<body>
<%@include file="./format/header.jsp"%>
<% Member_BoardDto memberdto = (Member_BoardDto)session.getAttribute("login"); 
	if(memberdto ==null){
%>

	<script type="text/javascript">
		alert("로그인을 먼저해주세용~");
		
	</script>
<% 		
		response.sendRedirect("index.jsp");
	}
	int seq =(memberdto!=null)?memberdto.getMember_seq():0;
%>


<style>
	
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
#section{font-family: 'Do Hyeon', sans-serif;}

#modifyprofile{
	position: absolute;
	left: 5%;

}

#songlist{
	position: absolute;
	left: 30%;
}


#qna{
	position: absolute;
	left: 50%;
	
}

#picture {
	width: auto;
	height: auto;
	max-width: 200px;
	max-height: 200px;

}
#modifyprofile:hover{
	border: 2px solid gray;
	background-color: darkorange;
	border-top-left-radius: 5px;
	border-bottom-left-radius: 5px;
	border-top-right-radius: 5px;
	border-bottom-right-radius: 5px;
}

#songlist:hover{
	border: 2px solid gray;
	background-color: darkorange;
	border-top-left-radius: 5px;
	border-bottom-left-radius: 5px;
	border-top-right-radius: 5px;
	border-bottom-right-radius: 5px;
}

#qna:hover{
	border: 2px solid gray;
	background-color: darkorange;
	border-top-left-radius: 5px;
	border-bottom-left-radius: 5px;
	border-top-right-radius: 5px;
	border-bottom-right-radius: 5px;
	
}

#delete{
	
	position: absolute;
	top: 80%;
	left: 95%;
}

#btnDelete{
	
	border: 1px solid black;
	background-color: rgba(0,0,0,0);
	color: black;
	padding: 5px;
	border-top-left-radius: 5px;
	border-bottom-left-radius: 5px;
	border-top-right-radius: 5px;
	border-bottom-right-radius: 5px;
}

#btnDelete:hover{
	color: white;
	background-color: gray;
	
}
</style>

<div id="section">
		<h1> 마이페이지</h1>
		
		
		<div class="layer">
		
		<div id = "modifyprofile">
			<a title="프로필 보기" href="veiwprofile.jsp"><img id="picture" alt="" src="resources/img/profile.png"></a>
			
		</div>
		<div id = "songlist">
			<a title="노래 전체 보기" href="#"> <img id="picture" alt="" src="resources/img/mic.png"></a>
		</div>
		 
		<div id = "qna">
			<a title="내가한 질문 전체 보기" href="#"><img  id="picture" alt="" src="resources/img/Q.png"> </a>
		</div>
		</div>
		
		
		
		<div id = "delete">
			
			<form name="deleteform" method="post">
				<input type="button" value="회원탈퇴" id="btnDelete"/>
			</form>
		</div>
		
		
</div>




<%@include file="./format/footer.jsp"%>



<script type="text/javascript">

$(document).ready(function(){
    $("#btnDelete").click(function(){
    	var res  = window.confirm("정말로 탈퇴하시겠습니까?");
        if(res){
            document.deleteform.action = 'member.do?command=deletemember&seq=<%=seq%>';
            document.deleteform.submit();
        }
    });
});

</script>
<!-- 회원 탈퇴 시 alert 띄어줄 부분 -->
<% String err = (String)request.getAttribute("err"); 
	if(err!=null){
%>


	 <script type="text/javascript">
	 	alert('<%=err%>');
	 </script>
<% 		
	}
%>



</body>
</html>