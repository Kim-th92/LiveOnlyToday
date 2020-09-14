package com.whatsup.dto;

import java.sql.Timestamp;

public class Song_BoardDto {
	private int song_no;
	private String song_title;
	private String song_content;
	private Timestamp song_regdate;
	private int song_cnt;
	private int member_seq;
	private String nickname;
	
	public Song_BoardDto() {
		
	}
	
	public Song_BoardDto(int member_seq,String song_title, String song_content) {
		this.song_title = song_title;
		this.song_content = song_content;
		this.member_seq = member_seq;
	}

	public Song_BoardDto(int song_no, String song_title, String song_content, Timestamp song_regdate, int song_cnt,
			int member_seq) {
		this.song_no = song_no;
		this.song_title = song_title;
		this.song_content = song_content;
		this.song_regdate = song_regdate;
		this.song_cnt = song_cnt;
		this.member_seq = member_seq;
	}
	public Song_BoardDto(String song_title, String song_content) {
		this.song_title = song_title;
		this.song_content = song_content;
	}
	public int getSong_no() {
		return song_no;
	}
	public void setSong_no(int song_no) {
		this.song_no = song_no;
	}
	public String getSong_title() {
		return song_title;
	}
	public void setSong_title(String song_title) {
		this.song_title = song_title;
	}
	public String getSong_content() {
		return song_content;
	}
	public void setSong_content(String song_content) {
		this.song_content = song_content;
	}
	public Timestamp getSong_regdate() {
		return song_regdate;
	}
	public void setSong_regdate(Timestamp song_regdate) {
		this.song_regdate = song_regdate;
	}
	public int getSong_cnt() {
		return song_cnt;
	}
	public void setSong_cnt(int song_cnt) {
		this.song_cnt = song_cnt;
	}
	public int getMember_seq() {
		return member_seq;
	}
	public void setMember_seq(int member_seq) {
		this.member_seq = member_seq;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	
}
