<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	.card {
  /* Add shadows to create the "card" effect */
  box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
  transition: 0.3s;
	width:25%;
	 border-radius: 50%;
	
}
#wrapper>img{
 border-radius: 50%;
}

/* On mouse-over, add a deeper shadow */
.card:hover {
  box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
  transform: rotateY(20deg);
}

/* Add some padding inside the card container */
.container {

	 text-align: center;
	  border-radius: 50%;
}
.card{ 
	display: inline-grid;
		 background-color: white;
		 margin : 60px 40px 30px;
		  border-radius: 50%;
}
body{background-color: #fdde60; }
#wrapper {text-align:center; border-radius: 50%;}
</style>
<body>
	<%@include file="./format/header.jsp"%>

		<div id= "wrapper">
		
			<div class="card">
			  <a href="danceStudyList.jsp"><img src="https://i.pinimg.com/originals/80/ec/4c/80ec4c146c56f5e5ee8b60c98ce77847.jpg" alt="Avatar" style="width:100%; height:400px; border-radius: 50%;" ></a>
			  <div class="container">
			   <h4><a href=""><b>춤 배우러가기!	</b></a></h4>
			  </div>
			 </div>
			
			<div class="card">
			  <a href="dancefollow_list.jsp"><img src="resources/danceimg2.jpeg" alt="Avatar" style="width:100%;height:400px; border-radius: 50%;" ></a>
			  <div class="container">
			    <h4><a href="dancefollow_list.jsp"><b>춤 따라추러 가기!</b></a></h4>
			  </div>
			</div>
			
			<div class="card">
			  	<a href="mainboard.jsp?board=danceboard"><img src="https://img.freepik.com/free-vector/people-cheering-dancing-youth-day_52683-40079.jpg?size=338&ext=jpg" alt="Avatar" style=" border-radius: 50%;width:100%;height:400px;" ></a>
			  <div class="container">
			    <h4><a href ="mainboard.jsp?board=danceboard"><b>춤 게시판으로 가기!</b></a></h4>
			  </div>
			</div>
		
		</div>
	<%@include file="./format/footer.jsp"%>
</body>
</html>