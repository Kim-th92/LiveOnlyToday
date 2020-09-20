package com.whatsup.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.whatsup.dto.MusicListDto;

public class MusicListDao extends SqlMapConfig{
	private String namespace="Musiclistmapper.";
	
	public List<MusicListDto> selectMusicList(){
		SqlSession session=null;
		List<MusicListDto> list=new ArrayList<MusicListDto>();
		session=getSqlSessionFactory().openSession();
		list=session.selectList(namespace+"selectList");
		session.close();
		return list;
	}
	public List<MusicListDto> musicSerach(String music_name){
		SqlSession session=null;
		List<MusicListDto> list=new ArrayList<MusicListDto>();
		session=getSqlSessionFactory().openSession();
		list=session.selectList(namespace+"musicsearch","%"+music_name+"%");
		session.close();
		return list;
	}
}
