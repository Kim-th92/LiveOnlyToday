<<<<<<< HEAD
<%@page import="java.util.List"%>
<%@page import="com.whatsup.dto.MusicListDto"%>
=======
>>>>>>> 517e2356f4db51400aa28cd54d16cc5a4778984e
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<<<<<<< HEAD
<%
	List<MusicListDto> musiclist=(List<MusicListDto>)request.getAttribute("musiclist");
%>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.js"></script>
<script type="text/javascript">
   	
	$(function(){
		$(".musicname").click(function(){
			document.body.style.background = "gray";
			document.getElementById("musicview").style.display = "block";
			var subtitleview=$("#subtitleview");
			var musicname=$(this).text();
			$("#music").attr("src","resources/audio/"+musicname+".mp3");
			$("#subtitle").attr("src","resources/vtt/"+musicname+".vtt");
			$("audio")[0].textTracks[0].oncuechange=function(){
				var currentCue=this.activeCues[0].text;
				$("#subtitleview").html(currentCue);
			};
		});
	});

	function closeWin() {
		
		document.getElementById("musicview").style.display = "none";
		document.body.style.background = "white";
		music.pause();
		$("#subtitleview").html("");
	}
</script>
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
	<h1>노래방</h1><h3>하고 싶은 노래 선택해 주세요~</h3>
	<table  border="1">
		<col width="50"/>
		<col width="300"/>
		<col width="200"/>
		<tr>
			<th>번호</th>
			<th>노래 제목</th>
			<th>가수</th>
			
		</tr>
	<%
		for(int i=0;i<musiclist.size();i++){
	%>		
			<tr>
				<td><%=musiclist.get(i).getMusic_no() %></td>
				
				<td><a class="musicname"><%=musiclist.get(i).getMusic_name() %></a></td>
				<td><%=musiclist.get(i).getMusic_artist() %></td>
			</tr>
			
	<%		
		}
	%>
		<tr>
			<td colspan="3">
				<input type="button" onclick="location.href='move.do?command=musicinsert'">
			</td>
		</tr>
	</table>
	<div id="musicview">
		<audio controls="controls" id="music">
			<track src="" kind="attribute" srclang="kr" label="기본한국어" default id="subtitle"/>
		</audio>
		<p id="subtitleview"></p><br/>
		<input type=checkbox id="chk-hear-mic"><label for="chk-hear-mic">마이크 소리 듣기</label>
    	<button id="record">녹음</button>
    	<button id="stop">정지</button>
    	<div id="sound-clips"></div>
		<button onclick="closeWin()">노래 종료</button>
	</div>
	
<%@ include file="./format/footer.jsp" %>
<script>
	var record = document.getElementById("record");
	var stop = document.getElementById("stop");
	var soundClips = document.getElementById("sound-clips");
	var chkHearMic = document.getElementById("chk-hear-mic");

	var audioCtx = new(window.AudioContext || window.webkitAudioContext)();// 오디오 컨텍스트 정의

	var analyser = audioCtx.createAnalyser();

	function makeSound(stream) {
    	var source = audioCtx.createMediaStreamSource(stream);

    	source.connect(analyser);
    	analyser.connect(audioCtx.destination);

	}

	if (navigator.mediaDevices) {
    	console.log("getUserMedia supported.")

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
=======

<script type="text/javascript">

</script>
</head>
<body>
	<div>
		<video src="">
			
		</video>
	</div>
>>>>>>> 517e2356f4db51400aa28cd54d16cc5a4778984e
</body>
</html>