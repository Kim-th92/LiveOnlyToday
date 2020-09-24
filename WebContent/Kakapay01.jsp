<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/kakaopay.css" rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript">
	//체크박스를 radio처럼 
	function Checkbox(chk) {
		var check = false;
		var obj = document.getElementsByClassName("ch");
		
		for (var i = 0; i < obj.length; i++) {
			if (obj[i] != chk) {
				obj[i].checked = false;
			}
		}
		
	}
	
	function check01(){
		$("#confirm").click(function(){
			if($("input[class='ch']:checked").length == 0){
				alert("체크해 주세요");
			}
		})
	}
		
		
	
	
	
	
	// 어려웅....
	//하나도 체크 안했을때 (JQ 4번 select04확인 )
	/*$("#confirm").click(function(){
				if($("input[class=ch]:checked").length == 0){
					alert("하나 이상 체크해 주세요!!!");
		} else {
			
		}
	}*/
</script>
</head>
<body>
	<!-- #fdde60 -->
	<p>정회원이 되고 더 많은 혜택을 누리자!!</p>

	<form action="KakaopayController" method="post" id = payment>
		<input type="hidden" name="command" value="Kakaopay" />
		 <input type="checkbox" class="ch" id="ch01" name="planA" value="plana" onclick="Checkbox(this);" />PLAN A (노래방)<br/> 
		 <br/> 
		 <input type="checkbox" class="ch" id="ch01" name="planB" value="planb" onclick="Checkbox(this);" />PLAN B(노래방 & 춤)<br/> 
		 <br/> 
		 <input type="submit" value="" onclick="check01" id="confirm" style="background-image: url('resources/img/payment_icon_yellow_small.png'); border: 0px; width: 61px; height: 25px; background-color: white; outline: 0;" />
	</form>
<!-- border: 1px solid black;
	box-sizing: border-box;
	width: 300px;
	height: 320px;
	text-align: center;
	margin-left: auto;
	margin-right: auto;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	 -->

</body>
</html>