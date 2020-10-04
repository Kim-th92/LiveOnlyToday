package com.whatsup.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.whatsup.dto.ChatingListDto;
import com.whatsup.dto.CommentDto;

public class ChatingListDao extends SqlMapConfig {
	private String namespace="Chatinglistmapper.";
	
	public List<ChatingListDto> selectChatingList(){
		SqlSession session=null;
		List<ChatingListDto> list=new ArrayList<ChatingListDto>();
		session=getSqlSessionFactory().openSession();
		list=session.selectList(namespace+"selectList");
		
		session.close();
		return list;
	}
	public int insert(ChatingListDto dto) {
		SqlSession session=null;
		
		int res=0;
		session=getSqlSessionFactory().openSession();
		res=session.insert(namespace+"insert",dto);
		session.commit();
		session.close();
		
		
		return res;
	}
	public int delete(int chating_no) {
		SqlSession session=null;
		
		int res=0;
		session=getSqlSessionFactory().openSession();
		res=session.delete(namespace+"delete",chating_no);
		session.commit();
		session.close();
		
		
		return res;
	}
}
