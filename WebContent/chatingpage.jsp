<%@page import="com.whatsup.dto.Member_BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	Member_BoardDto member_dto=(Member_BoardDto)session.getAttribute("login");
%>
<script src="http://code.jquery.com/jquery-1.11.3.js"></script>
<script type="text/javascript">
	var textarea=document.getElementById("messageWindow");
	var webSocket=new WebSocket("ws://localhost:8787/semi_project03/broadcasting");
	var inputMessage=document.getElementById("inputMessage");
	webSocket.onerror=function(event){
		onError(event)
	};
	webSocket.onopen=function(event){
		onOpen(event)
	};
	webSocket.onmessage=function(event){
		onMessage(event)
	};
	function onMessage(event) {
        var message = event.data.split("|");
        var sender = message[0];
        var content = message[1];
        if (content == "") {
        } else {
            if (content.match("/")) {
                if (content.match(("/" + $("#chat_id").val()))) {
                    var temp = content.replace("/" + $("#chat_id").val(), "(귓속말) :").split(":");
                    if (temp[1].trim() == "") {
                    } else {
                        $("#messageWindow").html($("#messageWindow").html() + "<p class='whisper'>"
                            + sender + content.replace("/" + $("#chat_id").val(), "(귓속말) :") + "</p>");
                    }
                } else {
                }
            } else {
                if (content.match("!")) {
                    $("#messageWindow").html($("#messageWindow").html()
                        + "<p class='chat_content'><b class='impress'>" + sender + " : " + content + "</b></p>");
                } else {
                    $("#messageWindow").html($("#messageWindow").html()
                        + "<p class='chat_content'>" + sender + " : " + content + "</p>");
                }
            }
        }
    }
    function onOpen(event) {
        $("#messageWindow").html("<p class='chat_content'>채팅에 참여하였습니다.</p>");
        webSocket.send(sender+"님이 채팅에 참여하였습니다.");
    }
    function onError(event) {
        alert(event.data);
    }
    function send() {
    	var inputMessage=document.getElementById("inputMessage");
        if (inputMessage.value == "") {
        } else {
            $("#messageWindow").html($("#messageWindow").html()
                + "<p class='chat_content' id='mymsg'><%=member_dto.getNickname()%> : " + inputMessage.value + "</p>");
        }
        webSocket.send($("#chat_id").val() + "|" + inputMessage.value);
        inputMessage.value = "";
    }
    //엔터키를 통해 send함
    function enterkey() {
        if (window.event.keyCode == 13) {
            send();
        }
    }
    //채팅이 많아져 스크롤바가 넘어가더라도 자동적으로 스크롤바가 내려가게함
    window.setInterval(function() {
        var elem = document.getElementById('messageWindow');
        elem.scrollTop = elem.scrollHeight;
    }, 0);
	
	
</script>
<style type="text/css">
	#mymsg{
		color: blue;
	}
	p{
	}
</style>
</head>
<body>
	<input type="hidden" value='<%=member_dto.getNickname()%>' id='chat_id' />
	<div id="_chatbox">
		<fieldset>
			<div id="messageWindow"></div><br/>
			<input id="inputMessage" type="text" onkeyup="enterkey()" value=""/>
			<input type="submit" value="send" onclick="send()"/>
		</fieldset>
	</div>
</body>
</html>