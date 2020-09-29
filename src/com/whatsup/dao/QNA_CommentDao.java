package com.whatsup.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.whatsup.dto.CommentDto;

public class QNA_CommentDao extends SqlMapConfig {
	private String namespace="QNACommentmapper.";
	
	public List<CommentDto> selectFreeList(int qna_no){
		SqlSession session=null;
		List<CommentDto> list=new ArrayList<CommentDto>();
		session=getSqlSessionFactory().openSession();
		list=session.selectList(namespace+"qna_comment",qna_no);
		
		session.close();
		return list;
	
	}
	public int insertQna(CommentDto dto) {
		SqlSession session=null;
		
		int res=0;
		session=getSqlSessionFactory().openSession();
		res=session.insert(namespace+"qna_comment_insert",dto);
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
