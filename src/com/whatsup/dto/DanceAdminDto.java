package com.whatsup.dto;

public class DanceAdminDto {
	private int danceadmin_seq;
	private String danceadmintitle;
	private String danceadminsrc;
	private String dancecontent;
	
	public String getDancecontent() {
		return dancecontent;
	}
	public void setDancecontent(String dancecontent) {
		this.dancecontent = dancecontent;
	}
	public int getDanceadmin_seq() {
		return danceadmin_seq;
	}
	public void setDanceadmin_seq(int danceadmin_seq) {
		this.danceadmin_seq = danceadmin_seq;
	}
	public String getDanceadmintitle() {
		return danceadmintitle;
	}
	public void setDanceadmintitle(String danceadmintitle) {
		this.danceadmintitle = danceadmintitle;
	}
	public String getDanceadminsrc() {
		return danceadminsrc;
	}
	public void setDanceadminsrc(String danceadminsrc) {
		this.danceadminsrc = danceadminsrc;
	}
	@Override
	public String toString() {
		return "DanceAdminDto [danceadmin_seq=" + danceadmin_seq + ", danceadmintitle=" + danceadmintitle
				+ ", danceadminsrc=" + danceadminsrc + ", dancecontent=" + dancecontent + "]";
	}

	public DanceAdminDto(int danceadmin_seq, String danceadmintitle, String danceadminsrc, String dancecontent) {
		this.danceadmin_seq = danceadmin_seq;
		this.danceadmintitle = danceadmintitle;
		this.danceadminsrc = danceadminsrc;
		this.dancecontent = dancecontent;
	}
	public DanceAdminDto() {
		super();
	}
}
