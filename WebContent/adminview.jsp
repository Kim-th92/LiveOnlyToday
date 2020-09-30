<%@page import="com.whatsup.dto.Member_BoardDto"%>
<%@page import="java.util.List"%>
<%@page import="com.whatsup.dao.Member_BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table.type06 {
    border-collapse: collapse;
    text-align: left;
    line-height: 1.5;
    border-top: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
    margin: 20px 10px;
}
table.type06 th {
    width: 150px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
}
table.type06 td {
    width: 350px;
    padding: 10px;
    vertical-align: top;
}
table.type06 .even {
    background: #efefef;
}
</style>
<%
	Member_BoardDao dao = new Member_BoardDao();
	List<Member_BoardDto> list = dao.selectList();
	Member_BoardDto dto=(Member_BoardDto)request.getAttribute("dto");
%>
</head>
<body>
<br>


	<table class="type06" border="1">
		<col width="50px" />
		<col width="100px" />
		<col width="100px" />
		<col width="100px" />
		<col width="50px" />
		<col width="300px" />
		<col width="50px" />
		<col width="70px" />
		<col width="300px" />
		<col width="100px" />
		<tr>
			<th>번호</th>
			<th>아이디</th>
			<th>이름</th>
			<th>닉네임</th>
			<th>회원등급</th>
			<th>이메일</th>
			<th>생년월일</th>
			<th>전화번호</th>
			<th>주소</th>
			<th>멤버십</th>
		</tr>
<%
	if(list.size()==0){
%>
		<tr>
			<td colspan="10" align="center">
				<a>작성된 글이 없습니다</a>
			</td>
		</tr>	
		
		
<%
	}
	else{
		
		for (int i = 0; i < list.size(); i++) {		
%>
		<tr>
			<td><%=list.get(i).getMember_seq() %></td>
			<td><%=list.get(i).getId() %></td>
			<td><%=list.get(i).getName() %></td>
			<td><%=list.get(i).getNickname() %></td>
			<td><%=list.get(i).getGrade() %></td>
			<td><%=list.get(i).getEmail() %></td>
			<td><%=list.get(i).getBirthday() %></td>
			<td><%=list.get(i).getPhone() %></td>
			<td><%=list.get(i).getAddr() %></td>
			<td><%=list.get(i).getMembership() %></td>
					
		
			
<% 				
%>
		</tr>
<%
		}
	}
%>
		</table>	

</body>
</html>