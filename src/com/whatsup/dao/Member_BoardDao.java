package com.whatsup.dao;

import java.util.ArrayList;
import java.util.List;

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
	//snslogin enroll
	public int snslogin(Member_BoardDto dto) {
		SqlSession session =null;
		int res = 0;
		//세션
		session = getSqlSessionFactory().openSession(true);
		res = session.insert(namespace + "snslogin",dto);
		session.close();
				
		return res;
	}
	//SNS로그인
	public Member_BoardDto sns(String id) {
		SqlSession session = null;
		
		Member_BoardDto dto = null;
		session =getSqlSessionFactory().openSession();
		dto =session.selectOne(namespace+"sns", id);
		session.close();
		return dto;
	}
	
	
	//로그인
	public Member_BoardDto login(String id,String pw) {
		SqlSession session = null;
		Member_BoardDto dto = null;
		Member_BoardDto duo = new Member_BoardDto();
		duo.setId(id);
		duo.setPw(pw);
		session =getSqlSessionFactory().openSession();
		dto  = session.selectOne(namespace+"login",duo);
		session.close();
		
		
		return dto;
	}
	
	
	//아이디 중복확인	
	
	public Member_BoardDto check (String myid) {
		SqlSession session =null;
		Member_BoardDto dto  = null;
		session= getSqlSessionFactory().openSession();
		dto = session.selectOne(namespace +"selectId", myid);
		session.close();
		
		return dto;
	}
	//id 찾기
	public Member_BoardDto findId(String name,String email) {
		SqlSession session =null;
		Member_BoardDto dto  = null;
		session= getSqlSessionFactory().openSession();
		Member_BoardDto duo = new Member_BoardDto();
		duo.setName(name);
		duo.setEmail(email);
		dto = session.selectOne(namespace +"findid", duo);
		System.out.println(dto);
		session.close();
		
		return dto;
	}
	//pw찾기
	public Member_BoardDto findPw(String name,String id ,String email,String uuid) {
		SqlSession session =null;
		Member_BoardDto dto  = null;
		int res = 0;
		session= getSqlSessionFactory().openSession();
		
		Member_BoardDto duo = new Member_BoardDto();
		
		duo.setName(name);
		duo.setId(id);
		duo.setEmail(email);
		
		dto = session.selectOne(namespace +"findpw", duo);
		if(dto !=null) {
			duo.setPw(uuid);
			res = session.update(namespace+"updatePw", duo);
			session.commit();
			
			if(res>0) {
			return	dto = session.selectOne(namespace +"findpw", duo);
			
			}
		}else {
		return dto =null;
		}
		session.close();
		return dto;
		
	
	}
	//회원 탈퇴
	public int deleteMember(int member_seq) {
		SqlSession session =null;
		int res = 0;
		//세션
		session = getSqlSessionFactory().openSession(true);
		res = session.update(namespace + "deletemember",member_seq);
		session.close();
				
		return res;
		
	}
<<<<<<< HEAD
<<<<<<< HEAD
	
	
	public int updateKakaosong(int member_seq) {
		SqlSession session =null;
		int res = 0;
		session= getSqlSessionFactory().openSession(true);
		
		res = session.update(namespace + "kakaopaysong01", member_seq);
		session.close();
		
		
		return res;
	}
	
	
	
	public int updateKakaoall(int member_seq) {
		SqlSession session =null;
		int res = 0;
		session= getSqlSessionFactory().openSession(true);
		
		res = session.update(namespace+ "kakaopayall01", member_seq);
		session.close();
		
		
		return res;
	}
	
=======
=======
>>>>>>> 7b2d79eb27d87d11e19f96fbfaad64ea217800cc

	//관리자 - 회원목록보기
	public List<Member_BoardDto> selectList(){
		SqlSession session=null;
		List<Member_BoardDto> list=new ArrayList<Member_BoardDto>();
		session=getSqlSessionFactory().openSession();
		list=session.selectList(namespace+"adminview");
		session.close();
		return list;
		
	}
	public Member_BoardDto selectOne(int member_seq) {
		SqlSession session=null;
		
		Member_BoardDto dto=null;
		session=getSqlSessionFactory().openSession(true);
		dto=session.selectOne(namespace+"selectOne",member_seq);
		session.close();
		return dto;
	}

>>>>>>> 7b2d79eb27d87d11e19f96fbfaad64ea217800cc
	
}
