<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
$(function(){
    $('#userPw').keyup(function(){
      $('#chkNotice').html('');
    });

    $('#userPwChk').keyup(function(){

        if($('#userPw').val() != $('#userPwChk').val()){
          $('#chkNotice').html('비밀번호 일치하지 않음');
          $('#chkNotice').attr('color', '#f82a2aa3');
        } else{
          $('#chkNotice').html('비밀번호 일치함');
          $('#chkNotice').attr('color', '#199894b3');
        }

    });
});

function nickChk(){
	var doc = document.getElementsByName("nickname")[0];
	if(doc.value==null||doc.value.trim()=="" ){
		alert("닉네임을 먼저 입력해주세!!");
	} else{
		open("member.do?command=nickchk&nick="+doc.value,"","width=200,height=200");
	}
}
function idChk(){
	var doc = document.getElementsByName("id")[0];
	if(doc.value==null||doc.value.trim()=="" ){
		alert("아이디를 먼저 입력해 주세요!!");
	} else{
		open("member.do?command=idchk&myid="+doc.value,"","width=200,height=200");
	}
}

//id 중복 체크 완료 했는지 여부 확인
function idChkConfirm(){
	var chk = document.getElementsByName("id")[0].title;
	if(chk=="n"){
		alert("아이디 중복체크를 먼저 해주세요.");
		document.getElementsByName("id")[0].focus();
	}
}
</script>
<body>
<h1>회원가입</h1>
<form action="member.do" method="post">
<input type="hidden" name ="command" value="registeres"/>
 <table>
 	<tr>
 		<th>아 이 디</th>
 		<td><input type="text" name ="id"  required="required" title="n" /><button onclick="idChk();" class="idkchk"> 중복확인</button></td>
 	</tr>
 	<tr>
 		<th>비밀 번호</th>
 		<td><input type="password"  id="userPw" name ="pw"  required="required" /></td>
 	</tr>
 	<tr>
 		<th>비밀 번호 확인</th>
 		<td><input type="password" id="userPwChk"  required="required" /><font id="chkNotice" size="2"></font></td>
 		
 		
 	</tr>
 	<tr>
 		<th>닉네임</th>
 		<td><input type="text" name ="nickname"  required="required" /><button onclick="nickChk();" class="nickChk"> 중복확인</button></td>
 	</tr>
 	<tr>
 		<th>이름</th>
 		<td><input type="text" name="name"  required="required" /></td>
 	</tr>
 	<tr>
 		<th>전화번호</th>
 		<td><input type="text" name="phone"  required="required" /></td>
 	</tr>
 	<tr>
 		<th>이메일</th>
 		<td><input type ="email" name="email"  required="required" /></td>
 	</tr>
 	<tr>
 		<th>주소</th>
 		<td><textarea name ="addr"  required="required" ></textarea></td>
 	</tr>
 	<tr>
 		<th>생년월일</th>
 		<td><input type="date" name ="birthday"  required="required" /></td>
 	</tr>
 	<tr>
 		<td colspan="2"> <input type="submit" value="회원가입"/></td>
 	</tr>
 
 </table>

</form>

</body>
</html>