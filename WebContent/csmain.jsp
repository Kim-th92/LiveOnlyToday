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
	font-family: 'Do Hyeon', sans-serif;
}

h1 {
	position: absolute;
	left: 45%;
}
.csmain{
    position: relative;
	top: 150px;
	left: 15%;
}

#cs {
    position: absolute;
	left: 5%;
    }

#adminchat {
    position: absolute;
	left: 40%;
      
}

.button {
  background-color: #fdde60; 
  border: none;
  color: white;
  padding: 16px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  transition-duration: 0.4s;
  cursor: pointer;
 
}

.button1 {
  border-radius: 12px;
  color: black; 
  font-family: 'Do Hyeon', sans-serif;
 
}

.button1:hover {
  background-color: #4CAF50;
  color: white;
}

.button2 {
  border-radius: 12px;
  color: black; 
  font-family: 'Do Hyeon', sans-serif;
}

.button2:hover {
  background-color: #008CBA;
  color: white;
}


</style>
<body>
	<%@include file="./format/header.jsp"%>

	<h1>고객센터</h1>
	<div class="csmain">
		<div id="cs">
		
			<button onclick="location.href='move.do?command=qnaboard&currentPage=1'" class="button button1">문의게시판<i class="far fa-question-circle fa-7x"></i></button>			
		
		</div>
		
		<div id="adminchat">
		
				<button onclick="openChat()" class="button button2">1:1 관리자 문의<i class="far fa-comments fa-7x"></i></button>
		
		</div>
	</div>

<script type="text/javascript">
function openChat(){
	<%
		int seq =  0;
		if(dto==null){
		seq =0;
		}else {
			seq = dto.getMember_seq();
		}

	%>
			window.open("member.do?command=adminchat&memberseq=<%=seq%>","관리자 채팅","top=200px,left=600px,width=500,height=500");
			
		}
</script>
	<%@include file="./format/footer.jsp"%>
</body>
</html>