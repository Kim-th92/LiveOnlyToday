<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>아이디 비밀 번호 찾기</h1>
<form action="member.do" method="post">
<input type="hidden" name="command" value="findid"/>
	<table>
		<tr>
			<td colspan="2"> ID 찾기 </td>
		</tr>
		<tr>
			<td>이름</td>
			<td> <input type="text" name ="name" /></td>
		</tr>
		<tr>
			<td>이메일</td>
			<td><input type="email"name ="email"/></td>
		</tr>
		
		<tr>
			<td colspan = "2"> <button type="submit" class="findidbtn">ID 찾기</button> </td>
		</tr>
		<tr>
			<td colspan = "2" class="showid"> </td>
		</tr>
	</table>
	
</form>


<hr/>


<form action="member.do" method="post">
<input type="hidden" name="command" value="findpw"/>
	<table>
		<tr>
			<td colspan="2"> 비밀번호 찾기 </td>
		</tr>
		<tr>
			<td>이름</td>
			<td> <input type="text" name ="name" /></td>
		</tr>
		<tr>
			<td>아이디</td>
			<td><input type="text" name="id"/></td>
		</tr>
		<tr>
			<td>이메일</td>
			<td><input type="email"name ="email"/></td>
		</tr>
		
		<tr>
			<td colspan = "2"> <button type="submit">비밀번호 찾기</button> </td>
		</tr>
		<tr>
			<td colspan="2" class="showpw"></td>
		</tr>
	</table>
	
</form>
<script type="text/javascript">
	<%
		String err = (String)request.getAttribute("err");
		String msg = (String)request.getAttribute("msg");
		String errpw=(String)request.getAttribute("errpw");
		String msgpw = (String)request.getAttribute("msgpw");
		
		if(err!=null&&msg ==null){
	%>
	document.getElementsByClassName('showid')[0].textContent = "<%=err%>";
	<%
		}else if(msg != null){
	%>
		document.getElementsByClassName('showid')[0].textContent = "<%=msg%>";
	<%		
		}else if(errpw!=null&&msgpw ==null){
	%>
		document.getElementsByClassName('showpw')[0].textContent = "<%=errpw%>";
	<%
		}else if(msgpw != null){
	%>
		document.getElementsByClassName('showpw')[0].textContent = "<%=msgpw%>";
	<%		
		}
	%>

	

</script>
</body>
</html>