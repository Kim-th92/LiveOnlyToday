package com.whatsup.dto;

public class ChatingListDto {
	private int chating_no;
	private String chating_name;
	private String chating_creator;
	
	
	public ChatingListDto() {
	}
	public ChatingListDto(int chating_no, String chating_name, String chating_creator) {
		this.chating_no = chating_no;
		this.chating_name = chating_name;
		this.chating_creator = chating_creator;
	}
	public int getChating_no() {
		return chating_no;
	}
	public void setChating_no(int chating_no) {
		this.chating_no = chating_no;
	}
	public String getChating_name() {
		return chating_name;
	}
	public void setChating_name(String chating_name) {
		this.chating_name = chating_name;
	}
	public String getChating_creator() {
		return chating_creator;
	}
	public void setChating_creator(String chating_creator) {
		this.chating_creator = chating_creator;
	}
	
	
}
