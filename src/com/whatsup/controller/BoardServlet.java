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

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.whatsup.dao.Dance_BoardDao;
import com.whatsup.dao.Free_BoardDao;
import com.whatsup.dao.QNA_BoardDao;
import com.whatsup.dao.Song_BoardDao;
import com.whatsup.dto.Dance_BoardDto;
import com.whatsup.dto.Free_BoardDto;
import com.whatsup.dto.Member_BoardDto;
import com.whatsup.dto.QNA_BoardDto;
import com.whatsup.dto.Song_BoardDto;



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
		

		String fileSavePath="upload";
		int uploadSizeLimit = 1000*1024*1024;
		String encType ="UTF-8";
		if(!ServletFileUpload.isMultipartContent(request)) {
			response.sendRedirect("dance_boardinsert.jsp");
		}
		
		ServletContext context = getServletContext();
		
		String uploadPath = context.getRealPath(fileSavePath);
		System.out.println(uploadPath);
		  File isDir = new File(uploadPath);

		    

		    if(!isDir.isDirectory()){

		    	System.out.println("디렉토리가 없습니다. 디렉토리를 새로 생성합니다.");

		    	isDir.mkdir();

		    }

		
		MultipartRequest multi = new MultipartRequest(request,uploadPath,uploadSizeLimit,encType,new DefaultFileRenamePolicy());
		if(command==null) {
				command = multi.getParameter("command");
				}
		
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
			
		//댄스게시판	
		}else if("dance_insert".equals(command)){
			
			String file = multi.getFilesystemName("dance_file");
			
			int member_seq;
			String dance_title;
			String dance_content;
			int res;
			Dance_BoardDto dto=new Dance_BoardDto();
			if(file == null||file.trim()=="") {
				member_seq = Integer.parseInt(multi.getParameter("member_seq"));
				dance_title = multi.getParameter("dance_title");
				dance_content= multi.getParameter("dance_content");
				dto =new Dance_BoardDto();
				dto.setMember_seq(member_seq);
				dto.setDance_title(dance_title);
				dto.setDance_content(dance_content);
				
				res=dance_dao.insert(dto);
				
				if(res>0) {
					jsResponse("작성 성공", "move.do?command=danceboard", response);
				}else {
					jsResponse("작성 실패", "move.do?command=danceinsertpage", response);
				}
				
			}else {
				if(dance_dao.selectFile(file)==null) {
					member_seq = Integer.parseInt(multi.getParameter("member_seq"));
					dance_title = multi.getParameter("dance_title");
					dance_content= multi.getParameter("dance_content");
					dto =new Dance_BoardDto();
					
					dto.setMember_seq(member_seq);
					dto.setDance_content(dance_content);
					dto.setDance_title(dance_title);
					dto.setDancerealfname(file);
					dto.setDancefname(file);
					dto.setDancerealpath(uploadPath);
					res=dance_dao.insertFile(dto);
					
					if(res>0) {
						jsResponse("작성 성공", "move.do?command=danceboard", response);
					}else {
						jsResponse("작성 실패", "move.do?command=danceinsertpage", response);
					}
				
				}else {
					member_seq = Integer.parseInt(multi.getParameter("member_seq"));
					dance_title = multi.getParameter("dance_title");
					dance_content= multi.getParameter("dance_content");
					String dancefname = file + Math.floor(Math.random()*10000000);
					if(dance_dao.selectFile(dancefname)==null) {
						dto =new Dance_BoardDto();
						dto.setMember_seq(member_seq);
						dto.setDance_content(dance_content);
						dto.setDance_title(dance_title);
						dto.setDancerealfname(file);
						dto.setDancefname(dancefname);
						dto.setDancerealpath(uploadPath);
						res = dance_dao.insertFile(dto);
						
						if(res>0) {
							jsResponse("작성 성공", "move.do?command=danceboard", response);
						}else {
							jsResponse("작성 실패", "move.do?command=danceinsertpage", response);
						}
					}
				}				
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
	}
	
	private void jsResponse(String msg, String url, HttpServletResponse response) throws IOException {
		String result = "<script> alert(\"" + msg + "\"); location.href=\""+url+"\"; </script> ";
		response.getWriter().append(result);
		
	}
}
