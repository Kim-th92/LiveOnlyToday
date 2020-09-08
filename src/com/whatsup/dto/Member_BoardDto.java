package com.whatsup.dto;

public class Member_BoardDto {
	private int member_seq;
	private String id;
	private String pw;
	private String name;
	private String nickname;
	private String grade;
	private String email;
	private String birthday;
	private String phone;
	private String addr;
	private String membership;
	private String delflag;
	
	
	
	public Member_BoardDto() {
	}
	public Member_BoardDto(int member_seq, String id, String pw, String name, String nickname, String grade,
			String email, String birthday, String phone, String addr, String membership, String delflag) {
		super();
		this.member_seq = member_seq;
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.nickname = nickname;
		this.grade = grade;
		this.email = email;
		this.birthday = birthday;
		this.phone = phone;
		this.addr = addr;
		this.membership = membership;
		this.delflag = delflag;
	}
	public int getMember_seq() {
		return member_seq;
	}
	public void setMember_seq(int member_seq) {
		this.member_seq = member_seq;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getMembership() {
		return membership;
	}
	public void setMembership(String membership) {
		this.membership = membership;
	}
	public String getDelflag() {
		return delflag;
	}
	public void setDelflag(String delflag) {
		this.delflag = delflag;
	}
	
	
}
