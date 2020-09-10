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
		HttpSession session = request.getSession();
		
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
			String birthyear = request.getParameter("birthyear");
			String birthmonth = request.getParameter("birthmonth");
			String birthdate = request.getParameter("birthdate");
			String birthday = birthyear+"-"+birthmonth+"-"+birthdate;
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
			String pw = request.getParameter("pw");
			
			
			Member_BoardDto dto = dao.login(id, pw);
			
			if(dto == null || dto.getId()==null){
				String err = "ID 또는 비밀 번호가 일치하지 않습니다.";
				request.setAttribute("err", err);
				response.sendRedirect("login.jsp");
		 		
			} else if(dto.getId() != null){
				
			
		 		session.setAttribute("login",dto);
		 		session.setMaxInactiveInterval(-1);
		 		response.sendRedirect("index.jsp");
			}
		}else if("logout".equals(command)) {
			session.invalidate();	
			response.sendRedirect("index.jsp");
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
