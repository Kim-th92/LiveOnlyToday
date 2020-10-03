package com.whatsup.dto;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.Timestamp;

public class Dance_BoardDto {
	private int dance_no;
	private String dance_title;
	private String dance_content;
	private Timestamp dance_regdate;
	private int dance_cnt;
	private int member_seq;
	private String nickname;
	private String dancefname;
	private String dancerealfname;
	private String dancerealpath;
	
	
	public String getDancefname() {
		return dancefname;
	}
	public void setDancefname(String dancefname) {
		this.dancefname = dancefname;
		
			
		

	}
	public String getDancerealfname() {
		return dancerealfname;
	}
	public void setDancerealfname(String dancerealfname) {
		this.dancerealfname = dancerealfname;
	
			
	}
	public String getDancerealpath() {
		return dancerealpath;
	}
	public void setDancerealpath(String dancerealpath) {
		this.dancerealpath = dancerealpath;
	}
	public Dance_BoardDto(int member_seq,String dance_title, String dance_content) {
		this.dance_title = dance_title;
		this.dance_content = dance_content;
		this.member_seq = member_seq;
	}
	public Dance_BoardDto(String dance_title, String dance_content) {
		this.dance_title = dance_title;
		this.dance_content = dance_content;
	}
	public Dance_BoardDto(int dance_no, String dance_title, String dance_content, Timestamp dance_regdate,
			int dance_cnt, int member_seq) {
		this.dance_no = dance_no;
		this.dance_title = dance_title;
		this.dance_content = dance_content;
		this.dance_regdate = dance_regdate;
		this.dance_cnt = dance_cnt;
		this.member_seq = member_seq;
	}
	public Dance_BoardDto(int dance_no, String dance_title, String dance_content, Timestamp dance_regdate,
			int dance_cnt, int member_seq, String nickname, String dancefname, String dancerealfname,
			String dancerealpath) {
		super();
		this.dance_no = dance_no;
		this.dance_title = dance_title;
		this.dance_content = dance_content;
		this.dance_regdate = dance_regdate;
		this.dance_cnt = dance_cnt;
		this.member_seq = member_seq;
		this.nickname = nickname;
		this.dancefname = dancefname;
		this.dancerealfname = dancerealfname;
		this.dancerealpath = dancerealpath;
	}
	@Override
	public String toString() {
		return "Dance_BoardDto [dance_no=" + dance_no + ", dance_title=" + dance_title + ", dance_content="
				+ dance_content + ", dance_regdate=" + dance_regdate + ", dance_cnt=" + dance_cnt + ", member_seq="
				+ member_seq + ", nickname=" + nickname + ", dancefname=" + dancefname + ", dancerealfname="
				+ dancerealfname + ", dancerealpath=" + dancerealpath + "]";
	}
	
	public Dance_BoardDto() {
	}
	public int getDance_no() {
		return dance_no;
	}
	public void setDance_no(int dance_no) {
		this.dance_no = dance_no;
	}
	public String getDance_title() {
		return dance_title;
	}
	public void setDance_title(String dance_title) {
		this.dance_title = dance_title;
	}
	public String getDance_content() {
		return dance_content;
	}
	public void setDance_content(String dance_content) {
		this.dance_content = dance_content;
	}
	public Timestamp getDance_regdate() {
		return dance_regdate;
	}
	public void setDance_regdate(Timestamp dance_regdate) {
		this.dance_regdate = dance_regdate;
	}
	public int getDance_cnt() {
		return dance_cnt;
	}
	public void setDance_cnt(int dance_cnt) {
		this.dance_cnt = dance_cnt;
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
