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

import com.whatsup.dao.Member_BoardDao;
import com.whatsup.dto.Member_BoardDto;


@WebServlet("/KakaopayController")
public class KakaopayServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		HttpSession session=request.getSession();
		Member_BoardDao dao = new Member_BoardDao(); 

		String command = request.getParameter("command");

		if (command.equals("Kakaopay")) {
			
			String planA = request.getParameter("planA");
			String planB = request.getParameter("planB");
			
			//logincontroller.do?command=registform
			if (planA != null) {
				response.sendRedirect("KakaopayController?command=kakaopaysong");
			} else if(planB != null) {
				response.sendRedirect("KakaopayController?command=kakaopayall");

			} else {
				String result = "<script> alert('선택해 주세요'); location.href='Kakapay01.jsp';</script> ";
			    response.getWriter().append(result);
			    
			}
		}else if(command.equals("checklogin")) {
			Member_BoardDto dto = (Member_BoardDto)session.getAttribute("login");

			if(dto ==null){
				String result = "<script> alert('로그인을 먼저 해주세요!'); self.close(); location.href='index.jsp'; </script> ";
			    response.getWriter().append(result);
				
			}else {
				
				
				if( dto.getMembership().equals("ONE") || dto.getMembership().equals("ALL")) {
					
					request.setAttribute("test", dto);
					dispatch("Kakapay01.jsp",request,response);
					
						
				}else{
					dispatch("Kakapay01.jsp",request,response);
				}
				/*
			PrintWriter out = response.getWriter();
		       out.println("<html><body>");
		       out.println("<script type=\"text/javascript\">");
		       out.println("setTimeout(function openPopup(){(\"Kakapay01.jsp\", \"new\", \"toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=470, height=470, left=0, top=0\" );\r\n" + 
		       		"})");
		       out.println("</script>");
		       out.println("</body></html>");
		       */
					
			}	
			
		}else if("kakaopaysong".equals(command)) {
			
			
			dispatch("Kakaopaysong.jsp",request,response);
			
			/*
			if(res> 0) {
				
				dispatch("Kakaopaysong.jsp",request,response);
				
			}else {
				System.out.println("결제 실패! 다시 시도해 주세요.");
				dispatch("Kakapay01.jsp",request,response);
				
			}*/
			
		}else if("kakaopaysong01".equals(command)) {
			int memberseq = Integer.parseInt(request.getParameter("member_seq"));
			String membership = request.getParameter("membership");
			Member_BoardDto dto = new Member_BoardDto(memberseq, membership);
			int res = dao.updateKakaosong(memberseq);
			
			if(res> 0) {
				String result = "<script> self.close(); location.href='index.jsp'; </script> ";
			    response.getWriter().append(result);
				
			}else {
				System.out.println("결제 실패! 다시 시도해 주세요.");
				dispatch("Kakapay01.jsp",request,response);
			
			
			}
			
		}else if("kakaopayall".equals(command)) {
			
			dispatch("KakaopayAll.jsp",request,response);
			
			
		}else if("kakaopayall01".equals(command)) {
			
			int memberseq = Integer.parseInt(request.getParameter("member_seq"));
			String membership = request.getParameter("membership");
			Member_BoardDto dto = new Member_BoardDto(memberseq, membership);
			int res = dao.updateKakaoall(memberseq);
			
			if(res> 0) {
				String result = "<script> self.close(); location.href='index.jsp'; </script> ";
			    response.getWriter().append(result);
				
			}else {
				System.out.println("결제 실패! 다시 시도해 주세요.");
				dispatch("Kakapay01.jsp",request,response);
			
			
			}
			
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
