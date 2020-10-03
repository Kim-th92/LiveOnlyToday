package com.whatsup.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.whatsup.dao.DanceAdminDao;
import com.whatsup.dto.DanceAdminDto;



@WebServlet("/dance.do")
public class DanceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	

    public DanceServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  request.setCharacterEncoding("UTF-8");
	      response.setContentType("text/html; charset=UTF-8");
	      String command=request.getParameter("command");
	      DanceAdminDao dao = new DanceAdminDao();
	      // 춤 따라하기 업로드
	      if("upload".equals(command)) {
	    	  String title = request.getParameter("danceadmintitle");
	    	  String src = request.getParameter("danceadminsrc");
	    	  String content = request.getParameter("danceadmincontent");
	    	  
	    	  String realSrc =src.replace(src.substring(src.indexOf("."), src.indexOf("e")+2), "be.com/embed/");
	    	  
	    	  DanceAdminDto dto = new DanceAdminDto();
	    	  dto.setDanceadmintitle(title);
	    	  dto.setDanceadminsrc(realSrc);
	    	  dto.setDancecontent(content);
	    	  
	    	  int res = dao.insertVideo(dto);
	    	  if(res>0) {
					jsResponse("글작성 성공","dancefollow_list.jsp", response);
				}else {
					jsResponse("글작성실패","dancefollow_upload.jsp", response);
				}
	    			  
	      }
	      // 춤 따라하기 리스트
	      else if("selectList".equals(command)) {
	    	  List<DanceAdminDto> list = dao.selectList();
	    	  request.setAttribute("list", list);
	    	  dispatch("dancefollow_list.jsp",request,response);
	      }
	      // 춤 따라하기 디테일
	      else if("selectOne".equals(command)) {
	    	  int danceadmin_seq = Integer.parseInt(request.getParameter("seq"));
	    	  DanceAdminDto dto = dao.selectOne(danceadmin_seq);
	    	  request.setAttribute("dto",dto );
	    	  dispatch("dancefollow_webcam.jsp",request,response);
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
