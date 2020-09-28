package com.whatsup.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.whatsup.dto.Song_BoardDto;

public class Song_BoardDao extends SqlMapConfig{
private String namespace="Song_Boardmapper.";
	
	public List<Song_BoardDto> selectList(int startWrite,int endWrite){
		SqlSession session=null;
		List<Song_BoardDto> list=new ArrayList<Song_BoardDto>();
		session=getSqlSessionFactory().openSession();
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("startWrite",startWrite);
		params.put("endWrite",endWrite);
		
		list=session.selectList(namespace+"selectListPage",params);
		session.close();
		return list;
		
	}
	public Song_BoardDto selectOne(int song_no) {
		SqlSession session=null;
		
		Song_BoardDto dto=null;
		session=getSqlSessionFactory().openSession(true);
		dto=session.selectOne(namespace+"selectOne",song_no);
		session.close();
		return dto;
	}
	public int insert(Song_BoardDto dto) {
		SqlSession session=null;
		
		int res=0;
		session=getSqlSessionFactory().openSession();
		
		res=session.insert(namespace+"insert",dto);
		session.commit();
		session.close();
		
		
		return res;
	}
	public int update(Song_BoardDto dto) {
		SqlSession session=null;
		
		int res=0;
		session=getSqlSessionFactory().openSession();
		res=session.update(namespace+"update",dto);
		session.commit();
		session.close();
		
		
		return res;
		
	}
	
	public int delete(int song_no) {
		SqlSession session=null;
		
		int res=0;
		session=getSqlSessionFactory().openSession();
		res=session.delete(namespace+"delete",song_no);
		session.commit();
		session.close();
		
		
		return res;
	}
	public int songview(int song_no) {
		SqlSession session=null;
		
		int res=0;
		session=getSqlSessionFactory().openSession();
		System.out.println("dao songno="+song_no);
		res=session.update(namespace+"view",song_no);
		session.commit();
		session.close();
		
		return res;
	}
	
	public int totalCount() {
		SqlSession session = null;
		int totalcount = 0;
	
		session = getSqlSessionFactory().openSession();
		totalcount = session.selectOne(namespace+"totalcount");
	
		return totalcount;
	}
}
