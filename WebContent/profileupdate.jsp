<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
form{
	width : 800px;
	background:  #f1f1f1;
	height: 500px;
	padding :80px 40px;
	border-radius: 10px;
	position : absolute;
	
	left:50%;
	top:50%;
	transform :translate(-50%,-50%); 
	line-height: 40px;
	
}
select{width:150px; padding:5px; border:1px solid #dedede;padding:7px; vertical-align:middle;} 

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
.nickChk{
 background-color: red;
  border: none;
  color: white;
  padding: 6px 10px;
  text-align: center;
  font-size: 14px;
  opacity: 0.6;
  transition: 0.3s;

  text-decoration: none;
  cursor: pointer;
  border-radius:10px;
}
.regbtn:hover{ background-color: red;}

</style>
</head>


<body style="background-color: #fdde60">

<%@include file="./format/header.jsp"%>

<div id="form">
	<form action="member.do" method="post">
		<input type="hidden" name="command" value="profileupdate">
		<input type="hidden" name="seq" value="<%=dto.getMember_seq() %>">
		<h1> 프로필 수정</h1>
		<table>
 	<col width="150px">
 	<col width="600px">
 	<%
 		String email="";
 		String emailAddr ="";
 		String addr="";
 		String phone="";
 		String birthYear,birthMonth,birthDate= "";
 		int split = dto.getEmail().indexOf("@");
 		
 		if(dto.getEmail().substring(0,4).equals("null")){
 			email = "";
 			emailAddr="";
 		}else{
 			email = dto.getEmail().substring(0,split);
 			emailAddr=dto.getEmail().substring(split+1);
 		}
 		
 		if(dto.getAddr()==null){
 			addr="";
 		}else {
 			addr = dto.getAddr();
 		}
 		
 		if(dto.getPhone()==null){
 			phone="";
 		}else{
 			phone= dto.getPhone();
 		}
 		
 		if(dto.getBirthday()==null){
 			birthYear ="";
 			birthMonth ="";
 			birthDate ="";
 		}else {
 			birthYear = dto.getBirthday().substring(0,dto.getBirthday().indexOf("-"));
 			birthMonth = dto.getBirthday().substring(dto.getBirthday().indexOf("-")+1,dto.getBirthday().lastIndexOf("-")); 
 			birthDate = dto.getBirthday().substring(dto.getBirthday().lastIndexOf("-")+1);
 		}
 	%>
 		<tr>
 		<th>아 이 디</th>
 		<td><input type="text" name ="id"  id ="id"  readonly="readonly"  value="<%=dto.getId()%>"/></td>
 	</tr>
 
 	<tr>
 		<th>닉네임</th>
 		<td><input type="text" id ="nickname"  name ="nickname"  required="required" title="n" value="<%=dto.getNickname()%>"/><button onclick="nickChk();" class="nickChk dbchk"> 중복확인</button><p class="nick"></p></td>
 	</tr>
 	<tr>
 		<th>이름</th>
 		<td><input type="text" name="name"  required="required" value="<%=dto.getName()%>"/></td>
 	</tr>
 	<tr>
 		<th>전화번호</th>
 		<td><input type="text" name="phone"  required="required" value="<%=phone %>"/></td>
 	</tr>
 	<tr>
 		<th>이메일</th>
 		<td>
 		<input name="email11" type="text" style="width:30%;" value="<%=email%>"> @ 
 		<input  name="email12" type="text"  id="str_email02" disabled value="<%=emailAddr %>" style="width:30%;"> 
 		<select name="selectEmail" id="selectEmail"> 
 			<option value="1">직접입력</option> 
 			<option value ="<%=emailAddr %>" selected><%=emailAddr %></option>
 			<option value="naver.com">naver.com</option> 
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
 		<td><textarea  style="resize: none;" name ="addr"  required="required"><%=addr %></textarea></td>
 	</tr>
 	<tr>
 		<th>생년월일</th>
 		
 		<td>
 			<input style="width:20%; padding-left :40px;" type="text" name="birthyear" required value= "<%=birthYear%>">년
 			<input style="width:20%; padding-left :40px;" type="text" name="birthmonth" required value= "<%=birthMonth%>">월
 			<input style="width:20%; padding-left :40px;" type="text" name="birthdate" required value= "<%=birthDate%>">일
			

 		</td>
 	</tr>
 	<tr style="text-align:-webkit-center;">
 		<td colspan="2" > <input class = "regbtn" type="submit" value="프로필 수정"/></td>
 	</tr>
 	</table>
	</form>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">

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
				console.log(msg.notUsed);
				if(msg.notUsed){
					document.getElementsByClassName('nick')[0].textContent="사용가능한 닉네임 입니다.";
					
				}else {
					document.getElementsByClassName('nick')[0].textContent =nickname +"중복된 닉네임입니다. 다른 닉네임을 사용해주세요.";
				}
			},error: function(err){
				console.log(err);
			}
		
		});
		
	}
	}	






$('#selectEmail').change(function(){ 
	$('#selectEmail option:selected').each(function (){ 
		if($(this).val()== '1'){ //직접입력일 경우 
			$('#str_email02').val(''); //값 초기화 
			$('#str_email02').attr('disabled',false); //활성화 
		}else{ 		//직접입력이 아닐경우 
			$('#str_email02').val($(this).val()); //선택값 입력 
		
			$('#str_email02').attr('disabled',true); //비활성화 
			} 
		});
	});


</script>

<%@include file="./format/footer.jsp"%>
</body>
</html>