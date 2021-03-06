package com.whatsup.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.whatsup.dto.Free_BoardDto;

public class Free_BoardDao extends SqlMapConfig {
	private String namespace="Free_Boardmapper.";

	public List<Free_BoardDto> selectList(int startWrite,int endWrite){
		SqlSession session=null;
		List<Free_BoardDto> list=new ArrayList<Free_BoardDto>();
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("startWrite",startWrite);
		params.put("endWrite",endWrite);
		
		session=getSqlSessionFactory().openSession();
		list=session.selectList(namespace+"selectListPage",params);
		session.close();
		return list;
	}
	public Free_BoardDto selectOne(int free_no) {
		SqlSession session=null;
		
		Free_BoardDto dto=null;
		session=getSqlSessionFactory().openSession(true);
		dto=session.selectOne(namespace+"selectOne",free_no);
		session.close();
		return dto;
	}
	public int insert(Free_BoardDto dto) {
		SqlSession session=null;
		
		int res=0;
		session=getSqlSessionFactory().openSession();
		
		res=session.insert(namespace+"insert",dto);
		session.commit();
		session.close();
		
		
		return res;
	}
	public int update(Free_BoardDto dto) {
		SqlSession session=null;
		
		int res=0;
		session=getSqlSessionFactory().openSession();
		res=session.update(namespace+"update",dto);
		session.commit();
		session.close();
		
		
		return res;
		
	}
	
	public int delete(int free_no) {
		SqlSession session=null;
		
		int res=0;
		session=getSqlSessionFactory().openSession();
		res=session.delete(namespace+"delete",free_no);
		session.commit();
		session.close();
		
		
		return res;
	}
	public int freeview(int free_no) {
		SqlSession session=null;
		
		int res=0;
		session=getSqlSessionFactory().openSession();
		System.out.println("dao freeno="+free_no);
		res=session.update(namespace+"view",free_no);
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
