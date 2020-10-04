<%@page import="java.util.List"%>
<%@page import="com.whatsup.dto.MusicListDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/musicselect.css">
<title>Insert title here</title>
<%
	List<MusicListDto> musiclist=(List<MusicListDto>)request.getAttribute("musiclist");
%>

<style type="text/css">
	#musicview {
		border: 1px solid black;
		position: absolute;
		top: 200px;
		left: 500px;
		display: none;
		width: 500px;
		background-color:black;
		color: white;
	}
	#music{
		width: 490px;
	}
	#subtitle{
		
		height: 20px;
		
	}
	#subtitleview{
		font-size: 20px;
	}
</style>
</head>
<body>
<%@ include file="./format/header.jsp" %>
	<div class="musicimg">
	  
	<img style="float: left; height: 400px; position: absolute; top: 330px; left: 30px;" class="big" alt="" src="resources/img/music01.png"/>
	<img style="position: absolute; height: 150px; top:600px; left:220px; transform:rotate(20deg)" class="small" alt="" src="resources/img/music02.png"/> 
	<img style="position: absolute; height: 150px; widows: 250px; transform:rotate(-20deg); bottom: 120px; left: 1520px; padding: 0px; margin: 0px;' " src="resources/img/music03.png">
	
	</div>
	<h1>노래방</h1><h3>하고 싶은 노래 선택해 주세요~</h3>
	<table class="table" border="1">
		<col width="50"/>
		<col width="300"/>
		<col width="200"/>
		<thead>
		<tr>
			<th class="number">번호</th>
			<th>노래 제목</th>
			<th>가수</th>
			
		</tr>
		</thead>
		<tbody>
	<%
		for(int i=0;i<musiclist.size();i++){
	%>		
			<tr>
				<td class="number"><%=musiclist.get(i).getMusic_no() %></td>
				
				<td class="td01"><a class="musicname"><%=musiclist.get(i).getMusic_name() %></a></td>
				<td class="td01"><%=musiclist.get(i).getMusic_artist() %></td>
			</tr>
			
	<%		
		}
	%>
		</tbody>
		</table><br/>
			
				<button class="musicinsert" onclick="location.href='move.do?command=musicinsert'" >노래생성</button>
		
		
		
	
	<form action="move.do" method="post" class="search">
		<input type="hidden" name="command" value="musicsearch"/>
		<input type="text" name="music_name"/>
		<input type="submit" value="검색">
	</form>
	
	
	<div id="musicview">
		<audio controls="controls" id="player">
			<track src="" kind="attribute" srclang="kr" label="기본한국어" default id="subtitle"/>
		</audio>
		<p id="subtitleview"></p><br/>
		<button id="repeat">구간반복 OFF</button>
		<button id="start">시작</button>
		<button id="end">끝</button>
		<pre id="debug"></pre><br/>
		<button id="speeddown">속도감소</button>
		<button id="speednormal">정상속도</button>
		<button id="speedup">속도증가</button>
		
		<input type=checkbox id="chk-hear-mic"><label for="chk-hear-mic">마이크 소리 듣기</label>
    	<button id="record">녹음</button>
    	<button id="stop">정지</button>
    	<div id="sound-clips"></div>
    	
		<button onclick="closeWin()">노래 종료</button>
	</div>
	
<%@ include file="./format/footer.jsp" %>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.js"></script>
<script type="text/javascript">
	
	var player=document.getElementById("player");
	//설정 변수
	var setting = {
	  isSectionRepeatOn: false,
	  startTime: 0,
	  endTime: 0
	}
	var record = document.getElementById("record");
	var stop = document.getElementById("stop");
	var soundClips = document.getElementById("sound-clips");
	var chkHearMic = document.getElementById("chk-hear-mic");

	var audioCtx = new(window.AudioContext || window.webkitAudioContext)();// 오디오 컨텍스트 정의

	var analyser = audioCtx.createAnalyser();
	
	$(function(){
		//노래 이름 클릭 후 노래 실행
		$(".musicname").click(function(){
			document.body.style.background = "gray";
			document.getElementById("musicview").style.display = "block";
			var subtitleview=$("#subtitleview");
			var musicname=$(this).text();
			$("#player").attr("src","resources/audio/"+musicname+".mp3");
			$("#subtitle").attr("src","resources/vtt/"+musicname+".vtt");
			player.volume=0.1;
			player.play();
			player.addEventListener("timeupdate",function(){
		  	  	if(setting.isSectionRepeatOn && player.currentTime >= setting.endTime){
		  	  		player.currentTime = setting.startTime
		  	  		player.play()
		  	  	}
		  	}, false);
			$("audio")[0].textTracks[0].oncuechange=function(){
				var currentCue=this.activeCues[0].text;
				$("#subtitleview").html(currentCue);
			};
		});
	});
	//노래 종료
	function closeWin() {
		
		document.getElementById("musicview").style.display = "none";
		document.body.style.background = "white";
		player.pause();
		$("#subtitleview").html("");
	}
	//버튼 클릭 이벤트(시작)
  	$("#start").click(function(){
  		if(setting.endTime<=player.currentTime){
  			alert("시작 시간은 끝 시간보다 크거나 같으면 안됩니다.");
  		}else {
  		    setting.startTime = player.currentTime;
  		    // 구간반복 ON 상태에서 시작 버튼 클릭하면 구간반복이 OFF되도록 함 (UX 측면)
  		    if(setting.isSectionRepeatOn){
  		    	$("#repeat").click();
  		    }
  		}
  	});
  	//버튼 클릭 이벤트(끝)
  	$("#end").click(function(){
  		if(setting.StartTime >= player.currentTime){
  		    alert("끝 시간은 시작 시간보다 작거나 같으면 안됩니다.");
  		  } else {
  		    setting.endTime = player.currentTime;
  		    // 구간반복 OFF 상태에서 끝 버튼 클릭하면 구간반복이 ON되도록 함 (UX 측면)
  		    if(!setting.isSectionRepeatOn){
  		      repeat.click()
  		    }
  		}
  	});
  
  	$("#repeat").click(function(){
  	  setting.isSectionRepeatOn = !setting.isSectionRepeatOn
  	  if(setting.isSectionRepeatOn){
  		repeat.innerHTML = "구간반복 ON";
  		player.currentTime = setting.startTime
  		player.play()
  	  	} else {
  		repeat.innerHTML = "구간반복 OFF"
  		repeat.className = ""
  	  }
  	});
  	//재생중인 구간이 끝으로 설정한 곳보다 뒤에 있으면 시작지점으로 돌아간다.
  	
  	$("#speednormal").click(function(){
  		player.playbackRate=1.0;
	});
  	$("#speedup").click(function(){
  		player.playbackRate=player.playbackRate+0.1;
	});
  	$("#speeddown").click(function(){
  		player.playbackRate=player.playbackRate-0.1;
	});
  	function makeSound(stream) {
    	var source = audioCtx.createMediaStreamSource(stream);

    	source.connect(analyser);
    	analyser.connect(audioCtx.destination);

	}
	
	
	//녹음
	if (navigator.mediaDevices) {

    	var varraints = {audio: true};
    	let chunks = [];

    	navigator.mediaDevices.getUserMedia(varraints).then(function(stream) {	

            var mediaRecorder = new MediaRecorder(stream);
            
            chkHearMic.onchange = function(e) {
                if(e.target.checked == true) {
                    audioCtx.resume();
                    makeSound(stream);
                } else {
                    audioCtx.suspend();
                }
            }
            
            record.onclick = function() {
                mediaRecorder.start();
                console.log(mediaRecorder.state);
                console.log("recorder started");
                record.style.background = "red";
                record.style.color = "black";
            }

            stop.onclick = function() {
                mediaRecorder.stop();
                console.log(mediaRecorder.state);
                console.log("recorder stopped");
                record.style.background = "";
                record.style.color = "";
            }

            mediaRecorder.onstop = function(e) {

                var clipName = prompt("오디오 파일 제목을 입력하세요.", new Date());

                var clipContainer = document.createElement("article");
                var clipLabel = document.createElement("p");
                var audio = document.createElement("audio");
                var deleteButton = document.createElement("button");

                clipContainer.classList.add("clip");
                audio.setAttribute("controls", "");
                deleteButton.innerHTML = "삭제";
                clipLabel.innerHTML = clipName;

                clipContainer.appendChild(audio);
                clipContainer.appendChild(clipLabel);
                clipContainer.appendChild(deleteButton);
                soundClips.appendChild(clipContainer);

                audio.controls = true;
                var blob = new Blob(chunks, {"type": "audio/ogg codecs=opus"});
                chunks = [];
                var audioURL = URL.createObjectURL(blob);
                audio.src = audioURL;
                console.log("recorder stopped");

                deleteButton.onclick = function(e) {
                    evtTgt = e.target;
                    evtTgt.parentNode.parentNode.removeChild(evtTgt.parentNode);
                }
            }
            mediaRecorder.ondataavailable =function(e) {
                chunks.push(e.data);
            }
        }).catch(function(err) {
            console.log(err);
        })
	}
</script>

</body>
</html>