package com.whatsup.dto;

import java.sql.Timestamp;

public class Free_BoardDto {
	private int free_no;
	private String nickname;
	private String free_title;
	private String free_content;
	private Timestamp free_regdate;
	private int free_cnt;
	private int member_seq;
	
	
	
	
	public Free_BoardDto() {
	
	}
	public Free_BoardDto(int member_seq, String free_title, String free_content) {
		this.member_seq = member_seq;
		this.free_title = free_title;
		this.free_content = free_content;
	}
	
	


	public Free_BoardDto(String free_title, String free_content) {
		this.free_title = free_title;
		this.free_content = free_content;
	}
	public String getNickname() {
		return nickname;
	}


	public void setNickname(String nickname) {
		this.nickname = nickname;
	}


	
	public int getFree_no() {
		return free_no;
	}
	public void setFree_no(int free_no) {
		this.free_no = free_no;
	}
	public String getFree_title() {
		return free_title;
	}
	public void setFree_title(String free_title) {
		this.free_title = free_title;
	}
	public String getFree_content() {
		return free_content;
	}
	public void setFree_content(String free_content) {
		this.free_content = free_content;
	}
	public Timestamp getFree_regdate() {
		return free_regdate;
	}
	public void setFree_regdate(Timestamp free_regdate) {
		this.free_regdate = free_regdate;
	}
	public int getFree_cnt() {
		return free_cnt;
	}
	public void setFree_cnt(int free_cnt) {
		this.free_cnt = free_cnt;
	}
	public int getMember_seq() {
		return member_seq;
	}
	public void setMember_seq(int member_seq) {
		this.member_seq = member_seq;
	}
	
	
	
}
