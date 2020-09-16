package com.whatsup.dto;

public class MusicListDto {
	private int	music_no;
	private String music_name;
	private String music_artist;
	
	
	
	public MusicListDto() {
	}
	public MusicListDto(int music_no, String music_name, String music_artist) {
		this.music_no = music_no;
		this.music_name = music_name;
		this.music_artist = music_artist;
	}
	public int getMusic_no() {
		return music_no;
	}
	public void setMusic_no(int music_no) {
		this.music_no = music_no;
	}
	public String getMusic_name() {
		return music_name;
	}
	public void setMusic_name(String music_name) {
		this.music_name = music_name;
	}
	public String getMusic_artist() {
		return music_artist;
	}
	public void setMusic_artist(String music_artist) {
		this.music_artist = music_artist;
	}
	
}
