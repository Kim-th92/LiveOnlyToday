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
<<<<<<< HEAD
=======
import javax.websocket.Session;
>>>>>>> e4b25ba7b7a2ccb6c739f2ad08c6860877aecb59

import com.whatsup.dao.Dance_BoardDao;
import com.whatsup.dao.Free_BoardDao;
import com.whatsup.dao.Member_BoardDao;
import com.whatsup.dao.Song_BoardDao;
import com.whatsup.dto.Dance_BoardDto;
import com.whatsup.dto.Free_BoardDto;
import com.whatsup.dto.Member_BoardDto;
import com.whatsup.dto.Song_BoardDto;


@WebServlet("/move.do")
public class PageMoveServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    public PageMoveServlet() {

    }


   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      doPost(request, response);
   }


<<<<<<< HEAD
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      request.setCharacterEncoding("UTF-8");
      response.setContentType("text/html; charset=UTF-8");
      String command=request.getParameter("command");
      System.out.println("move  command="+command);
      HttpSession session=request.getSession();
      Free_BoardDao free_dao=new Free_BoardDao();
      Dance_BoardDao dance_dao=new Dance_BoardDao();
      Song_BoardDao song_dao=new Song_BoardDao();
      
      //1.메인페이지
      if(command.equals("main")) {
         response.sendRedirect("index.jsp");
      
      
      //2.회사소개
      }else if(command.equals("mainintroduce")) {
         response.sendRedirect("introduce.jsp");
         
         
         //2-1.회사소개 -인원소개
      }else if(command.equals("")) {
         
         //3.노래 페이지
      }else if(command.equals("musicselect")) {
         response.sendRedirect("musicselect.jsp");
         
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
       
    	  
      //5-0.게시판 메인
      }else if(command.equals("mainboardpage")) {
    	  response.sendRedirect("mainboard.jsp");
      //5.자유게시판
      }else if(command.equals("freeboard")) {
         response.sendRedirect("free_boardlist.jsp");
         
      //5-1.자유게시판 글 작성페이지
      }else if(command.equals("freeinsertpage")) {
         if(session.getAttribute("login")==null) {
            jsResponse("먼저 로그인을 해 주세요", "move.do?command=freeboard", response);
         }else {
            response.sendRedirect("free_insertpage.jsp");
      }
      //5-2.자유게시판 글 자세히 보기 페이지
      }else if(command.equals("selectpage")) {
         int free_no=Integer.parseInt(request.getParameter("free_no"));
         int res=free_dao.freeview(free_no);
         Free_BoardDto dto=free_dao.selectOne(free_no);
         request.setAttribute("dto", dto);
         dispatch("free_boardselect.jsp", request, response);   
      //5-3.자유게시판 수정페이지 이동
      }else if(command.equals("updatepage")) {
         int free_no=Integer.parseInt(request.getParameter("free_no"));
         Free_BoardDto dto=free_dao.selectOne(free_no);
         request.setAttribute("dto", dto);
         dispatch("free_update.jsp", request, response);
      //5-4.자유게시판 수정
      }else if(command.equals("updateres")) {
         int free_no=Integer.parseInt(request.getParameter("free_no"));
         String free_title=request.getParameter("free_title");
         String free_content=request.getParameter("free_content");
         Free_BoardDto dto=new Free_BoardDto(free_title, free_content);
         dto.setFree_no(free_no);
         request.setAttribute("dto", dto);
         dispatch("board.do?command=free_update", request, response);
      //5-5.자유 게시판 삭제
      }else if(command.equals("delete")) {
         int free_no=Integer.parseInt(request.getParameter("free_no"));
         request.setAttribute("free_no", free_no);
         dispatch("board.do?command=free_delete", request, response);
         
      //5-6댄스게시판
      }else if(command.equals("danceboard")) {
         response.sendRedirect("dance_boardlist.jsp");
                  
      //5-7.댄스게시판 글 작성페이지
      }else if(command.equals("danceinsertpage")) {
         if(session.getAttribute("login")==null) {
            jsResponse("먼저 로그인을 해 주세요", "move.do?command=danceboard", response);
         }else {
            response.sendRedirect("dance_insertpage.jsp");
      }
      //5-8.댄스게시판 글 자세히 보기 페이지
      }else if(command.equals("selectpage")) {
         int dance_no=Integer.parseInt(request.getParameter("dance_no"));
         int res=dance_dao.danceview(dance_no);
         Dance_BoardDto dto=dance_dao.selectOne(dance_no);
         request.setAttribute("dto", dto);
         dispatch("dance_boardselect.jsp", request, response);   
      //5-9.댄스게시판 수정페이지 이동
      }else if(command.equals("updatepage")) {
         int dance_no=Integer.parseInt(request.getParameter("dance_no"));
         Dance_BoardDto dto=dance_dao.selectOne(dance_no);
         request.setAttribute("dto", dto);
         dispatch("dance_update.jsp", request, response);
      //5-10.댄스게시판 수정
      }else if(command.equals("updateres")) {
         int dance_no=Integer.parseInt(request.getParameter("dance_no"));
         String dance_title=request.getParameter("dance_title");
         String dance_content=request.getParameter("dance_content");
         Dance_BoardDto dto=new Dance_BoardDto(dance_title, dance_content);
         dto.setDance_no(dance_no);
         request.setAttribute("dto", dto);
         dispatch("board.do?command=dance_update", request, response);
      //5-11.댄스 게시판 삭제
      }else if(command.equals("delete")) {
         int dance_no=Integer.parseInt(request.getParameter("dance_no"));
         request.setAttribute("dance_no", dance_no);
         dispatch("board.do?command=dance_delete", request, response);
      
       //5-12 노래게시판
      }else if(command.equals("songboard")) {
         response.sendRedirect("song_boardlist.jsp");
                  
      //5-13.노래게시판 글 작성페이지
      }else if(command.equals("songinsertpage")) {
         if(session.getAttribute("login")==null) {
            jsResponse("먼저 로그인을 해 주세요", "move.do?command=songboard", response);
         }else {
            response.sendRedirect("song_insertpage.jsp");
      }
      //5-14.노래게시판 글 자세히 보기 페이지
      }else if(command.equals("selectpage")) {
         int song_no=Integer.parseInt(request.getParameter("song_no"));
         int res=song_dao.songview(song_no);
         Song_BoardDto dto=song_dao.selectOne(song_no);
         request.setAttribute("dto", dto);
         dispatch("song_boardselect.jsp", request, response);   
      //5-15.노래게시판 수정페이지 이동
      }else if(command.equals("updatepage")) {
         int song_no=Integer.parseInt(request.getParameter("song_no"));
         Song_BoardDto dto=song_dao.selectOne(song_no);
         request.setAttribute("dto", dto);
         dispatch("song_update.jsp", request, response);
      //5-16.노래게시판 수정
      }else if(command.equals("updateres")) {
         int song_no=Integer.parseInt(request.getParameter("song_no"));
         String song_title=request.getParameter("song_title");
         String song_content=request.getParameter("song_content");
         Song_BoardDto dto=new Song_BoardDto(song_title, song_content);
         dto.setSong_no(song_no);
         request.setAttribute("dto", dto);
         dispatch("board.do?command=song_update", request, response);
      //5-17.노래게시판 삭제
      }else if(command.equals("delete")) {
         int song_no=Integer.parseInt(request.getParameter("song_no"));
         request.setAttribute("song_no", song_no);
         dispatch("board.do?command=song_delete", request, response);

      //6.고객센터
      }else if(command.equals("servicesenter")) {
         response.sendRedirect("servicesenter.jsp");
         
         
      //6-1.고객센터 글 작성
      }else if(command.equals("")) {
         
         
      //7.로그인 페이지
      }else if (command.equals("loginpage")) {
      response.sendRedirect("loginpage.jsp");
         
      //8. 회원가입 페이지
      }else if (command.equals("registerpage")) {
      response.sendRedirect("registerpage.jsp");
         
         
      //9.채팅게시판
      }else if (command.equals("chatingboard")) {
         response.sendRedirect("chatingpage.jsp");
         
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
         
         
      //13.관리자페이지
      }else if(command.equals("")) {
         
      //14.댓글 입력
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

=======
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
>>>>>>> e4b25ba7b7a2ccb6c739f2ad08c6860877aecb59

}
