<%@page import="com.whatsup.dto.Member_BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table{
	width:100%;
	}
	.regbtn{
  display: block;
  width: 50%;
  height: 50px;
  border: none;
  background-color: darkorange;
  background-size: 200%;
  color: #fff;
  outline: none;
  cursor: pointer;
  transition: .5s;
  border-radius: 15px;
  margin-top: 30px;
}
.regbtn:hover{ background-color: red;}
	
</style>
</head>
<body  style="background-color: #fdde60">
	<% 
		Member_BoardDto dto  = (Member_BoardDto)request.getAttribute("dto");
	%>
	<form action="member.do" method="post">
	<input type="hidden" name ="command" value="changepwres"/>
	<input type= "hidden" name = "memberseq" value ="<%=dto.getMember_seq()%>"/> 
		<table>
		<tr>
			<td colspan="2" align="center"> <p style="font-size: 14pt;">비밀번호 수정</p> </td>
		</tr>
		<tr>
			<td>현재 비밀번호</td>
			<td> <input type="password" id="currentpw" name ="currentpw" /></td>
		</tr>
		<tr>
			<td>변경할 비밀번호</td>
			<td><input type="password" name="pw" id="userPw"/></td>
		</tr>
		<tr>
			<td>변경할 비밀번호 확인</td>
			<td><input type="password"name ="email" id="userPwChk"/> <strong id="chkNotice" ></strong></td>
		</tr>
		
		<tr>
			<td colspan = "2" align ="center"> <input type="button" disabled class="regbtn" value="비밀번호 수정"/> </td>
		</tr>
		<tr>
			<td colspan="2" id="showpw"></td>
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
          $('.regbtn').attr('disabled',true);
        } else{
          $('#chkNotice').html('비밀번호 일치');
          $('#chkNotice').attr('color', '#199894b3');
          $('.regbtn').attr('disabled',false);
        }

    });
});

	$('.regbtn').click(function(){
		var currentPw = $('#currentpw').val();
		var changePw= $('#userPw').val();
		var id = "<%=dto.getId()%>"
			
			$.ajax({
				url : "member.do",
				method:"POST",
				data: {
					"command": "checkPw",
					"id" :id,
					"currentPw":currentPw,
					"changePw" : changePw
				},
				dataType : "json",
				success :function(msg){
				  if(msg.check){
					  alert('비밀번호 수정 성공!');
					  self.close();
					  
				  }else{
					  console.log(msg.msg);
					  var show = document.getElementById('showpw');
					  show.textContent = msg.msg;
					  show.style.color = 'red';
				  }
					
					
				},error: function(err){
					console.log(err);
				}
			
			});
		
	});


</script>
</body>
</html>