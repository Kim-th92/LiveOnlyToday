package com.whatsup.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.whatsup.dao.Free_BoardDao;
import com.whatsup.dao.Member_BoardDao;
import com.whatsup.dto.Free_BoardDto;
import com.whatsup.dto.Member_BoardDto;


@WebServlet("/move.do")
public class PageMoveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public PageMoveServlet() {

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String command=request.getParameter("command");
		System.out.println("move 페이지 도착 command="+command);
		HttpSession session=request.getSession();
		Free_BoardDao dao=new Free_BoardDao();
		//1.메인페이지
		if(command.equals("main")) {
			response.sendRedirect("index.jsp");
		
		
		//2.회사소개
		}else if(command.equals("mainintroduce")) {
			response.sendRedirect("introduce.jsp");
			
			
		//2-1.회사소개 -인원소개
		}else if(command.equals("")) {
			
		//3.노래 페이지
		}else if(command.equals("mainmusic")) {
			response.sendRedirect("music.jsp");
			
		//3-1.
		}else if(command.equals("")) {
			
		//3-2.
		}else if(command.equals("")) {
			
		
		//4.댄스페이지
		}else if(command.equals("maindance")) {
			response.sendRedirect("dance.jsp");
			
		//4-1.
		}else if(command.equals("")) {
			
			
			
		//4-2.
		}else if(command.equals("")) {
			
		//5.자유게시판
		}else if(command.equals("freeboard")) {
			response.sendRedirect("free_boardlist.jsp");
			
		//5-1.게시판 글 작성페이지
		}else if(command.equals("freeinsertpage")) {
		if(session.getAttribute("nickname")==null) {
			jsResponse("먼저 로그인을 해 주세요", "move.do?command=freeboard", response);
		}else {
			response.sendRedirect("free_insertpage.jsp");
		}
		//5-2.게시판 글 자세히 보기 페이지
		}else if(command.equals("selectpage")) {
			int free_no=Integer.parseInt(request.getParameter("free_no"));
			Free_BoardDto dto=dao.selectOne(free_no);
			request.setAttribute("dto", dto);
			dispatch("free_boardselect.jsp", request, response);
		//5-3.
		}else if(command.equals("")) {
			
			
		//5-4.
		}else if(command.equals("")) {
			
		//5-5.
		}else if(command.equals("")) {
		//6.고객센터
		}else if(command.equals("servicesenter")) {
			response.sendRedirect("servicesenter.jsp");
			
			
		//6-1.고객센터 글 작성
		}else if(command.equals("")) {
			
			
		//7.로그인 페이지
		}else if (command.equals("loginpage")) {
		response.sendRedirect("loginpage.jsp");
			
		//8.회원가입 페이지
		}else if (command.equals("registerpage")) {
		response.sendRedirect("registerpage.jsp");
			
			
		//9.채팅게시판
		}else if (command.equals("")) {
			
			
		//9-1.채팅 입력
		}else if(command.equals("")) {
		
		//10.결제
		}else if(command.equals("")) {
			
		
		//10-1.결제 종류 선택
		}else if(command.equals("")) {
		
		//11.지도
		}else if(command.equals("")) {
			
		//12.마이페이지
		}else if(command.equals("")) {
			
			
		//13관리자페이지
		}else if(command.equals("")) {
			
			
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
