<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="./format/header.jsp" %>
<div id = "section">
	<div id="insert">
		<video src="" controls="controls"></video>
		<form action="#" method="post">
			<table>
				<tr>
					<th>노래 제목</th>
					<td><input type="text" name ="dancetitle"/></td>
				</tr>
				<tr>
					<th>가수 명 </th>
					<td><input type="text"/></td>
				</tr>
				<tr>
					<th>영상업로드</th>
					<td><input type="file" name ="dancevideo"/></td>
				</tr>
				
			</table>
		</form>
	
	</div>

</div>

<%@ include file="./format/footer.jsp" %>

</body>
</html>