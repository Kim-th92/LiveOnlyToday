package com.whatsup.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.whatsup.dao.Free_BoardDao;
import com.whatsup.dto.Free_BoardDto;
import com.whatsup.dto.Member_BoardDto;

<<<<<<< HEAD

=======
/**
 * Servlet implementation class BoardServlet
 */
>>>>>>> e4b25ba7b7a2ccb6c739f2ad08c6860877aecb59
@WebServlet("/board.do")
public class BoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getParameter("command");
<<<<<<< HEAD
		Free_BoardDao dao=new Free_BoardDao();
		if(command.equals("free_insert")){
			
			int member_seq=Integer.parseInt(request.getParameter("member_seq"));
			String free_title=request.getParameter("free_title");
			String free_content=request.getParameter("free_content");
			
			Free_BoardDto dto=new Free_BoardDto(member_seq, free_title, free_content);
=======
		
		if(command.equals("free_insert")){
			Free_BoardDao dao=new Free_BoardDao();
			String nickname=request.getParameter("nickname");
			String free_title=request.getParameter("free_title");
			String free_content=request.getParameter("free_content");
			
			Free_BoardDto dto=new Free_BoardDto(nickname, free_title, free_content);
>>>>>>> e4b25ba7b7a2ccb6c739f2ad08c6860877aecb59
			
			int res=dao.insert(dto);
			if(res>0) {
				jsResponse("작성 성공", "move.do?command=freeboard", response);
			}else {
				jsResponse("작성 실패", "move.do?command=freeinsertpage", response);
			}
<<<<<<< HEAD
		}else if(command.equals("free_update")) {
			Free_BoardDto dto=(Free_BoardDto)request.getAttribute("dto");
			
			int res=dao.update(dto);
			if(res>0) {
				jsResponse("수정 성공", "move.do?command=selectpage&free_no="+dto.getFree_no(), response);
			}else {
				jsResponse("수정 실패", "move.do?command=updatepage&free_no="+dto.getFree_no(), response);
			}
		}else if(command.equals("free_delete")) {
			int free_no=Integer.parseInt(request.getParameter("free_no"));
			int res=dao.delete(free_no);
			if(res>0) {
				jsResponse("삭제 성공", "move.do?command=freeboard", response);
			}else {
				jsResponse("삭제 실패", "move.do?command=selectpage&free_no="+free_no, response);
			}
			
		}
		
	}
=======
		}
		
	}
	private void dispatch(String path, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(path);
		dispatch.forward(request, response);
	}
>>>>>>> e4b25ba7b7a2ccb6c739f2ad08c6860877aecb59
	
	private void jsResponse(String msg, String url, HttpServletResponse response) throws IOException {
		String result = "<script> alert(\"" + msg + "\"); location.href=\""+url+"\"; </script> ";
		response.getWriter().append(result);
	}
}
