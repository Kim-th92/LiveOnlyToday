package com.whatsup.dto;

public class Stream_BoardDto {
	private int stream_no;
	private String stream_title;
	private int member_seq;
	private String nickname;
	
	public Stream_BoardDto() {
		
	}
	
	
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public int getStream_no() {
		return stream_no;
	}
	public void setStream_no(int stream_no) {
		this.stream_no = stream_no;
	}
	public String getStream_title() {
		return stream_title;
	}
	public void setStream_title(String stream_title) {
		this.stream_title = stream_title;
	}
	public int getMember_seq() {
		return member_seq;
	}
	public void setMember_seq(int member_seq) {
		this.member_seq = member_seq;
	}
}
