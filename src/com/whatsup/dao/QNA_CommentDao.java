package com.whatsup.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;


import com.whatsup.dto.QNA_CommentDto;

public class QNA_CommentDao extends SqlMapConfig {
	private String namespace="QNACommentmapper.";
	
	public List<QNA_CommentDto> selectFreeList(int qna_no){
		SqlSession session=null;
		List<QNA_CommentDto> list=new ArrayList<QNA_CommentDto>();
		session=getSqlSessionFactory().openSession();
		list=session.selectList(namespace+"qna_comment",qna_no);
		
		session.close();
		return list;
	
	}
	public int insertQna_Commnet(QNA_CommentDto qna_comment_dto) {
		SqlSession session=null;
		
		int res=0;
		session=getSqlSessionFactory().openSession(true);
		res=session.insert(namespace+"qna_comment_insert",qna_comment_dto);
		session.commit();
		session.close();
		
		
		return res;
	}
	
	
	public int update(QNA_CommentDto qna_comment_dto) {
		SqlSession session=null;
		
		int res=0;
		session=getSqlSessionFactory().openSession();
		res=session.update(namespace+"update",qna_comment_dto);
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
	
}
