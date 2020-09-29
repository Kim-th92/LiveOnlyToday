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

import com.whatsup.dao.CommentDao;
import com.whatsup.dao.Dance_BoardDao;
import com.whatsup.dao.Free_BoardDao;
import com.whatsup.dao.Member_BoardDao;
import com.whatsup.dao.MusicListDao;
import com.whatsup.dao.QNA_BoardDao;
import com.whatsup.dao.Song_BoardDao;
import com.whatsup.dto.CommentDto;
import com.whatsup.dto.Dance_BoardDto;
import com.whatsup.dto.Free_BoardDto;
import com.whatsup.dto.Member_BoardDto;
import com.whatsup.dto.MusicListDto;
import com.whatsup.dto.QNA_BoardDto;
import com.whatsup.dto.Song_BoardDto;
import com.whatsup.util.PageNavigator;


@WebServlet("/move.do")
public class PageMoveServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
   int countPerPage = 5;
   int pagePerGroup = 4;    
    
   public PageMoveServlet() {

    }


   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      doPost(request, response);
   }



   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      request.setCharacterEncoding("UTF-8");
      response.setContentType("text/html; charset=UTF-8");
      String command=request.getParameter("command");
      System.out.println("move  command="+command);
      HttpSession session=request.getSession();
      Free_BoardDao free_dao=new Free_BoardDao();
      Dance_BoardDao dance_dao=new Dance_BoardDao();
      Song_BoardDao song_dao=new Song_BoardDao();
      MusicListDao music_dao=new MusicListDao();
      QNA_BoardDao qna_dao=new QNA_BoardDao();
      Member_BoardDao dao=new Member_BoardDao();
      CommentDao comment_dao=new CommentDao();

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
    	 List<MusicListDto> musiclist=music_dao.selectMusicList();
    	 request.setAttribute("musiclist", musiclist);
         dispatch("musicselect.jsp", request, response);
         
         //3-1.노래 추가
      }else if(command.equals("musicinsert")) {
         response.sendRedirect("musicinsert.jsp");
      //3-2.노래 검색
      }else if(command.equals("musicsearch")) {
    	  String music_name=request.getParameter("music_name");
    	  List<MusicListDto> musiclist=music_dao.musicSerach(music_name);
    	  request.setAttribute("musiclist", musiclist);
    	  dispatch("musicselect.jsp", request, response);
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
    	  int currentPage = Integer.parseInt(request.getParameter("currentPage"));
    	  PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, currentPage, free_dao.totalCount());
    	 
    	  if(currentPage < 1) {
    		  currentPage = 1;
    	  }
    	  System.out.println("현재 페이지 currentPage : " + currentPage );
    	  int currentGroup = (currentPage - 1) / pagePerGroup;
    	  System.out.println("현재 그룹 currentGroup : " + currentGroup);
    	  
    	  int startPageGroup = currentGroup * pagePerGroup + 1;
    	  if(startPageGroup < 1) {
    		  startPageGroup = 1;
    	  } 
    	  System.out.println("현재 그룹 첫 페이지 번호 startPageGroup : " + startPageGroup);
    	  
    	  int endPageGroup = startPageGroup + pagePerGroup - 1;
    	  int totalPageCount = (free_dao.totalCount() + countPerPage - 1) / countPerPage;
    	  System.out.println("전체 페이지 수 totalPageCount : " + totalPageCount);
    	  
    	  if(endPageGroup >= totalPageCount) {
    		  endPageGroup = totalPageCount;
    	  } 
    	  System.out.println("현재 그룹 마지막 페이지 번호 endPageGroup : " + endPageGroup);
    	  
    	  int startWrite = (countPerPage*(currentPage-1)) + 1;
    	  int endWrite = startWrite + countPerPage;
    	  System.out.println("페이지 당 최근 글 RowNumber startWrite : " + startWrite);
    	  System.out.println("페이지 당 마지막 글 RowNumber endWrite : " + endWrite);
    	  
    	  request.setAttribute("navi", navi);
    	  request.setAttribute("startPage", startPageGroup);
    	  request.setAttribute("endPage", endPageGroup);
    	  request.setAttribute("totalPageCount", totalPageCount);
    	  
    	  request.setAttribute("startWrite", startWrite);
    	  request.setAttribute("endWrite", endWrite);
    	  
    	  dispatch("free_boardlist.jsp", request, response);
         
      //5-1.자유게시판 글 작성페이지
      }else if(command.equals("freeinsertpage")) {
         if(session.getAttribute("login")==null) {
            jsResponse("먼저 로그인을 해 주세요", "move.do?command=freeboard&currentPage=1", response);
         }else {
            response.sendRedirect("free_insertpage.jsp");
      }
      //5-2.자유게시판 글 자세히 보기 페이지
      }else if(command.equals("freeselectpage")) {
         int free_no=Integer.parseInt(request.getParameter("free_no"));
         int res=free_dao.freeview(free_no);
         Free_BoardDto dto=free_dao.selectOne(free_no);
         List<CommentDto> comment_list=comment_dao.selectFreeList(free_no);
         request.setAttribute("comment_list", comment_list);
         //int res=dao.freeview(free_no);
         request.setAttribute("dto", dto);
         dispatch("free_boardselect.jsp", request, response);   
      //5-3.자유게시판 수정페이지 이동
      }else if(command.equals("freeupdatepage")) {
         int free_no=Integer.parseInt(request.getParameter("free_no"));
         Free_BoardDto dto=free_dao.selectOne(free_no);
         request.setAttribute("dto", dto);
         dispatch("free_update.jsp", request, response);
      //5-4.자유게시판 수정
      }else if(command.equals("freeupdateres")) {
         int free_no=Integer.parseInt(request.getParameter("free_no"));
         String free_title=request.getParameter("free_title");
         String free_content=request.getParameter("free_content");
         Free_BoardDto dto=new Free_BoardDto(free_title, free_content);
         dto.setFree_no(free_no);
         request.setAttribute("dto", dto);
         dispatch("board.do?command=free_update", request, response);
      //5-5.자유 게시판 삭제
      }else if(command.equals("freedelete")) {
         int free_no=Integer.parseInt(request.getParameter("free_no"));
         request.setAttribute("free_no", free_no);
         dispatch("board.do?command=free_delete", request, response);
         
      //5-6댄스게시판
      }else if(command.equals("danceboard")) {
    	  int currentPage = Integer.parseInt(request.getParameter("currentPage"));
    	  PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, currentPage, dance_dao.totalCount());
    	 
    	  if(currentPage < 1) {
    		  currentPage = 1;
    	  }
    	  System.out.println("현재 페이지 currentPage : " + currentPage );
    	  int currentGroup = (currentPage - 1) / pagePerGroup;
    	  System.out.println("현재 그룹 currentGroup : " + currentGroup);
    	  
    	  int startPageGroup = currentGroup * pagePerGroup + 1;
    	  if(startPageGroup < 1) {
    		  startPageGroup = 1;
    	  } 
    	  System.out.println("현재 그룹 첫 페이지 번호 startPageGroup : " + startPageGroup);
    	  
    	  int endPageGroup = startPageGroup + pagePerGroup - 1;
    	  int totalPageCount = (dance_dao.totalCount() + countPerPage - 1) / countPerPage;
    	  System.out.println("전체 페이지 수 totalPageCount : " + totalPageCount);
    	  
    	  if(endPageGroup >= totalPageCount) {
    		  endPageGroup = totalPageCount;
    	  } 
    	  System.out.println("현재 그룹 마지막 페이지 번호 endPageGroup : " + endPageGroup);
    	  
    	  int startWrite = (countPerPage*(currentPage-1)) + 1;
    	  int endWrite = startWrite + countPerPage;
    	  System.out.println("페이지 당 최근 글 RowNumber startWrite : " + startWrite);
    	  System.out.println("페이지 당 마지막 글 RowNumber endWrite : " + endWrite);
    	  
    	  request.setAttribute("navi", navi);
    	  request.setAttribute("startPage", startPageGroup);
    	  request.setAttribute("endPage", endPageGroup);
    	  request.setAttribute("totalPageCount", totalPageCount);
    	  
    	  request.setAttribute("startWrite", startWrite);
    	  request.setAttribute("endWrite", endWrite);
    	  
    	  dispatch("dance_boardlist.jsp", request, response);
                  
      //5-7.댄스게시판 글 작성페이지
      }else if(command.equals("danceinsertpage")) {
         if(session.getAttribute("login")==null) {
            jsResponse("먼저 로그인을 해 주세요", "move.do?command=danceboard&currentPage=1", response);
         }else {
            response.sendRedirect("dance_insertpage.jsp");
      }
      //5-8.댄스게시판 글 자세히 보기 페이지
      }else if(command.equals("selectdancepage")) {
         int dance_no=Integer.parseInt(request.getParameter("dance_no"));
         int res=dance_dao.danceview(dance_no);
         Dance_BoardDto dto=dance_dao.selectOne(dance_no);
         request.setAttribute("dto", dto);
         dispatch("dance_boardselect.jsp", request, response);   
      //5-9.댄스게시판 수정페이지 이동
      }else if(command.equals("danceupdatepage")) {
         int dance_no=Integer.parseInt(request.getParameter("dance_no"));
         Dance_BoardDto dto=dance_dao.selectOne(dance_no);
         request.setAttribute("dto", dto);
         dispatch("dance_update.jsp", request, response);
      //5-10.댄스게시판 수정
      }else if(command.equals("danceupdateres")) {
         int dance_no=Integer.parseInt(request.getParameter("dance_no"));
         String dance_title=request.getParameter("dance_title");
         String dance_content=request.getParameter("dance_content");
         Dance_BoardDto dto=new Dance_BoardDto(dance_title, dance_content);
         dto.setDance_no(dance_no);
         request.setAttribute("dto", dto);
         dispatch("board.do?command=dance_update", request, response);
      //5-11.댄스 게시판 삭제
      }else if(command.equals("dancedelete")) {
         int dance_no=Integer.parseInt(request.getParameter("dance_no"));
         request.setAttribute("dance_no", dance_no);
         dispatch("board.do?command=dance_delete", request, response);
      
       //5-12 노래게시판
      }else if(command.equals("songboard")) {
    	  int currentPage = Integer.parseInt(request.getParameter("currentPage"));
    	  PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, currentPage, song_dao.totalCount());
    	 
    	  if(currentPage < 1) {
    		  currentPage = 1;
    	  }
    	  System.out.println("현재 페이지 currentPage : " + currentPage );
    	  int currentGroup = (currentPage - 1) / pagePerGroup;
    	  System.out.println("현재 그룹 currentGroup : " + currentGroup);
    	  
    	  int startPageGroup = currentGroup * pagePerGroup + 1;
    	  if(startPageGroup < 1) {
    		  startPageGroup = 1;
    	  } 
    	  System.out.println("현재 그룹 첫 페이지 번호 startPageGroup : " + startPageGroup);
    	  
    	  int endPageGroup = startPageGroup + pagePerGroup - 1;
    	  int totalPageCount = (song_dao.totalCount() + countPerPage - 1) / countPerPage;
    	  System.out.println("전체 페이지 수 totalPageCount : " + totalPageCount);
    	  
    	  if(endPageGroup >= totalPageCount) {
    		  endPageGroup = totalPageCount;
    	  } 
    	  System.out.println("현재 그룹 마지막 페이지 번호 endPageGroup : " + endPageGroup);
    	  
    	  int startWrite = (countPerPage*(currentPage-1)) + 1;
    	  int endWrite = startWrite + countPerPage;
    	  System.out.println("페이지 당 최근 글 RowNumber startWrite : " + startWrite);
    	  System.out.println("페이지 당 마지막 글 RowNumber endWrite : " + endWrite);
    	  
    	  request.setAttribute("navi", navi);
    	  request.setAttribute("startPage", startPageGroup);
    	  request.setAttribute("endPage", endPageGroup);
    	  request.setAttribute("totalPageCount", totalPageCount);
    	  
    	  request.setAttribute("startWrite", startWrite);
    	  request.setAttribute("endWrite", endWrite);
    	  
    	  dispatch("song_boardlist.jsp", request, response);
                  
      //5-13.노래게시판 글 작성페이지
      }else if(command.equals("songinsertpage")) {
         if(session.getAttribute("login")==null) {
            jsResponse("먼저 로그인을 해 주세요", "move.do?command=songboard&currentPage=1", response);
         }else {
            response.sendRedirect("song_insertpage.jsp");
      }
      //5-14.노래게시판 글 자세히 보기 페이지
      }else if(command.equals("songselectpage")) {
         int song_no=Integer.parseInt(request.getParameter("song_no"));
         int res=song_dao.songview(song_no);
         Song_BoardDto dto=song_dao.selectOne(song_no);
         request.setAttribute("dto", dto);
         dispatch("song_boardselect.jsp", request, response);   
      //5-15.노래게시판 수정페이지 이동
      }else if(command.equals("songupdatepage")) {
         int song_no=Integer.parseInt(request.getParameter("song_no"));
         Song_BoardDto dto=song_dao.selectOne(song_no);
         request.setAttribute("dto", dto);
         dispatch("song_update.jsp", request, response);
      //5-16.노래게시판 수정
      }else if(command.equals("songupdateres")) {
         int song_no=Integer.parseInt(request.getParameter("song_no"));
         String song_title=request.getParameter("song_title");
         String song_content=request.getParameter("song_content");
         Song_BoardDto dto=new Song_BoardDto(song_title, song_content);
         dto.setSong_no(song_no);
         request.setAttribute("dto", dto);
         dispatch("board.do?command=song_update", request, response);
      //5-17.노래게시판 삭제
      }else if(command.equals("songdelete")) {
         int song_no=Integer.parseInt(request.getParameter("song_no"));
         request.setAttribute("song_no", song_no);
         dispatch("board.do?command=song_delete", request, response);

     	//6.문의게시판 보기
		}else if(command.equals("qnaboard")) {
			response.sendRedirect("qna_boardlist.jsp");

		// 6-1. 문의게시판 글쓰기
		} else if (command.equals("qnainsertpage")) {
			if (session.getAttribute("login") == null) {
				jsResponse("먼저 로그인을 해 주세요", "move.do?command=qnaboard", response);
			} else {
				response.sendRedirect("qna_insertpage.jsp");
			}
		// 6-2.문의게시판 글 자세히 보기 페이지
		} else if (command.equals("selectpage")) {
			int qna_no = Integer.parseInt(request.getParameter("qna_no"));
			int res = qna_dao.qnaview(qna_no);
			QNA_BoardDto dto = qna_dao.selectOne(qna_no);
			request.setAttribute("dto", dto);
			dispatch("qna_boardselect.jsp", request, response);
		// 6-3.문의게시판 수정페이지 이동
		} else if (command.equals("updatepage")) {
			int qna_no = Integer.parseInt(request.getParameter("qna_no"));
			QNA_BoardDto dto = qna_dao.selectOne(qna_no);
			request.setAttribute("dto", dto);
			dispatch("qna_update.jsp", request, response);
		// 6-4.문의게시판 수정
		} else if (command.equals("updateres")) {
			int qna_no = Integer.parseInt(request.getParameter("qna_no"));
			String qna_title = request.getParameter("qna_title");
			String qna_content = request.getParameter("qna_content");
			QNA_BoardDto dto = new QNA_BoardDto(qna_title, qna_content);
			dto.setQna_no(qna_no);
			request.setAttribute("dto", dto);
			dispatch("qna.do?command=qna_update", request, response);
		// 6-5..문의 게시판 삭제
		} else if (command.equals("delete")) {
			int qna_no = Integer.parseInt(request.getParameter("qna_no"));
			request.setAttribute("qna_no", qna_no);
			dispatch("qna.do?command=qna_delete", request, response);
         
         
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
      }else if(command.equals("admin")) {
    	  response.sendRedirect("admin.jsp");
      //13-1.회원목록보기
      }else if(command.equals("adminview")) {
          int member_seq=Integer.parseInt(request.getParameter("member_seq"));
          Member_BoardDto dto=dao.selectOne(member_seq);
          request.setAttribute("dto", dto);
          dispatch("adminview.jsp", request, response);
      //13-2.문의게시판
      }else if(command.equals("qnaboard")) {
    	  response.sendRedirect("qna_boardlist.jsp");
      } else if (command.equals("selectpage")) {
			int qna_no = Integer.parseInt(request.getParameter("qna_no"));
			int res = qna_dao.qnaview(qna_no);
			QNA_BoardDto dto = qna_dao.selectOne(qna_no);
			request.setAttribute("dto", dto);
			dispatch("qna_boardselect.jsp", request, response);
    	//13-3.결제내역 확인  
          
         
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

}
