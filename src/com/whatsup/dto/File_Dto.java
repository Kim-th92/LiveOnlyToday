package com.whatsup.dto;

public class File_Dto {

	private int file_no;
	private String file_rname;
	private String file_name;
	private int member_seq;
	
	public int getFile_no() {
		return file_no;
	}
	public void setFile_no(int file_no) {
		this.file_no = file_no;
	}
	public String getFile_rname() {
		return file_rname;
	}
	public void setFile_rname(String file_rname) {
		this.file_rname = file_rname;
	}
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	public int getMember_seq() {
		return member_seq;
	}
	public void setMember_seq(int member_seq) {
		this.member_seq = member_seq;
	}
	public File_Dto(int file_no, String file_rname, String file_name, int member_seq) {
		this.file_no = file_no;
		this.file_rname = file_rname;
		this.file_name = file_name;
		this.member_seq = member_seq;
	}
	@Override
	public String toString() {
		return "File_Dto [file_no=" + file_no + ", file_rname=" + file_rname + ", file_name=" + file_name
				+ ", member_seq=" + member_seq + "]";
	}
	
	
	
	
	
}
