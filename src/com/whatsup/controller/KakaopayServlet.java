package com.whatsup.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/KakaopayController")
public class KakaopayServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		HttpSession session=request.getSession();

		String command = request.getParameter("command");

		if (command.equals("Kakaopay")) {
			String planA = request.getParameter("planA");
			String planB = request.getParameter("planB");
			
			
			if (planA != null) {
				jsResponse("planA", "Kakaopaysong.jsp", response);
			} else {
				jsResponse("planB", "KakaopayAll.jsp", response);

			} 
		}else if(command.equals("checklogin")) {
			
			if(session.getAttribute("login") ==null){
				String result = "<script> alert('로그인을 먼저 해주세요!'); location.href='index.jsp'; </script> ";
			    response.getWriter().append(result);
				
			}else {
			PrintWriter out = response.getWriter();
		       out.println("<html><body>");
		       out.println("<script type=\"text/javascript\">");
		       out.println("setTimeout(function openPopup(){window.open(\"Kakapay01.jsp\", \"new\", \"toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=470, height=470, left=0, top=0\" );\r\n" + 
		       		"})");
		       out.println("</script>");
		       out.println("</body></html>");
					
			}	
		
		
		}else if() {
			
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
	

	private void dispatch(String path, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(path);
		dispatch.forward(request, response);
	}
	
	
	public void jsResponse(String msg, String url, HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter(); 
		String res = "<script>alert('" +msg+"'); location.href='"+url +"';</script>"; 
		
		out.print(res);
	}

}
