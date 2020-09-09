package com.whatsup.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.whatsup.dto.Free_BoardDto;

public class Free_BoardDao extends SqlMapConfig {
	private String namespace="Free_Boardmapper.";
	
	public List<Free_BoardDto> selectList(){
		SqlSession session=null;
		List<Free_BoardDto> list=new ArrayList<Free_BoardDto>();
		session=getSqlSessionFactory().openSession();
		list=session.selectList(namespace+"selectList");
		session.close();
		return list;
		
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
}
