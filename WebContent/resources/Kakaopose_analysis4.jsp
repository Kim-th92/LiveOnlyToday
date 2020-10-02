<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>카카오 분석하기</h1>
	<p id="job_id"></p>
	<input type="button" value="자바님 부탁합니다" onclick="a();"/>
	<input type="button" value="콜백 좀여" onclick="b();"/>
	<input type="button" value="제발 돼라!" onclick="c();"/>
	
	<script type="text/javascript"
		src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="./kakaoAnalysis.js"></script>
	<script src="./kakaoCollback.js"></script>
	<script src="./kakaoResult.js"></script>
	<script type="text/javascript">
		function a() {
			analysis();
		}
		var idpass = $('p').text();
	
		function b(){
			collback()
		}
		
		function c(){
			result()
		}
		
		
		
	</script>
</body>

</html>