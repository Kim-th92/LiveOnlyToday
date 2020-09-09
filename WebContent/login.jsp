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
</style>

</head>
<body>

<h1>로그인</h1>
<div id="input">
<form action="member.do" method="post">
	<input type="hidden" name="command" value="login"/>
	<div class="g-signin2" data-onsuccess="onSignIn"></div>
    <script>
      function onSignIn(googleUser) {
        // Useful data for your client-side scripts:
        var profile = googleUser.getBasicProfile();
        console.log("ID: " + profile.getId()); // Don't send this directly to your server!
        console.log('Full Name: ' + profile.getName());
        console.log('Given Name: ' + profile.getGivenName());
        console.log('Family Name: ' + profile.getFamilyName());
        console.log("Image URL: " + profile.getImageUrl());
        console.log("Email: " + profile.getEmail());

        // The ID token you need to pass to your backend:
        var id_token = googleUser.getAuthResponse().id_token;
        console.log("ID Token: " + id_token);
      }
    </script> 
		
	<table >
		<tr>
			<td colspan="2"><a href=""><img class="login" src="resources/naver.png"/></a> </td>
		</tr>
			<tr>
			<td colspan="2"><a href=""><img class="login" src="resources/kakao.png"/></a> </td>
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
			<td colspan="2"><button type="submit" class="loginbtn" >로그인</button></td>
		</tr>
		<tr>
			
			<td colspan="2"> <a href="findidpw.jsp">id pw 찾기</a> | <a href="register.jsp">회원가입</a></td>
		</tr>
		
	
	</table>
</form>
</div>

</body>
</html>