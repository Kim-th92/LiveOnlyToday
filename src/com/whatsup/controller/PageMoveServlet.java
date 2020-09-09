package com.whatsup.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

<<<<<<< HEAD
=======

>>>>>>> maggie
import com.whatsup.dao.Member_BoardDao;
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
		System.out.println("move ���� ���� command="+command);
		
		//1.���� ������ �̵�
		if(command.equals("main")) {
			response.sendRedirect("index.jsp");
		
		
		//2.ȸ��Ұ� ������	
		}else if(command.equals("mainintroduce")) {
			response.sendRedirect("introduce.jsp");
			
			
		//2-1.ȸ��Ұ�-���ø����� ��
		}else if(command.equals("")) {
			
		//3.�뷡 ������
		}else if(command.equals("mainmusic")) {
			response.sendRedirect("music.jsp");
			
		//3-1.�뷡 ��Ʈ���� ������
		}else if(command.equals("")) {
			
		//3-2.�뷡 ȥ�� ��Ʈ���� ������
		}else if(command.equals("")) {
			
		
		//4.�� ������
		}else if(command.equals("maindance")) {
			response.sendRedirect("dance.jsp");
			
		//4-1.�� ���� ������
		}else if(command.equals("")) {
			
			
			
		//4-2.�� �м� ������
		}else if(command.equals("")) {
			
		//5.���� �Խ���
		}else if(command.equals("freeboard")) {
			response.sendRedirect("free_boardlist.jsp");
			
		//5-1.�뷡 �Խ���
		}else if(command.equals("")) {
			
		//5-2.�� �Խ���
		}else if(command.equals("")) {
			
		//5-3.�Խ��� �� ���� ������(�����Խ���)
		}else if(command.equals("")) {
			
			
		//5-4.�Խ��� �� ���� ������(�뷡)
		}else if(command.equals("")) {
			
		//5-5.�Խ��� �� ���� ������(��)
		}else if(command.equals("")) {
		//6.������  �Խ���
		}else if(command.equals("servicesenter")) {
			response.sendRedirect("servicesenter.jsp");
			
			
		//6-1.������ �ۼ� ������	
		}else if(command.equals("")) {
			
			
		//7.�α��� ������ �̵�
		}else if (command.equals("loginpage")) {
		response.sendRedirect("loginpage.jsp");
			
		//8. ȸ������ ������
		}else if (command.equals("registerpage")) {
		response.sendRedirect("registerpage.jsp");
			
			
		//9.���� ������(�������� ����)
		}else if (command.equals("")) {
			
			
		//9-1.���� ������(������� ����)
		}else if(command.equals("")) {
		
		//10.ä�� ������
		}else if(command.equals("")) {
			
		
		//10-1.ä�� ����
		}else if(command.equals("")) {
		
		//11.���� ������
		}else if(command.equals("")) {
			
		//12.����������
		}else if(command.equals("")) {
			
			
		//13.������ ������
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
