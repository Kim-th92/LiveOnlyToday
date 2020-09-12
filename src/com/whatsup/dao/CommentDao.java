package com.whatsup.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.whatsup.dto.CommentDto;

public class CommentDao extends SqlMapConfig {
	private String namespace="Commentmapper.";
	
	public List<CommentDto> selectFreeList(int free_no){
		SqlSession session=null;
		List<CommentDto> list=new ArrayList<CommentDto>();
		session=getSqlSessionFactory().openSession();
		list=session.selectList(namespace+"free_comment",free_no);
		
		session.close();
		return list;
		
	}
	public List<CommentDto> selectSongList(int song_no){
		SqlSession session=null;
		List<CommentDto> list=new ArrayList<CommentDto>();
		session=getSqlSessionFactory().openSession();
		list=session.selectList(namespace+"song_comment",song_no);
		
		session.close();
		return list;
		
	}
	public List<CommentDto> selectDanceList(int dacne_no){
		SqlSession session=null;
		List<CommentDto> list=new ArrayList<CommentDto>();
		session=getSqlSessionFactory().openSession();
		list=session.selectList(namespace+"dance_comment",dacne_no);
		
		session.close();
		return list;
		
	}
	public int insertFree(CommentDto dto) {
		SqlSession session=null;
		
		int res=0;
		session=getSqlSessionFactory().openSession();
		System.out.println("dao는 정상적으로 도착");
		res=session.insert(namespace+"free_comment_insert",dto);
		session.commit();
		session.close();
		
		
		return res;
	}
	public int insertSong(CommentDto dto) {
		SqlSession session=null;
		
		int res=0;
		session=getSqlSessionFactory().openSession();
		
		res=session.insert(namespace+"song_comment_insert",dto);
		session.commit();
		session.close();
		
		
		return res;
	}
	public int insertDance(CommentDto dto) {
		SqlSession session=null;
		
		int res=0;
		session=getSqlSessionFactory().openSession();
		
		res=session.insert(namespace+"dance_comment_insert",dto);
		session.commit();
		session.close();
		
		
		return res;
	}
	public int update(CommentDto dto) {
		SqlSession session=null;
		
		int res=0;
		session=getSqlSessionFactory().openSession();
		res=session.update(namespace+"update",dto);
		session.commit();
		session.close();
		
		
		return res;
		
	}
	
	public int delete(int comment_no) {
		SqlSession session=null;
		
		int res=0;
		session=getSqlSessionFactory().openSession();
		res=session.delete(namespace+"delete",comment_no);
		session.commit();
		session.close();
		
		
		return res;
	}
}
