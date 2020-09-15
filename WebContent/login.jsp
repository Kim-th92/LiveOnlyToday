<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>

    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
 <meta name="google-signin-scope" content="profile email">
    <meta name="google-signin-client_id" content="910896443172-llnq01i6rrc8hlgruf3sm3c40bqhvvp4.apps.googleusercontent.com">
  <meta name="google-signin-scope" content="profile email">
<meta name="google-signin-client_id"
     content="
910896443172-llnq01i6rrc8hlgruf3sm3c40bqhvvp4.apps.googleusercontent.com">
   <script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
   
    <script src="https://apis.google.com/js/platform.js" async defer></script>
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
 <%
    String clientId = "bGlgaATXhrDCX6ib_fDu";//애플리케이션 클라이언트 아이디값";
    String redirectURI = URLEncoder.encode("http://localhost:8787/semi_project03/member.do?command=naverlogin", "UTF-8");
    SecureRandom random = new SecureRandom();
    String state = new BigInteger(130, random).toString();
    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
    apiURL += "&client_id=" + clientId;
    apiURL += "&redirect_uri=" + redirectURI;
    apiURL += "&state=" + state;
    session.setAttribute("state", state);
    String redirect = URLEncoder.encode("http://localhost:8787/semi_project03/member.do?command=googlelogin", "UTF-8");
 %>
 
 

<h1>로그인</h1>
<div id="input">
<form action="member.do" method="post">
	 <div class="g-signin2" data-onsuccess="onSignIn" data-theme="dark"></div>
 	<a href="<%=apiURL%>"><img height="50" src="resources/naver.png"/></a>
		<input type="hidden" name="command" value="login"/>
	<table >
	

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
        
        var xhr = new XMLHttpRequest();
  
        var redirectUrl = 'member.do/command=googlelogin';

        //using jquery to post data dynamically
        var form = $('<form action="' + redirectUrl + '" method="post">' +
                         '<input type="text" name="id_token" value="' +
                          googleUser.getAuthResponse().id_token + '" />' +
                                                               '</form>');
        $('body').append(form);
        form.submit();
     }
    </script>
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