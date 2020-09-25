package com.whatsup.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.FileUploadException;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.sun.org.apache.bcel.internal.classfile.Field;
import com.whatsup.dao.CommentDao;
import com.whatsup.dao.Dance_BoardDao;
import com.whatsup.dao.Free_BoardDao;
import com.whatsup.dao.QNA_BoardDao;
import com.whatsup.dao.Song_BoardDao;
import com.whatsup.dao.Stream_BoardDao;
import com.whatsup.dto.CommentDto;
import com.whatsup.dto.Dance_BoardDto;
import com.whatsup.dto.Free_BoardDto;
import com.whatsup.dto.Member_BoardDto;
import com.whatsup.dto.QNA_BoardDto;
import com.whatsup.dto.Song_BoardDto;
import com.whatsup.dto.Stream_BoardDto;



@WebServlet("/board.do")
public class BoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public BoardServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getParameter("command");
		Free_BoardDao free_dao=new Free_BoardDao();
		Song_BoardDao song_dao=new Song_BoardDao();
		Dance_BoardDao dance_dao=new Dance_BoardDao();
		QNA_BoardDao qna_dao=new QNA_BoardDao(); 
		CommentDao comment_dao=new CommentDao();
		Stream_BoardDao stream_dao=new Stream_BoardDao();
		//자유게시판 추가
		if(command.equals("free_insert")){
			
			int member_seq=Integer.parseInt(request.getParameter("member_seq"));
			String free_title=request.getParameter("free_title");
			String free_content=request.getParameter("free_content");
			
			Free_BoardDto dto=new Free_BoardDto(member_seq, free_title, free_content);
			
			int res=free_dao.insert(dto);
			if(res>0) {
				jsResponse("작성 성공", "move.do?command=freeboard", response);
			}else {
				jsResponse("작성 실패", "move.do?command=freeinsertpage", response);
			}
		
		}else if(command.equals("free_update")) {
			Free_BoardDto dto=(Free_BoardDto)request.getAttribute("dto");
			
			int res=free_dao.update(dto);
			if(res>0) {
				jsResponse("수정 성공", "move.do?command=freeselectpage&free_no="+dto.getFree_no(), response);
			}else {
				jsResponse("수정 실패", "move.do?command=freeupdatepage&free_no="+dto.getFree_no(), response);
			}
		}else if(command.equals("free_delete")) {
			int free_no=Integer.parseInt(request.getParameter("free_no"));
			int res=free_dao.delete(free_no);
			if(res>0) {
				jsResponse("삭제 성공", "move.do?command=freeboard", response);
			}else {
				jsResponse("삭제 실패", "move.do?command=freeselectpage&free_no="+free_no, response);
			}
		//노래 게시판
		}else if(command.equals("song_insert")){
			
			int member_seq=Integer.parseInt(request.getParameter("member_seq"));
			String song_title=request.getParameter("song_title");
			String song_content=request.getParameter("song_content");
			
			Song_BoardDto dto=new Song_BoardDto(member_seq, song_title, song_content);
			
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
				jsResponse("수정 성공", "move.do?command=songselectpage&song_no="+dto.getSong_no(), response);
			}else {
				jsResponse("수정 실패", "move.do?command=songupdatepage&song_no="+dto.getSong_no(), response);
			}
		}else if(command.equals("song_delete")) {
			int song_no=Integer.parseInt(request.getParameter("song_no"));
			int res=song_dao.delete(song_no);
			if(res>0) {
				jsResponse("삭제 성공", "move.do?command=songboard", response);
			}else {
				jsResponse("삭제 실패", "move.do?command=songselectpage&song_no="+song_no, response);
			}
			
		//댄스게시판	
		}else if(command.equals("dance_insert")){
			String fileSavePath="dancevideoupload";
			int uploadSizeLimit = 1000*1024*1024;
			String encType ="UTF-8";
			if(!ServletFileUpload.isMultipartContent(request)) {
				response.sendRedirect("");
			}
			
			ServletContext context = getServletContext();
			
			String uploadPath = context.getRealPath(fileSavePath);
			System.out.println(uploadPath);
			
			MultipartRequest multi = new MultipartRequest(request,uploadPath,uploadSizeLimit,encType,new DefaultFileRenamePolicy());
			String file = multi.getFilesystemName("dance_file");
			
			int member_seq;
			String nickname;
			String dance_title;
			String dance_content;
			
			if(file == null) {
				member_seq = Integer.parseInt(multi.getParameter("member_seq"));
				nickname = multi.getParameter("nickname");
				dance_title = multi.getParameter("dance_title");
				dance_content= multi.getParameter("dance_content");
			}else {
				
				member_seq = Integer.parseInt(multi.getParameter("member_seq"));
				nickname = multi.getParameter("nickname");
				dance_title = multi.getParameter("dance_title");
				dance_content= multi.getParameter("dance_content");
			}
					
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
				jsResponse("수정 성공", "move.do?command=danceselectpage&dance_no="+dto.getDance_no(), response);
			}else {
				jsResponse("수정 실패", "move.do?command=danceupdatepage&dance_no="+dto.getDance_no(), response);
			}
		}else if(command.equals("dance_delete")) {
			int dance_no=Integer.parseInt(request.getParameter("dance_no"));
			int res=dance_dao.delete(dance_no);
			if(res>0) {
				jsResponse("삭제 성공", "move.do?command=danceboard", response);
			}else {
				jsResponse("삭제 실패", "move.do?command=danceselectpage&dance_no="+dance_no, response);
			}
		}else if(command.equals("musicinsert")) {
	
		
		// 문의 게시판	
		}else if(command.equals("qna_insert")){
					
			int member_seq=Integer.parseInt(request.getParameter("member_seq"));
			String qna_title=request.getParameter("qna_title");
			String qna_content=request.getParameter("qna_content");
					
			QNA_BoardDto dto=new QNA_BoardDto(member_seq, qna_title, qna_content);
					
			int res=qna_dao.insert(dto);
			if(res>0) {
				jsResponse("작성 성공", "move.do?command=qnaboard", response);
			}else {
				jsResponse("작성 실패", "move.do?command=qnainsertpage", response);
			}
				
		}else if(command.equals("qna_update")) {
			QNA_BoardDto dto=(QNA_BoardDto)request.getAttribute("dto");
					
			int res=qna_dao.update(dto);
			if(res>0) {
				jsResponse("수정 성공", "move.do?command=selectpage&qna_no="+dto.getQna_no(), response);
			}else {
				jsResponse("수정 실패", "move.do?command=updatepage&qna_no="+dto.getQna_no(), response);
			}
		}else if(command.equals("qna_delete")) {
			int qna_no=Integer.parseInt(request.getParameter("qna_no"));
			int res=qna_dao.delete(qna_no);
			if(res>0) {
				jsResponse("삭제 성공", "move.do?command=qnaboard", response);
			}else {
				jsResponse("삭제 실패", "move.do?command=selectpage&qna_no="+qna_no, response);
			}
		
		}
		//댓글 작성
		else if(command.equals("freecommentinsert")) {
			String comment_content=request.getParameter("comment_content");
			int member_seq=Integer.parseInt(request.getParameter("member_seq"));
			int free_no=Integer.parseInt(request.getParameter("free_no"));
			CommentDto comment_dto=new CommentDto();
			comment_dto.setMember_seq(member_seq);
			comment_dto.setComment_content(comment_content);
			comment_dto.setFree_no(free_no);
			int res=comment_dao.insertFree(comment_dto);
			if(res>0) {
				jsResponse("댓글 작성 성공", "move.do?command=freeselectpage&free_no="+free_no, response);
			}else {
				jsResponse("댓글 작성 실패", "move.do?command=freeselectpage&free_no="+free_no, response);
			}
					
				}
				else if(command.equals("dancecommentinsert")) {
					String comment_content=request.getParameter("comment_content");
					int member_seq=Integer.parseInt(request.getParameter("member_seq"));
					int dance_no=Integer.parseInt(request.getParameter("dance_no"));
					CommentDto comment_dto=new CommentDto();
					comment_dto.setMember_seq(member_seq);
					comment_dto.setComment_content(comment_content);
					comment_dto.setDance_no(dance_no);
					int res=comment_dao.insertDance(comment_dto);
					if(res>0) {
						jsResponse("댓글 작성 성공", "move.do?command=danceselectpage&dance_no="+dance_no, response);
					}else {
						jsResponse("댓글 작성 실패", "move.do?command=danceselectpage&dance_no="+dance_no, response);
					}
					
				}else if(command.equals("songcommentinsert")) {
					String comment_content=request.getParameter("comment_content");
					int member_seq=Integer.parseInt(request.getParameter("member_seq"));
					int song_no=Integer.parseInt(request.getParameter("song_no"));
					CommentDto comment_dto=new CommentDto();
					comment_dto.setMember_seq(member_seq);
					comment_dto.setComment_content(comment_content);
					comment_dto.setSong_no(song_no);
					int res=comment_dao.insertSong(comment_dto);
				if(res>0) {
					jsResponse("댓글 작성 성공", "move.do?command=songselectpage&song_no="+song_no, response);
				}else {
					jsResponse("댓글 작성 실패", "move.do?command=songselectpage&song_no="+song_no, response);
				}
				//방송 생성
			}else if(command.equals("streaminsert")) {
				String stream_title=request.getParameter("stream_title");
				int member_seq=Integer.parseInt(request.getParameter("member_seq"));
				Stream_BoardDto stream_dto=new Stream_BoardDto();
				stream_dto.setMember_seq(member_seq);
				stream_dto.setStream_title(stream_title);
				int res=stream_dao.insert(stream_dto);
				if(res>0) {
					jsResponse("방송 생성 성공", "move.do?command=streamboard", response);
				}else {
					jsResponse("방송 생성 실패", "move.do?command=streaminsertpage", response);
				}
			}

	}
	
	private void jsResponse(String msg, String url, HttpServletResponse response) throws IOException {
		String result = "<script> alert(\"" + msg + "\"); location.href=\""+url+"\"; </script> ";
		response.getWriter().append(result);
		
	}
}
