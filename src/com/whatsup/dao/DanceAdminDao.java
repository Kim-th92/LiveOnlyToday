package com.whatsup.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.whatsup.dto.DanceAdminDto;
import com.whatsup.dto.Free_BoardDto;

public class DanceAdminDao extends SqlMapConfig {

	private String namespace="DanceAdminmapper.";
	SqlSession session=null;
	
	//춤 따라추기 업로드
	public int insertVideo(DanceAdminDto dto) {
		int res=0;
		session=getSqlSessionFactory().openSession();
		
		res=session.insert(namespace+"insert",dto);
		session.commit();
		session.close();
		
		
		return  0;
	}
	//춤 따라추기 리스트
	public List<DanceAdminDto> selectList(){
		
		List<DanceAdminDto> list=new ArrayList<DanceAdminDto>();
		session=getSqlSessionFactory().openSession();
		list=session.selectList(namespace+"selectList");
		session.close();
		
		return list;
	}
	
	//춤 따라추기 select one
	
	public DanceAdminDto selectOne(int danceadmin_seq) {
		DanceAdminDto dto = new DanceAdminDto();
		session =getSqlSessionFactory().openSession();
		dto = session.selectOne(namespace+"selectOne", danceadmin_seq);
		session.close();
		
		return dto;
	}
	
}
