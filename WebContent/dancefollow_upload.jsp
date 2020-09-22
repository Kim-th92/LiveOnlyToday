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
					<td><input type="text" name ="danceadmintitle"/></td>
				</tr>
			
				<tr>
					<th>영상 url	</th>
					<td><input type="url" name ="danceadminsrc" id="src"/></td>
					
				</tr>
				<tr>
					<th>영상 설명</th>
					<td><textarea name ="danceadmicontent" ></textarea></td>
					
				</tr>
				<tr>
					<td colspan ="2"><button onclick="preview()">영상 확인</button></td>
				</tr>
				<tr>
					
					<td colspan="2"><input type="submit" value="submit"/></td>
				</tr>
			</table>
		</form>
	<iframe id="preview" src="" ></iframe>	
	</div>

</div>

<script type="text/javascript">
var video = document.getElementById('preview');

function preview(){
	var src = document.getElementById('src');
	var videosrc = src.value;
	
	
	if(videosrc == null||videosrc.trim()==''){
		window.alert("영상url을 입력해 주세요");
	}else{
	video.style.display='block';
	video.src=videosrc;
		
		
	}
}
</script>
<%@ include file="./format/footer.jsp" %>

</body>
</html>