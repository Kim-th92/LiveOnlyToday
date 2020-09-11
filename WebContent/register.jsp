<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
input,textarea,select{width:150px; padding:5px; border:1px solid #dedede} 
input:read-only{background-color:#dedede} /* read-only style */
select{padding:7px; vertical-align:middle}

</style>
</head>


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
 		<td><input type="text" name ="nickname"  required="required" /><button onclick="nickChk();" class="nickChk"> 중복확인</button><p class="nick"></p></td>
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
 		<td><input name="email11" type="text"> @ 
 		<input type="text" name="email2" id="str_email02" disabled value="naver.com"> 
 		<select name="selectEmail" id="selectEmail"> 
 			<option value="1">직접입력</option> 
 			<option value="naver.com" selected>naver.com</option> 
 			<option value="hanmail.net">hanmail.net</option> 
 			<option value="hotmail.com">hotmail.com</option> 
 			<option value="nate.com">nate.com</option> 
 			<option value="empas.com">empas.com</option>
 			 <option value="dreamwiz.com">dreamwiz.com</option> 
 			 <option value="freechal.com">freechal.com</option> 
 			 <option value="lycos.co.kr">lycos.co.kr</option> 
 			 <option value="korea.com">korea.com</option> 
 			 <option value="gmail.com">gmail.com</option> 
 			 <option value="hanmir.com">hanmir.com</option> 
 			 <option value="paran.com">paran.com</option>
 		</select>


		</td>
 	</tr>
 	<tr>
 		<th>주소</th>
 		<td><textarea name ="addr"  required="required" ></textarea></td>
 	</tr>
 	<tr>
 		<th>생년월일</th>
 		<td>
			<select name="birthyear" required> 
				<%for(int i = 2020 ; i>=1900 ; i--){
				%>
				<option value="<%=i%>"><%=i%>년</option>
				<% }	%>
							
			</select> 		
			<select name="birthmonth" required> 
				<%for(int i = 1	 ; i<=12 ; i++){
				%>
				<option value="<%=i%>"><%=i%>월</option>
				<% }	%>
							
			</select> 	
			<select name="birthdate" required> 
				<%for(int i = 1 ; i<=31 ; i++){
				%>
				<option value="<%=i%>"><%=i%>일</option>
				<% }	%>
							
			</select> 	

 		</td>
 	</tr>
 	<tr>
 		<td colspan="2"> <input type="submit" value="회원가입"/></td>
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
		alert("닉네임을 먼저 입력해주세요!!");
	} else{
		onload=function(){
			
		}
			function idConfirm(bool){
				if(bool==="true"){
					opener.document.getElementsByName("id")[0].title ="y";
					opener.document.getElementsByName("pw")[0].focus();
				}else{
					opener.document.getElementsByName("id")[0].focus();
				}
				self.close();
			}
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
$('#selectEmail').change(function(){ 
	$('#selectEmail option:selected').each(function (){ 
		if($(this).val()== '1'){ //직접입력일 경우 
			$('#str_email02').val(''); //값 초기화 
			$('#str_email02').attr('disabled',false); //활성화 
		}else{ 		//직접입력이 아닐경우 
			$('#str_email02').val($(this).text()); //선택값 입력 
			$('#str_email02').attr('disabled',true); //비활성화 
			} 
		});
	});


</script>

</body>
</html>