package com.whatsup.dao;

import org.apache.ibatis.session.SqlSession;
import com.whatsup.dto.Member_BoardDto;

public class Member_BoardDao extends SqlMapConfig {
	private String namespace= "Member_Boardmapper.";
	//회원가입
	public int insert(Member_BoardDto dto) {
		SqlSession session =null;
		int res = 0;
		//세션
		session = getSqlSessionFactory().openSession(true);
		res = session.insert(namespace + "insert",dto);
		session.close();
				
		
		return res;
	}
	//로그인

	
	
	//아이디 중복확인(닉네임도)	
	
	public Member_BoardDto check (String myid) {
		SqlSession session =null;
		Member_BoardDto dto  = null;
		session= getSqlSessionFactory().openSession();
		dto = session.selectOne(namespace +"selectId", myid);
		session.close();
		return dto;
	}
	
	
	
}