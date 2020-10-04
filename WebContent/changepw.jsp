<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<form action=# method="post">
		<table>
		<tr>
			<td colspan="2"> 비밀번호 수정 </td>
		</tr>
		<tr>
			<td>현재 비밀번호</td>
			<td> <input type="password" name ="currentpw" /></td>
		</tr>
		<tr>
			<td>아이디</td>
			<td><input type="password" name="pw" id="userPw"/></td>
		</tr>
		<tr>
			<td>이메일</td>
			<td><input type="password"name ="email" id="userPwChk"/><<font id="chkNotice" size="2"></font>/td>
		</tr>
		
		<tr>
			<td colspan = "2" align ="center"> <button class="regbtn" type="submit">비밀번호 찾기</button> </td>
		</tr>
		<tr>
			<td colspan="2" class="showpw"></td>
		</tr>
	</table>
	</form>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
$(function(){
    $('#userPw').keyup(function(){
      $('#chkNotice').html('');
    });

    $('#userPwChk').keyup(function(){

        if($('#userPw').val() != $('#userPwChk').val()){
          $('#chkNotice').html('비밀번호 불일치');
          $('#chkNotice').attr('color', '#f82a2aa3');
        } else{
          $('#chkNotice').html('비밀번호 일치');
          $('#chkNotice').attr('color', '#199894b3');
        }

    });
});
</script>
</body>
</html>