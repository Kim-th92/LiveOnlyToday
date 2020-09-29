<%@page import="com.whatsup.dto.Member_BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%Member_BoardDto memberdto =(Member_BoardDto)request.getAttribute("memberdto");  %>
<table>
 	<col width="150px">
 	<col width="600px">
 	<tr>
 		<th>아 이 디</th>
 		<td><%=memberdto.getId() %></td>
 	</tr>
 	
 	<tr>
 		<th>닉네임</th>
 		<td><%=memberdto.getNickname() %></td>
 	</tr>
 	<tr>
 		<th>이름</th>
 		<td><%=(memberdto.getName()!=null)?memberdto.getName():" " %></td>
 	</tr>
 	<tr>
 		<th>전화번호</th>
 		<td><%=(memberdto.getPhone()!=null)?memberdto.getPhone():" " %></td>
 	</tr>
 	<tr>
 		<th>이메일</th>
 		<td><%=(memberdto.getEmail()!=null)?memberdto.getEmail():" " %></td>
 	</tr>
 	<tr>
 		<th>주소</th>
 		<td><%=(memberdto.getAddr()!=null)?memberdto.getAddr():" " %></td>
 	</tr>
 	<tr>
 		<th>생년월일</th>
 		<td><%=(memberdto.getBirthday()!=null)?memberdto.getBirthday():" " %></td>
 	</tr>
 	<tr>
 		<th>결제내역</th>
 		<%
 		String membership ="";
 		if(memberdto.getMembership().equals("NOPAY")){
 			membership ="가입내역 없음";
 			}else if(memberdto.getMembership().equals("ONE")){
 				membership ="VIP 1";
 			}else if(memberdto.getMembership().equals("ALL")){
 				membership = "VIP 2";
 				
 			}
 				
 		%>
 			
 		<td><%=membership %></td>
 	</tr>
 	<tr style="text-align:-webkit-center;">
 		<td colspan="2" > <input class = "regbtn" type="button" onclick="" value="수정"/></td>
 	</tr>
 
 </table>
</body>
</html>