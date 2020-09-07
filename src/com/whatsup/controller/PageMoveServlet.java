package com.whatsup.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.whatsup.dao.Member_BoardDao;
import com.whatsup.dto.Member_BoarDto;


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
		Member_BoardDao dao=new Member_BoardDao();
		System.out.println("move 서블릿 도착command="+command);
		
		//1.메인 페이지 이동
		if(command.equals("main")) {
			response.sendRedirect("index.jsp");
		
		
		//2.회사소개 페이지
		}else if(command.equals("mainintroduce")) {
			response.sendRedirect("introduce.jsp");
			
			
		//2-1.회사소개 - 오늘만 살조 탭
		}else if(command.equals("")) {
			
		//3.노래 페이지
		}else if(command.equals("mainmusic")) {
			response.sendRedirect("music.jsp");
			
		//3-1.노래 스트리밍 페이지
		}else if(command.equals("")) {
			
		//3-2.노래 혼자 노래부르기 페이지
		}else if(command.equals("")) {
			
		
		//4.춤 페이지
		}else if(command.equals("maindance")) {
			response.sendRedirect("dance.jsp");
			
		//4-1. 춤 선택 페이지
		}else if(command.equals("")) {
			
			
			
		//4-2.춤 분석 페이지
		}else if(command.equals("")) {
			
		//5.자유 게시판
		}else if(command.equals("freeboard")) {
			List<Member_BoardDto> list= null;//dao.freeList();
			request.setAttribute("list", list);
			dispatch("board.jsp	", request, response);
		
			
		//5-1.노래 게시판
		}else if(command.equals("")) {
			
		//5-2.춤 게시판
		}else if(command.equals("")) {
			
		//5-3.게시판 글 생성 페이지(자유게시판)
		}else if(command.equals("")) {
			
			
		//5-4.게시판 글 생성 페이지(노래)
		}else if(command.equals("")) {
			
		//5-5.게시판 글 생성 페이지
		}else if(command.equals("")) {
		//6.고객센터 게시판
		}else if(command.equals("servicesenter")) {
			response.sendRedirect("servicesenter.jsp");
			
			
		//6-1.고객센터 작성 페이지
		}else if(command.equals("")) {
			
			
		//7.로그인 페이지 이동
		}else if (command.equals("loginpage")) {
		response.sendRedirect("loginpage.jsp");
			
		//8. 회원가입 페이지
		}else if (command.equals("registerpage")) {
		response.sendRedirect("registerpage.jsp");
			
			
		//9.결제 페이지 (결제종류 선택)
		}else if (command.equals("")) {
			
			
		//9-1.결제 페이지(결제 방법 선택)
		}else if(command.equals("")) {
		
		//10.채팅 페이지
		}else if(command.equals("")) {
			
		
		//10-1.채팅 입장
		}else if(command.equals("")) {
		
		//11.지도 페이지
		}else if(command.equals("")) {
			
		//12.마이페이지
		}else if(command.equals("")) {
			
			
		//13.관리자 페이지
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
