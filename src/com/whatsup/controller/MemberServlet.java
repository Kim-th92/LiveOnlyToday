package com.whatsup.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.whatsup.dao.Member_BoardDao;
import com.whatsup.dto.Member_BoardDto;

@WebServlet("/MemberServlet.do")
public class MemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
      Member_BoardDao dao = new Member_BoardDao(); 

	
    public MemberServlet() {
    
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getParameter("command");
		
		if(command.equals("idchk")){
			String myid = request.getParameter("myid");
			Member_BoardDto dto =  dao.check(myid);
			boolean notUsed = true;
			if(dto.getId() != null){
	 			notUsed =false;
	 		}
			response.sendRedirect("idchk.jsp?idnotused="+notUsed);
			
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
