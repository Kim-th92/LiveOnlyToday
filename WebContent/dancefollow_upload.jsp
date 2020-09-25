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
		
		<form action="dance.do" method="post">
		<input type="hidden" name="command" value="upload"/>
			<table>
				<tr>
					<th> 제목</th>
					<td><input type="text" name ="danceadmintitle" placeholder="제목-가수명 으로 입력해주세요"/></td>
				</tr>
			
				<tr>
					<th>영상 url	</th>
					<td><input type="url" name ="danceadminsrc" id="src"/></td>
					
				</tr>
				<tr>
					<th>영상 설명</th>
					<td><textarea name ="danceadmincontent" ></textarea></td>
					
				</tr>
				
				<tr>
					
					<td colspan="2"><input type="submit" value="submit"/></td>
				</tr>
			</table>
		</form>
	</div>

</div>

<script type="text/javascript">

</script>
<%@ include file="./format/footer.jsp" %>

</body>
</html>