package com.whatsup.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.Session;

import com.whatsup.dao.Member_BoardDao;
import com.whatsup.dto.Member_BoardDto;


@WebServlet("/member.do")
public class MemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
      
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 Member_BoardDao dao = new Member_BoardDao(); 
		request.setCharacterEncoding("UTF-8");
		
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getParameter("command");
		
		if("idchk".equals(command)){
			String myid = request.getParameter("myid");
			Member_BoardDto dto =  dao.check(myid);
			boolean notUsed = true;
			
			if(dto == null){
				
	 			notUsed =true;
	 		}else {
	 			notUsed=false;
	 		}
			response.sendRedirect("idchk.jsp?notUsed="+notUsed);
			
		}else if(command.equals("registeres")) {
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			String nickname = request.getParameter("nickname");
			String name = request.getParameter("name");
			String phone = request.getParameter("phone");
			String addr = request.getParameter("addr");
			String birthday = request.getParameter("birthday");
			String email = request.getParameter("email");
			
			Member_BoardDto dto = new Member_BoardDto();
			dto.setId(id);
			dto.setPw(pw);
			dto.setNickname(nickname);
			dto.setName(name);
			dto.setPhone(phone);
			dto.setAddr(addr);
			dto.setBirthday(birthday);
			dto.setEmail(email);
			
			int res  = dao.insert(dto);
			if(res>0) {
				jsResponse("회원가입 성공","index.jsp", response);
			}else {
				jsResponse("회원가입 실패","registers.jsp", response);
			}
		}else if("login".equals(command)) {
			String id = request.getParameter("id");
			String pw=request.getParameter("pw");
			HttpSession session = request.getSession();
			
			Member_BoardDto dto = dao.login(id, pw);
			if(dto.getId() != null){
		 		//3.  세션에 넣어야 로그인이 유지되니까...
		 		//session : 만료될 때 까지 프로젝트 전체에서 사용
		 		session.setAttribute("login",dto);//login 이란 이름으로 dto를  담을것임
		 		
		 		//setMaxInactiveInterval() : default 30분 , 음수 일때 무제한 
		 		session.setMaxInactiveInterval(10*60);
		 		response.sendRedirect("index.jsp");
			}
		}
		
	}
	private void dispatch(String path, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(path);
		dispatch.forward(request, response);
	}
	
	private void jsResponse(String msg, String url, HttpServletResponse response) throws IOException {
		String result = "<script> alert(\"" + msg + "\"); location.href=\""+url+"\"; </script> ";
		response.getWriter().append(result);
	}


}
