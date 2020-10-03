<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%@include file="./format/header.jsp"%>

<div id="form">
	<form action="#" method="post">
		<input type="hidden" name="command" value="profileupdate">
		<h1> 프로필 수정</h1>
		<table>
 	<col width="150px">
 	<col width="600px">
 	<tr>
 		<th>아 이 디</th>
 		<td><input type="text" name ="id"  id ="id" readonly="readonly" value="<%=dto.getId() %>"/></td>
 	</tr>
 
 	<tr>
 		<th>닉네임</th>
 		<td><input type="text" id ="nickname"  name ="nickname"  required="required" title="n" placeholder="닉네임" value="<%=dto.getNickname() %>"/><button onclick="nickChk();" class="nickChk dbchk"> 중복확인</button><p class="nick"></p></td>
 	</tr>
 	<tr>
 		<th>이름</th>
 		<td><input type="text" name="name"  required="required" value="<%=dto.getName() %>"/></td>
 	</tr>
 	<tr>
 		<th>전화번호</th>
 		<td><input type="text" name="phone"  required="required" value="<%=dto.getPhone() %>" /></td>
 	</tr>
 	<tr>
 		<th>이메일</th>
 		<td><input name="email" type="text" readonly="readonly" value="<%=dto.getEmail() %>"></td>
 	</tr>
 	<tr>
 		<th>주소</th>
 		<td><textarea  style="resize: none;" name ="addr"  required="required" ><%=dto.getAddr() %></textarea></td>
 	</tr>
 	<tr>
 		<th>생년월일</th>
 		<td><input type="text" name ="birthday" readonly="readonly" value="<%=dto.getBirthday() %>"/></td>
 	</tr>
 	<tr style="text-align:-webkit-center;">
 		<td colspan="2" > <input class = "regbtn" type="submit" value="회원가입"/></td>
 	</tr>
 
 </table>
	</form>
</div>

<%@include file="./format/footer.jsp"%>
</body>
</html>