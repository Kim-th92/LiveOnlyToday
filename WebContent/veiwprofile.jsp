<%@page import="com.whatsup.dto.Member_BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
form h1{ text-align: center;}
#form {
	width : 800px;
	background:  #f1f1f1;
	height: 400px;
	padding :80px  40px 150px 40px;
	border-radius: 10px;
	position : absolute;
	text-align:center;
	left:50%;
	top:50%;
	transform :translate(-50%,-50%); 
	line-height: 40px;
}
table {
	padding : 0 0 50px 0;
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
<body style="background-color: #fdde60">


<%@include file="./format/header.jsp"%>

<div id ="form">
<h1>내 정보</h1>
<table>
 	<col width="150px">
 	<col width="600px">
 	<tr style="text-align:-webkit-center;">
 		<td colspan="2">
 		<input type= "button" class = "regbtn" onclick="openChange();" value="비밀번호 수정">
 		</td>
 	</tr>
 	<tr>
 		<th>아 이 디</th>
 		<td><%=dto.getId() %></td>
 	</tr>
 	
 	<tr>
 		<th>닉네임</th>
 		<td><%=dto.getNickname() %></td>
 	</tr>
 	<tr>
 		<th>이름</th>
 		<td><%=(dto.getName()==null)?" ":dto.getName() %></td>
 	</tr>
 	<tr>
 		<th>전화번호</th>
 		<td><%=(dto.getPhone()==null)?"":dto.getPhone() %></td>
 	
 	</tr>
 	<tr>
 		<th>이메일</th>
 		<td><%=(dto.getEmail().substring(0,4).equals("null"))?" ":dto.getEmail() %></td>
 	</tr>
 	<tr>
 		<th>주소</th>
 		<td><%=(dto.getAddr().substring(0,4).equals("null"))?"":dto.getAddr() %></td>
 	</tr>
 	<tr>
 		<th>생년월일</th>
 		<td><%=(dto.getBirthday() ==null)?"":dto.getBirthday()%></td>
 	</tr>
 	<tr>
 		<th>결제내역</th>
 		<%
 		String membership ="";
 		if(dto.getMembership().equals("NOPAY")){
 			membership ="결제내역 없음";
 			}else if(dto.getMembership().equals("ONE")){
 				membership ="PLAN A";
 			}else if(dto.getMembership().equals("ALL")){
 				membership = "PLAN B";
 				
 			}
 				
 		%>
 			
 		<td><%=membership %></td>
 	</tr>
 	<tr style="text-align:-webkit-center;">
 		<td colspan="2" > <button class = "regbtn" onclick="location.href='profileupdate.jsp'">프로필 수정</button></td>
 	</tr>
 </table>
 </div>
<script type="text/javascript">
	function openChange(){
		var url = 'member.do?command=changepw&memberseq=<%=dto.getMember_seq()%>';
		var prop = 
		
	}
</script>
 
 <%@include file="./format/footer.jsp"%>
</body>
</html>