<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
    <meta name="google-signin-scope" content="profile email">
  <script src="https://apis.google.com/js/platform.js" async defer></script>
  <meta name="google-signin-client_id" content="910896443172-llnq01i6rrc8hlgruf3sm3c40bqhvvp4.apps.googleusercontent.com">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.login { width : 300px ; height : 60px;}
input {width : 270px; height :40px;}
.loginbtn {width:300px ; height:60px;}
.idkchk{width:100px; height:40px;}
#input{left :50%}
.g-signin2 {display : inline-block; width : 300px;}
b {font-size: 20pt;color:red;}
</style>

</head>
<body>

<h1>로그인</h1>
<div id="input">
<form action="member.do" method="post">

 
		<input type="hidden" name="command" value="login"/>
	<table >
		<tr>
			<td colspan="2"><a href=""><img class="login" src="resources/naver.png"/></a> </td>
		</tr>

		<tr>
			<th>id</th>
			<td><input type="text" name="id"></td>
			
		</tr>
		<tr>
			<th>PW</th>
			<td> <input type="password" name="pw"></td>
			
		</tr>
		<tr>
			
			<td colspan="2" class="err"> </td>
		</tr>
		
		<tr>
			<td colspan="2"><button type="submit" class="loginbtn" >로그인</button></td>
		</tr>
		
		
		<tr>
			
			<td colspan="2"> <a href="findidpw.jsp">id pw 찾기</a> | <a href="register.jsp">회원가입</a></td>
		</tr>
		
	</table>
</form>
</div>

	  <script type="text/javascript">
   		<%
   			String error = (String)request.getAttribute("err");
   			if(error==null){
 					error = "";
   			}else{
   			%>
			const error = "<b><%=error%></b>"
			const dom = document.getElementsByClassName('err')[0];
   			dom.innerHTML = error;
   			
   		
   		<%
   			}
   		%>
  	</script>
</body>
</html>