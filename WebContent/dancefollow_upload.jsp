 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.0/css/all.css" integrity="sha384-OLYO0LymqQ+uHXELyx93kblK5YIS3B2ZfLGBmsJaUyor7CpMTBsahDHByqSuWW+q" crossorigin="anonymous">
<style type="text/css">
	form h1{ text-align: left;}
form{
	width: 600px;
    background: #f1f1f1;
    height: 500px;
    padding: 40px 0px 80px 150px;
    border-radius: 10px;
    position: absolute;
    left: 50%;
    top: 50%;
    transform: translate(-50%,-50%);
    line-height: 40px;
	
}
table {
	padding : 0 0 80px 0;
}
.regbtn{
  display: block;
  width: 50%;
  height: 40px;
  border: none;
  background-color: darkorange;
  background-size: 200%;
  color: #fff;
  outline: none;
  cursor: pointer;
  transition: .5s;
  border-radius: 15px;
  margin-top: 0px;
}
input ,textarea{
	  
	font-size : 15px;
	
	outline:none;
	background:none;
	padding: 0 5px;
  	height: 40px;
  	width:100%;
}

.regbtn:hover{ background-color: red;}
</style>
</head>

<body style="background-color: #fdde60">
<%@ include file="./format/header.jsp" %>


		<div id="form">
		
		<form action="dance.do" method="post">
		<h1> 영상 업로드<i class="fas fa-file-video"></i> </h1>
		<input type="hidden" name="command" value="upload"/>
			<table>
				<tr>
					<th> 제목</th>
					<td><input type="text" name ="danceadmintitle" placeholder="제목-가수명 으로 입력해주세요"/></td>
				</tr>
			
				<tr>
					<th>영상 url	</th>
					<td><input type="url" name ="danceadminsrc" id="src"/><button id="btn" onclick="preview();">영상미리보기</button></td>
					
				</tr>
				<tr>
					<th>영상 설명</th>
					<td><textarea name ="danceadmincontent" ></textarea></td>
					
				</tr>
				<tr>
					<td colspan="2" align="center">
						<iframe id ="preview" src="" controls="controls" muted="muted"></iframe>
					</td>
				</tr>
				
				<tr>
					
					<td colspan="2" align="center"><input type="submit" class="regbtn" value="submit"/></td>
				</tr>
			</table>
		</form>
	
	</div>


<script type="text/javascript">
function preview(){
	var src =document.getElementById('src').value;
	var realSrc = src.replace(src.substring(src.indexOf("."), src.indexOf("e")+2), "be.com/embed/");
	
	document.getElementById('btn').type = 'button';
	document.getElementById('preview').src = realSrc;
}
</script>
<%@ include file="./format/footer.jsp" %>

</body>
</html>