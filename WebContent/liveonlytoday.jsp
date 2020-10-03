<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.flip-card {
  background-color: transparent;
  width: 400px;
  height: 400px;
  perspective: 1000px; /* Remove this if you don't want the 3D effect */
  border-radius: 20px;
  margin : 50px 20px 100px;
}

/* This container is needed to position the front and back side */
.flip-card-inner {
  position: relative;
  width: 100%;
  height: 100%;
  text-align: center;
  transition: transform 0.8s;
  transform-style: preserve-3d;
}

/* Do an horizontal flip when you move the mouse over the flip box container */
.flip-card:hover .flip-card-inner {
  transform: rotateY(180deg);
}

/* Position the front and back side */
.flip-card-front, .flip-card-back {
  position: absolute;
  width: 100%;
  height: 100%;
  box-shadow:6px 7px 10px 5px rgb(214 27 27 / 20%);;
  -webkit-backface-visibility: hidden; /* Safari */
  backface-visibility: hidden;
}

/* Style the front side (fallback if image is missing) */
.flip-card-front {
 
  color: black;
}
p{line-height: 40px;
    padding: 20px 40px;}
 h1{padding :30px;}
/* Style the back side */
.flip-card-back {
  background-color: dodgerblue;
  color: white;
  transform: rotateY(180deg);
  line-height: 20px;
  
}

#wrapper {
	display: grid;
    grid-template-columns: 30% 30% 30%;
    grid-template-rows: 50% 50%;
    text-align: center;
    margin : 50px;
    margin-left: 200px;
   
}
h2,h1,p {
font-family: 'Do Hyeon', sans-serif;
}
</style>
</head>
<body style ="background-color:#fdde60;">
<%@include file="./format/header.jsp"%>
<h2 style="font-size: 35pt;margin-left:200px;">오늘만 살조 조원소개</h2>
<div id="wrapper">

	<div class="flip-card">
  <div class="flip-card-inner">
    <div class="flip-card-front">
      <img src="resources/key.jpeg" alt="Avatar" style="width:400px;height:400px;background-size: cover;">
    </div>
    <div class="flip-card-back" style="background-color: red;">
      <h1>김은영</h1>
      <p>오이만 있는 것이 아니라 오이도 있는 땅에서 태어나 인터넷을 알게 되어 세상을 알게되었습니다. 저의 세계가 그 땅에서 전세계가 되었듯 web의 가능성의 무궁무진함 알기에 개발자가 되어 세계로 나아가겠습니다.</p>
    </div>
  </div>
</div>

<div class="flip-card">
  <div class="flip-card-inner">
    <div class="flip-card-front">
      <img src="resources/kth.jpeg" alt="Avatar" style="width:400px;height:400px;background-size: cover;">
    </div>
    <div class="flip-card-back" style="background-color: dodgerblue;">
      <h1>김태형</h1>
      <p>해산물인 멍게는 거센 파도와 수온에 등 환경에 많은 영향을 받아 수확량이 좋지 않지만 그 고난을 견딘 멍게는 아주 비싸게 팔립니다. 이처럼 열심히 노력하여 한 사람의 개발자가 되도록 노력하겠습니다.</p>
    </div>
  </div>
</div>

<div class="flip-card">
  <div class="flip-card-inner">
    <div class="flip-card-front">
      <img src="resources/pgu.jpeg" alt="Avatar" style="width:400px;height:400px;background-size: cover;">
    </div>
    <div class="flip-card-back" style="background-color: black;">
      <h1>박건웅</h1>
      <p>축구를 생각하면 2002년 대한민국을 붉게 물들인 붉은악마가 떠오릅니다. 5천만명의 수로 전율을 느끼게 해준 축구. 하지만 web은 77억이라는 감동이고 폭발입니다. 여러분게 web의 전율을 보여드리겠습니다.
</p>
    </div>
  </div>
</div>

<div class="flip-card">
  <div class="flip-card-inner">
    <div class="flip-card-front">
      <img src="resources/ldh.jpeg" alt="Avatar" style="width:400px;height:400px;background-size: cover;">
    </div>
    <div class="flip-card-back" style="background-color: purple;">
      <h1>이다희</h1>
      <p> 부천의 꽃인 복숭아꽃이 손끝에 물들 듯이 저라는 복숭아 꽃이 web이라는 정보의 바다에 물들었습니다. 부천의 핵심인재로써 저는 web 개발의 선봉이 되겠습니다.</p>
    
    </div>
  </div>
</div>

<div class="flip-card">
  <div class="flip-card-inner">
    <div class="flip-card-front">
      <img src="resources/jsy.jpeg" alt="Avatar" style="width:400px;height:400px;background-size: cover;">
    </div>
    <div class="flip-card-back" style="background-color: pink;">
      <h1>장성윤</h1>
      <p>불광의 이념엔 인생의 모든 고뇌와 불행의 근본은 원인을 알수 없는 무명이므로 부처님의 법을 깨우치는 것이 광명이라고 합니다. 그래서 저는 지식의 보고인 web을 통해 광명을 찾고자 개발자가 되었습니다.</p>
    </div>
  </div>
</div>

<div class="flip-card">
  <div class="flip-card-inner">
    <div class="flip-card-front">
      <img src="resources/csw.jpeg" alt="Avatar" style="width:400px;height:400px;background-size: cover;">
    </div>
    <div class="flip-card-back" style="background-color: #48D1CC;" >
      <h1>최서원</h1>
      <p>꽃다운 나이 28세에 kh정보교육원에 몸을 담아 본 web의 아름다움은 하늘의 유성우의 그것과 같았습니다. 그래서 저는 오늘도 유성우의 뒤를 쫓아 달려가고 있습니다.</p>
    </div>
  </div>
</div>
</div>
<%@include file="./format/footer.jsp"%>
</body>
</html>