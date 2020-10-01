<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.0/css/all.css" integrity="sha384-OLYO0LymqQ+uHXELyx93kblK5YIS3B2ZfLGBmsJaUyor7CpMTBsahDHByqSuWW+q" crossorigin="anonymous">
<title>Insert title here</title>
<style>
#container{		transform: translate(30%, 10%);
	
	left:50%;
	top:30%;
	
	 }
 #map{		
	
	margin: 150px 0px 200px 400px;
	
	 }
h1{
font-size:40pt;
background: linear-gradient(to right, red,darkorange,green); 
background-clip: text;
  -webkit-background-clip: text;
  -moz-background-clip: text;
  -moz-text-fill-color: transparent;
  -webkit-text-fill-color: transparent;

}
</style>

</head>
<body style="background-color: #fdde60"> 

<%@include file="./format/header.jsp"%>
<div id="container">
	<img src="resources/logo.png" width="400px" height="100px" alt ="오늘뭐해로고">
	<h1> 오늘 뭐해? BY 오늘만 살조</h1>
	<p>
	취미생활을 위해 혼자서 이용할 수 있지만 오늘날 <strong>'online-contact'</strong> 
	<br/>시대에 발맞춰 자신의 취미생활을 라이브 스트리밍을 통해 공유할 수 있도록 구현한다. 
	<br/>이뿐만 아니라 모션인식 기능을 통해 이용자의 춤 동작과 안무 연습 영상 속의 동작을 비교함으로써 
	<br/>이용자에게 혼자서도 안무를 습득할 수 있는 서비스를 제공한다.<br/><br/><br/><br/>

	<strong>기대효과</strong>  
	노래와 춤을 좋아하고 관심있는 사람들이 
	<br/>마음껏 즐기고 자기의 재능도 개발시킬 수 있도록 도와주고, 
	<br/>누구나 쉽게 '방구석 콘서트'를 할 수 있는 플랫폼의 역할을 수행한다.<br/>
	<br/><br/>
	<h1>위치안내</h1>
	<p>주소 : 서울특별시 강남구 테헤란로 14길 6 남도빌딩 </p>
	<h3>대중교통</h3>
	
	<p><strong>역삼역.포스코P&S타워 정류장</strong><br/>
<i class="fas fa-bus" style ="color:dodgerblue;"></i> :  146 / 740 / 341 / 360         <i class="fas fa-bus" style ="color:red;"></i>  : 1100 / 1700 / 2000 / 7007 / 8001</p>
</div>

<div id="map" style="width:60%;height:600px;"></div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c96e0ddafe336af38e46d83280708929"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(37.499000, 127.032921), // 지도의 중심좌표
        level: 2 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption);

// 마커가 표시될 위치입니다 
var markerPosition  = new kakao.maps.LatLng(37.499000, 127.032921); 

// 마커를 생성합니다
var marker = new kakao.maps.Marker({
    position: markerPosition
});

// 마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);

var iwContent = '<div style="padding:5px;">오늘만살조!<br><a href="https://map.kakao.com/link/map/오늘뭐해!,37.499000, 127.032921" style="color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/Hello World!,33.450701,126.570667" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
    iwPosition = new kakao.maps.LatLng(37.499000, 127.032921); //인포윈도우 표시 위치입니다

// 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({
    position : iwPosition, 
    content : iwContent 
});
  
// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
infowindow.open(map, marker); 
</script>

<%@include file="./format/footer.jsp"%>
</body>
</html>