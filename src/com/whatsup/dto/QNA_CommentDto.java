package com.whatsup.dto;

import java.sql.Timestamp;

public class QNA_CommentDto {
	private int qna_comment_no;
	private Timestamp qna_comment_regdate;
	private String qna_comment_content;
	private int member_seq;
	private int qna_no;
	private String nickname;
	
	public QNA_CommentDto() {
		
	}

	public int getQna_comment_no() {
		return qna_comment_no;
	}

	public void setQna_comment_no(int qna_comment_no) {
		this.qna_comment_no = qna_comment_no;
	}

	public Timestamp getQna_comment_regdate() {
		return qna_comment_regdate;
	}

	public void setQna_comment_regdate(Timestamp qna_comment_regdate) {
		this.qna_comment_regdate = qna_comment_regdate;
	}

	public String getQna_comment_content() {
		return qna_comment_content;
	}

	public void setQna_comment_content(String qna_comment_content) {
		this.qna_comment_content = qna_comment_content;
	}

	public int getMember_seq() {
		return member_seq;
	}

	public void setMember_seq(int member_seq) {
		this.member_seq = member_seq;
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

	@Override
	public String toString() {
		return "QNA_CommentDto [qna_comment_no=" + qna_comment_no + ", qna_comment_regdate=" + qna_comment_regdate
				+ ", qna_comment_content=" + qna_comment_content + ", member_seq=" + member_seq + ", qna_no=" + qna_no
				+ ", nickname=" + nickname + "]";
	}
	
	
	
}