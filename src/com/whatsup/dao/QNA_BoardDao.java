package com.whatsup.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.whatsup.dto.QNA_BoardDto;

public class QNA_BoardDao extends SqlMapConfig{
private String namespace="QNA_Boardmapper.";
	
	public List<QNA_BoardDto> selectList(){
		SqlSession session=null;
		List<QNA_BoardDto> list=new ArrayList<QNA_BoardDto>();
		session=getSqlSessionFactory().openSession();
		list=session.selectList(namespace+"selectList");
		session.close();
		return list;
		
	}
	public QNA_BoardDto selectOne(int qna_no) {
		SqlSession session=null;
		
		QNA_BoardDto dto=null;
		session=getSqlSessionFactory().openSession(true);
		dto=session.selectOne(namespace+"selectOne",qna_no);
		session.close();
		return dto;
	}
	public int insert(QNA_BoardDto dto) {
		SqlSession session=null;
		
		int res=0;
		session=getSqlSessionFactory().openSession();
		
		res=session.insert(namespace+"insert",dto);
		session.commit();
		session.close();
		
		
		return res;
	}
	public int update(QNA_BoardDto dto) {
		SqlSession session=null;
		
		int res=0;
		session=getSqlSessionFactory().openSession();
		res=session.update(namespace+"update",dto);
		session.commit();
		session.close();
		
		
		return res;
		
	}
	
	public int delete(int qna_no) {
		SqlSession session=null;
		
		int res=0;
		session=getSqlSessionFactory().openSession();
		res=session.delete(namespace+"delete",qna_no);
		session.commit();
		session.close();
		
		
		return res;
	}
	public int qnaview(int qna_no) {
		SqlSession session=null;
		
		int res=0;
		session=getSqlSessionFactory().openSession();
		System.out.println("dao qnano="+qna_no);
		res=session.update(namespace+"view",qna_no);
		session.commit();
		session.close();
		
		return res;
	}
	
}
