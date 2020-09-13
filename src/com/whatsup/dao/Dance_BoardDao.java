package com.whatsup.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.whatsup.dto.Dance_BoardDto;

public class Dance_BoardDao extends SqlMapConfig{
private String namespace="Dance_Boardmapper.";
	
	public List<Dance_BoardDto> selectList(){
		SqlSession session=null;
		List<Dance_BoardDto> list=new ArrayList<Dance_BoardDto>();
		session=getSqlSessionFactory().openSession();
		list=session.selectList(namespace+"selectList");
		session.close();
		return list;
		
	}
	public Dance_BoardDto selectOne(int dance_no) {
		SqlSession session=null;
		
		Dance_BoardDto dto=null;
		session=getSqlSessionFactory().openSession(true);
		dto=session.selectOne(namespace+"selectOne",dance_no);
		session.close();
		return dto;
	}
	public int insert(Dance_BoardDto dto) {
		SqlSession session=null;
		
		int res=0;
		session=getSqlSessionFactory().openSession();
		
		res=session.insert(namespace+"insert",dto);
		session.commit();
		session.close();
		
		
		return res;
	}
	public int update(Dance_BoardDto dto) {
		SqlSession session=null;
		
		int res=0;
		session=getSqlSessionFactory().openSession();
		res=session.update(namespace+"update",dto);
		session.commit();
		session.close();
		
		
		return res;
		
	}
	
	public int delete(int dance_no) {
		SqlSession session=null;
		
		int res=0;
		session=getSqlSessionFactory().openSession();
		res=session.delete(namespace+"delete",dance_no);
		session.commit();
		session.close();
		
		
		return res;
	}
	public int danceview(int dance_no) {
		SqlSession session=null;
		
		int res=0;
		session=getSqlSessionFactory().openSession();
		System.out.println("dao danceno="+dance_no);
		res=session.update(namespace+"view",dance_no);
		session.commit();
		session.close();
		
		return res;
	}
}
