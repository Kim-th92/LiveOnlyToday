package com.whatsup.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

<<<<<<< HEAD
import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.FileUploadException;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.sun.org.apache.bcel.internal.classfile.Field;
=======
<<<<<<< HEAD
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;

import com.oreilly.servlet.MultipartRequest;
import com.sun.org.apache.bcel.internal.classfile.Field;
=======
>>>>>>> 517e2356f4db51400aa28cd54d16cc5a4778984e
>>>>>>> f9c3d5897b594b87a3addc2c3f677305c87ea495
import com.whatsup.dao.Dance_BoardDao;
import com.whatsup.dao.Free_BoardDao;
import com.whatsup.dao.Song_BoardDao;
import com.whatsup.dto.Dance_BoardDto;
import com.whatsup.dto.Free_BoardDto;
import com.whatsup.dto.Member_BoardDto;
import com.whatsup.dto.Song_BoardDto;
<<<<<<< HEAD

=======
<<<<<<< HEAD

=======
>>>>>>> 517e2356f4db51400aa28cd54d16cc5a4778984e
>>>>>>> f9c3d5897b594b87a3addc2c3f677305c87ea495

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
=======
<<<<<<< HEAD
=======
<<<<<<< HEAD
>>>>>>> 517e2356f4db51400aa28cd54d16cc5a4778984e
>>>>>>> f9c3d5897b594b87a3addc2c3f677305c87ea495
		Free_BoardDao free_dao=new Free_BoardDao();
		Song_BoardDao song_dao=new Song_BoardDao();
		Dance_BoardDao dance_dao=new Dance_BoardDao();
		//자유게시판 추가
<<<<<<< HEAD
=======
<<<<<<< HEAD
=======
=======
<<<<<<< HEAD
		Free_BoardDao dao=new Free_BoardDao();
>>>>>>> f7dbca7083e7073c89b726d649132910d7a76534
>>>>>>> 517e2356f4db51400aa28cd54d16cc5a4778984e
>>>>>>> f9c3d5897b594b87a3addc2c3f677305c87ea495
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
			
<<<<<<< HEAD
=======
			Free_BoardDto dto=new Free_BoardDto(nickname, free_title, free_content);
>>>>>>> e4b25ba7b7a2ccb6c739f2ad08c6860877aecb59
			
>>>>>>> f9c3d5897b594b87a3addc2c3f677305c87ea495
			int res=free_dao.insert(dto);
			if(res>0) {
				jsResponse("작성 성공", "move.do?command=freeboard", response);
			}else {
				jsResponse("작성 실패", "move.do?command=freeinsertpage", response);
			}
<<<<<<< HEAD
		
=======
<<<<<<< HEAD
		
=======
<<<<<<< HEAD
		
=======
<<<<<<< HEAD
>>>>>>> f7dbca7083e7073c89b726d649132910d7a76534
>>>>>>> 517e2356f4db51400aa28cd54d16cc5a4778984e
>>>>>>> f9c3d5897b594b87a3addc2c3f677305c87ea495
		}else if(command.equals("free_update")) {
			Free_BoardDto dto=(Free_BoardDto)request.getAttribute("dto");
			
			int res=free_dao.update(dto);
			if(res>0) {
				jsResponse("수정 성공", "move.do?command=selectpage&free_no="+dto.getFree_no(), response);
			}else {
				jsResponse("수정 실패", "move.do?command=updatepage&free_no="+dto.getFree_no(), response);
			}
		}else if(command.equals("free_delete")) {
			int free_no=Integer.parseInt(request.getParameter("free_no"));
			int res=free_dao.delete(free_no);
			if(res>0) {
				jsResponse("삭제 성공", "move.do?command=freeboard", response);
			}else {
				jsResponse("삭제 실패", "move.do?command=selectpage&free_no="+free_no, response);
			}
		//노래 게시판
		}else if(command.equals("song_insert")){
<<<<<<< HEAD
			
			int member_seq=Integer.parseInt(request.getParameter("member_seq"));
			String song_title=request.getParameter("song_title");
			String song_content=request.getParameter("song_content");
			
			Song_BoardDto dto=new Song_BoardDto(member_seq, song_title, song_content);
			
=======
			
			int member_seq=Integer.parseInt(request.getParameter("member_seq"));
			String song_title=request.getParameter("song_title");
			String song_content=request.getParameter("song_content");
			
			Song_BoardDto dto=new Song_BoardDto(member_seq, song_title, song_content);
			
>>>>>>> f9c3d5897b594b87a3addc2c3f677305c87ea495
			int res=song_dao.insert(dto);
			if(res>0) {
				jsResponse("작성 성공", "move.do?command=songboard", response);
			}else {
				jsResponse("작성 실패", "move.do?command=songinsertpage", response);
			}
		
		}else if(command.equals("song_update")) {
			Song_BoardDto dto=(Song_BoardDto)request.getAttribute("dto");
			
			int res=song_dao.update(dto);
			if(res>0) {
				jsResponse("수정 성공", "move.do?command=selectpage&song_no="+dto.getSong_no(), response);
			}else {
				jsResponse("수정 실패", "move.do?command=updatepage&song_no="+dto.getSong_no(), response);
			}
		}else if(command.equals("song_delete")) {
			int song_no=Integer.parseInt(request.getParameter("song_no"));
			int res=song_dao.delete(song_no);
			if(res>0) {
				jsResponse("삭제 성공", "move.do?command=songboard", response);
			}else {
				jsResponse("삭제 실패", "move.do?command=selectpage&song_no="+song_no, response);
			}
<<<<<<< HEAD
=======
<<<<<<< HEAD
>>>>>>> f9c3d5897b594b87a3addc2c3f677305c87ea495
			
		//댄스게시판	
		}else if(command.equals("dance_insert")){
			
			int member_seq=Integer.parseInt(request.getParameter("member_seq"));
			String dance_title=request.getParameter("dance_title");
			String dance_content=request.getParameter("dance_content");
			
			Dance_BoardDto dto=new Dance_BoardDto(member_seq, dance_title, dance_content);
			
			int res=dance_dao.insert(dto);
			if(res>0) {
				jsResponse("작성 성공", "move.do?command=danceboard", response);
			}else {
				jsResponse("작성 실패", "move.do?command=danceinsertpage", response);
			}
<<<<<<< HEAD
		
		}else if(command.equals("dance_update")) {
			Dance_BoardDto dto=(Dance_BoardDto)request.getAttribute("dto");
			
			int res=dance_dao.update(dto);
			if(res>0) {
				jsResponse("수정 성공", "move.do?command=selectpage&dance_no="+dto.getDance_no(), response);
			}else {
				jsResponse("수정 실패", "move.do?command=updatepage&dance_no="+dto.getDance_no(), response);
			}
		}else if(command.equals("dance_delete")) {
			int dance_no=Integer.parseInt(request.getParameter("dance_no"));
			int res=dance_dao.delete(dance_no);
			if(res>0) {
				jsResponse("삭제 성공", "move.do?command=danceboard", response);
			}else {
				jsResponse("삭제 실패", "move.do?command=selectpage&dance_no="+dance_no, response);
			}
		}else if(command.equals("musicinsert")) {
			
		}
=======
		
		}else if(command.equals("dance_update")) {
			Dance_BoardDto dto=(Dance_BoardDto)request.getAttribute("dto");
			
			int res=dance_dao.update(dto);
			if(res>0) {
				jsResponse("수정 성공", "move.do?command=selectpage&dance_no="+dto.getDance_no(), response);
			}else {
				jsResponse("수정 실패", "move.do?command=updatepage&dance_no="+dto.getDance_no(), response);
			}
		}else if(command.equals("dance_delete")) {
			int dance_no=Integer.parseInt(request.getParameter("dance_no"));
			int res=dance_dao.delete(dance_no);
			if(res>0) {
				jsResponse("삭제 성공", "move.do?command=danceboard", response);
			}else {
				jsResponse("삭제 실패", "move.do?command=selectpage&dance_no="+dance_no, response);
			}
		}else if(command.equals("musicinsert")) {
			DiskFileItemFactory factory=new DiskFileItemFactory();
			String fielpath="resources/audio";
			String subtitlepath="resources/vtt";
			File repository=new File(fielpath);
			factory.setRepository(repository);
=======
>>>>>>> 517e2356f4db51400aa28cd54d16cc5a4778984e
			
		//댄스게시판	
		}else if(command.equals("dance_insert")){
			
			int member_seq=Integer.parseInt(request.getParameter("member_seq"));
			String dance_title=request.getParameter("dance_title");
			String dance_content=request.getParameter("dance_content");
			
			Dance_BoardDto dto=new Dance_BoardDto(member_seq, dance_title, dance_content);
			
			int res=dance_dao.insert(dto);
			if(res>0) {
				jsResponse("작성 성공", "move.do?command=danceboard", response);
			}else {
				jsResponse("작성 실패", "move.do?command=danceinsertpage", response);
			}
		
		}else if(command.equals("dance_update")) {
			Dance_BoardDto dto=(Dance_BoardDto)request.getAttribute("dto");
			
			int res=dance_dao.update(dto);
			if(res>0) {
				jsResponse("수정 성공", "move.do?command=selectpage&dance_no="+dto.getDance_no(), response);
			}else {
				jsResponse("수정 실패", "move.do?command=updatepage&dance_no="+dto.getDance_no(), response);
			}
		}else if(command.equals("dance_delete")) {
			int dance_no=Integer.parseInt(request.getParameter("dance_no"));
			int res=dance_dao.delete(dance_no);
			if(res>0) {
				jsResponse("삭제 성공", "move.do?command=danceboard", response);
			}else {
				jsResponse("삭제 실패", "move.do?command=selectpage&dance_no="+dance_no, response);
			}
		}
		
		
<<<<<<< HEAD
=======
>>>>>>> f9c3d5897b594b87a3addc2c3f677305c87ea495
	}
=======
		}
		
	}
	private void dispatch(String path, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(path);
		dispatch.forward(request, response);
>>>>>>> 517e2356f4db51400aa28cd54d16cc5a4778984e
	}
>>>>>>> e4b25ba7b7a2ccb6c739f2ad08c6860877aecb59
	
	private void jsResponse(String msg, String url, HttpServletResponse response) throws IOException {
		String result = "<script> alert(\"" + msg + "\"); location.href=\""+url+"\"; </script> ";
		response.getWriter().append(result);
		
	}
}