package com.whatsup.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.whatsup.dto.Free_BoardDto;
import com.whatsup.dto.Stream_BoardDto;

public class Stream_BoardDao extends SqlMapConfig{
	private String namespace="Stream_Boardmapper.";
	
	public List<Stream_BoardDto> selectList(){
		SqlSession session=null;
		List<Stream_BoardDto> list=new ArrayList<Stream_BoardDto>();
		session=getSqlSessionFactory().openSession();
		list=session.selectList(namespace+"selectList");
		session.close();
		
		return list;
	}
	public int insert(Stream_BoardDto stream_dto) {
		SqlSession session=null;
		
		int res=0;
		session=getSqlSessionFactory().openSession();
		
		res=session.insert(namespace+"insert",stream_dto);
		session.commit();
		session.close();
		
		
		return res;
	}
	public int delete(int stream_no) {
		SqlSession session=null;
		
		int res=0;
		session=getSqlSessionFactory().openSession();
		res=session.delete(namespace+"delete",stream_no);
		session.commit();
		session.close();
		
		
		return res;
	}
}
