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
<% Member_BoardDto memberdto = (Member_BoardDto)session.getAttribute("login"); %>
<div id="section">
		<h1> 마이페이지</h1>
		
		<div id = "modifyprofile">
			<h1>마이 프로필<button onclick=""> 프로필 수정</button></h1>
			
		</div>
		<div id = "songlist">
			<h1>내가 부른 노래 <button onclick=""> 노래 전체 보기</button></h1>
		</div>
		<div id = "dancelist">
			<h1>내가 춘 춤<button onclick="">춤 전체 보기</button></h1>
		</div>
		<div id = "qna">
			<h1>내가한 질문<button onclick=""> 내가한 질문 전체 보기</button></h1>
		</div>
		<div id = "delete">
			<h1>회원탈퇴</h1>
			<form name="deleteform" method="post">
				<input type="button" value="회원탈퇴" id="btnDelete"/>
			</form>
		</div>
</div>




<%@include file="./format/footer.jsp"%>

<!-- 회원 탈퇴 시 alert 띄어줄 부분 -->
<% String err = (String)request.getAttribute("err"); 
	if(err!=null){
%>

 <script type="text/javascript">alert('<%=err%>');</script>
<% 		
	}
%>
<script type="text/javascript">

$(document).ready(function(){
    $("#btnDelete").click(function(){
        if(confirm("삭제하시겠습니까?")){
            document.deleteform.action = "member.do?command=deletemember&seq=<%=memberdto.getMember_seq()%>";
            document.deleteform.submit();
        }
    });
});


</script>
</body>
</html>