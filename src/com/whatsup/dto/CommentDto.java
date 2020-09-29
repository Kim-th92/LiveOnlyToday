package com.whatsup.dto;

import java.sql.Timestamp;

public class CommentDto {
	private int comment_no;
	private Timestamp comment_regdate;
	private String comment_content;
	private int member_seq;
	private int dance_no;
	private int free_no;
	private int song_no;
	private int qna_no;
	private String nickname;
	
	public CommentDto() {
		
	}
	
	public String getComment_content() {
		return comment_content;
	}

	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}

	public int getComment_no() {
		return comment_no;
	}
	public void setComment_no(int comment_no) {
		this.comment_no = comment_no;
	}
	public Timestamp getComment_regdate() {
		return comment_regdate;
	}
	public void setComment_regdate(Timestamp comment_regdate) {
		this.comment_regdate = comment_regdate;
	}
	public int getMember_seq() {
		return member_seq;
	}
	public void setMember_seq(int member_seq) {
		this.member_seq = member_seq;
	}
	public int getDance_no() {
		return dance_no;
	}
	public void setDance_no(int dance_no) {
		this.dance_no = dance_no;
	}
	public int getFree_no() {
		return free_no;
	}
	public void setFree_no(int free_no) {
		this.free_no = free_no;
	}
	public int getSong_no() {
		return song_no;
	}
	public void setSong_no(int song_no) {
		this.song_no = song_no;
	}
	public int getQna_no() {
		return qna_no;
	}
	public void setQna_no(int qna_no) {
		this.qna_no = qna_no;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	
	
	
}
