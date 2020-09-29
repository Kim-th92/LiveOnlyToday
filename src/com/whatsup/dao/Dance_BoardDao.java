package com.whatsup.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.whatsup.dto.Dance_BoardDto;

public class Dance_BoardDao extends SqlMapConfig{
private String namespace="Dance_Boardmapper.";
	
	public List<Dance_BoardDto> selectList(int startWrite,int endWrite){
		SqlSession session=null;
		List<Dance_BoardDto> list=new ArrayList<Dance_BoardDto>();
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("startWrite",startWrite);
		params.put("endWrite",endWrite);
		
		session=getSqlSessionFactory().openSession();
		list=session.selectList(namespace+"selectListPage",params);
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
	
	//같은이름의 파일이 있는지 확인하기 위한 메서드
	public Dance_BoardDto selectFile(String filename) {
		SqlSession session = null;
		session=getSqlSessionFactory().openSession();
		Dance_BoardDto dto = session.selectOne(namespace+"selectFile",filename);
		session.close();
		
		return dto;
	}
	
	//파일이 첨부한 글 업로드
	public int insertFile(Dance_BoardDto dto) {
		SqlSession session =null;
		session = getSqlSessionFactory().openSession(true);
		int res = session.insert(namespace+"insertFile", dto);
		System.out.println(dto);
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
