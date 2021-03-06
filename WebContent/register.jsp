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
select{width:150px; padding:5px; border:1px solid #dedede;padding:7px; vertical-align:middle;} 
input:read-only{background-color:#dedede} /* read-only style */
select{padding:7px; vertical-align:middle;}
th{text-align: left;}
*{
	margin : 0;
	padding : 0;
	text-decoration: none;
	font-family: montserrat;
	box-sizing :border-box;
	
}

body {
	min-height: 100vh;
	background-image: linear-gradient(45deg,#e66465,yellow);
}

form{
	width : 800px;
	background:  #f1f1f1;
	height: 750px;
	padding :80px 40px;
	border-radius: 10px;
	position : absolute;
	
	left:50%;
	top:50%;
	transform :translate(-50%,-50%); 
	line-height: 40px;
	
}

form  h1{
text-align : center;
margin-bottom :30px;
}
input ,textarea{
	  
	font-size : 15px;
	border:none;
	outline:none;
	background:none;
	padding: 0 5px;
  	height: 40px;
}
input[type="text"],input[type="password"],textarea{
	width : 80%;
  	border-bottom: 2px solid #adadad;
}
input:focus ,textarea:focus{
  	border-bottom: 2px solid darkorange;
}
tr {
	margin :30px 10px;
}
.regbtn{
	
  display: block;
  width: 50%;
  height: 50px;
  border: none;
  background: linear-gradient(120deg,green,yellow,red);
  background-size: 200%;
  color: #fff;
  outline: none;
  cursor: pointer;
  transition: .5s;
  border-radius: 15px;
  margin-top: 30px;
}
p{ color:darkorange; font-size: 9pt; font-weight: bold;}

.regbtn:hover{
  background-position: right;
}
.dbchk{
	border :none; background-color: darkorange; color:white; padding:5px 17px; border-radius: 5px;
}
.dbchk:hover{
 transition: .5s;
 background-color: red;
}

</style>
</head>


<body>

<form action="member.do" method="post">
<input type="hidden" name ="command" value="registeres"/>
<h1>회원가입</h1>
 <table>
 	<col width="150px">
 	<col width="600px">
 	<tr>
 		<th>아 이 디</th>
 		<td><input type="text" name ="id"  id ="id" required="required" title="n" placeholder="아이디를 입력해 주세요"/><button onclick="idChk();" class="idkchk dbchk"> 중복확인</button><p class="id"></p></td>
 	</tr>
 	<tr>
 		<th>비밀 번호</th>
 		<td><input type="password"  id="userPw" name ="pw"  required="required" placeholder="•••••••••"/></td>
 	</tr>
 	<tr>
 		<th>비밀 번호 확인</th>
 		<td><input type="password" id="userPwChk"  required="required" placeholder="•••••••••"/><font id="chkNotice" size="2"></font></td>
 		
 		
 	</tr>
 	<tr>
 		<th>닉네임</th>
 		<td><input type="text" id ="nickname"  name ="nickname"  required="required" title="n" placeholder="닉네임"/><button onclick="nickChk();" class="nickChk dbchk"> 중복확인</button><p class="nick"></p></td>
 	</tr>
 	<tr>
 		<th>이름</th>
 		<td><input type="text" name="name"  required="required" placeholder="이름"/></td>
 	</tr>
 	<tr>
 		<th>전화번호</th>
 		<td><input type="text" name="phone"  required="required" placeholder="010-0000-0000"/></td>
 	</tr>
 	<tr>
 		<th>이메일</th>
 		<td><input name="email11" type="text" style="width:30%;" placeholder="이메일"> @ 
 		<input type="text" name="email2" id="str_email02" disabled value="naver.com" style="width:30%;"> 
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
 		<td><textarea  style="resize: none;" name ="addr"  required="required" placeholder="OO시 OO구" ></textarea></td>
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
 	<tr style="text-align:-webkit-center;">
 		<td colspan="2" > <input class = "regbtn" type="submit" value="회원가입"/></td>
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

function nickChk(){
	var doc = document.getElementById("nickname");
	var nickname = document.getElementById("nickname").value;
	if(doc.value==null||doc.value.trim()=="" ){
		alert("닉네임을 먼저 입력해주세요!!");
	} else{
		$.ajax({
			url : "member.do?command=nickchk&nickname="+nickname,
			method:"get",
			dataType : "json",
			success :function(msg){
				console.log(typeof(msg.notUsed));
				if(msg.notUsed){
					document.getElementsByClassName('nick')[0].textContent=nickname +"사용가능한 닉네임 입니다."
					document.getElementById("nickname").title ="y";
				}else {
					$(".nick").html =nickname +"중복된 닉네임입니다. 다른 닉네임을 사용해주세요.";
				}
			},error: function(err){
				console.log(err);
			}
		
		});
		
	}
}
function idChk(){
	var doc = document.getElementsByName("id")[0];
	var id = document.getElementsByName("id")[0].value;
	if(doc.value==null||doc.value.trim()=="" ){
		alert("아이디를 먼저 입력해 주세요!!");
	} else{
		$.ajax({
			url : "member.do?command=idchk&myid="+id,
			method:"get",
			dataType : "json",
			success :function(msg){
				console.log(typeof(msg.notUsed));
				if(msg.notUsed){
					document.getElementsByClassName('id')[0].textContent= "사용가능한 아이디 입니다."
					document.getElementById("id").title ="y";
					document.getElementsByName("pw")[0].focus();
				}else {
					document.getElementsByClassName('id')[0].textContent='중복된 아이디 입니다';
					document.getElementsByName("id")[0].focus();
				}
			},error: function(err){
				console.log(err);
			}
		
		});
		
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
//닉넴 중복체
function nickChkConfirm(){
	var chk = document.getElementsByName("nickname")[0].title;
	if(chk=="n"){
		alert("닉네임 중복체크를 먼저 해주세요.");
		document.getElementsByName("nickname")[0].focus();
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