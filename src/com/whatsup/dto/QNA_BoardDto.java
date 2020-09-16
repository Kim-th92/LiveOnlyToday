package com.whatsup.dto;

import java.sql.Timestamp;

public class QNA_BoardDto {
	private int qna_no;
	private String nickname;
	private String qna_title;
	private String qna_content;
	private Timestamp qna_regdate;
	private String qna_answer;
	private int member_seq;
	
	
	
	public QNA_BoardDto() {
		
	}
	
	
	public QNA_BoardDto(int member_seq, String qna_title, String qna_content) {
		this.member_seq = member_seq;
		this.qna_title = qna_title;
		this.qna_content = qna_content;
	}
	public  QNA_BoardDto(String qna_title, String qna_content) {
		this.qna_title = qna_title;
		this.qna_content = qna_content;
	}
	
	public QNA_BoardDto(int qna_no, String qna_title, String qna_content, Timestamp qna_regdate,
			String qna_answer, int member_seq) {
		this.qna_no = qna_no;
		this.qna_title = qna_title;
		this.qna_content = qna_content;
		this.qna_regdate = qna_regdate;
		this.qna_answer = qna_answer;
		this.member_seq = member_seq;
	}
	
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public int getQna_no() {
		return qna_no;
	}
	public void setQna_no(int qna_no) {
		this.qna_no = qna_no;
	}
	public String getQna_title() {
		return qna_title;
	}
	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}
	public String getQna_content() {
		return qna_content;
	}
	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}
	public Timestamp getQna_regdate() {
		return qna_regdate;
	}
	public void setQna_regdate(Timestamp qna_regdate) {
		this.qna_regdate = qna_regdate;
	}
	public String getQna_answer() {
		return qna_answer;
	}
	public void setQna_answer(String qna_answer) {
		this.qna_answer = qna_answer;
	}
	public int getMember_seq() {
		return member_seq;
	}
	public void setMember_seq(int member_seq) {
		this.member_seq = member_seq;
	}
	
	
}
