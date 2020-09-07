<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</script>
<body>
<h1>회원가입</h1>
<form action="#" method="post">
 <table>
 	<tr>
 		<th>아 이 디</th>
 		<td><input type="text" name ="id"/><button onclick="" class="idkchk"> 중복확인</button></td>
 	</tr>
 	<tr>
 		<th>비밀 번호</th>
 		<td><input type="password"  id="userPw" name ="pw"/></td>
 	</tr>
 	<tr>
 		<th>비밀 번호 확인</th>
 		<td><input type="password" id="userPwChk"/><font id="chkNotice" size="2"></font></td>
 		
 		
 	</tr>
 	<tr>
 		<th>이름</th>
 		<td><input type="text" name="name"/></td>
 	</tr>
 	<tr>
 		<th>전화번호</th>
 		<td><input type="text" name="phone"/></td>
 	</tr>
 	<tr>
 		<th>이메일</th>
 		<td><input type ="email" name="email"/></td>
 	</tr>
 	<tr>
 		<th>주소</th>
 		<td><textarea name ="addr"></textarea></td>
 	</tr>
 	<tr>
 		<th>생년월일</th>
 		<td><input type="date" name ="birthday"/></td>
 	</tr>
 	<tr>
 		<td colspan="2"> <input type="submit" value="회원가"/></td>
 	</tr>
 
 </table>

</form>

</body>
</html>