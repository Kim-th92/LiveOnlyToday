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

import com.sun.org.apache.bcel.internal.classfile.Field;
import com.sun.org.apache.bcel.internal.generic.NEWARRAY;
import com.whatsup.dao.CommentDao;

import com.whatsup.dao.Dance_BoardDao;
import com.whatsup.dao.Free_BoardDao;
import com.whatsup.dao.QNA_BoardDao;
import com.whatsup.dao.QNA_CommentDao;
import com.whatsup.dao.Song_BoardDao;
import com.whatsup.dto.CommentDto;
import com.whatsup.dto.Dance_BoardDto;
import com.whatsup.dto.Free_BoardDto;
import com.whatsup.dto.Member_BoardDto;
import com.whatsup.dto.QNA_BoardDto;
import com.whatsup.dto.QNA_CommentDto;
import com.whatsup.dto.Song_BoardDto;

@WebServlet("/board.do")
public class BoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public BoardServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		String command = request.getParameter("command");

		Free_BoardDao free_dao = new Free_BoardDao();
		Song_BoardDao song_dao = new Song_BoardDao();
		Dance_BoardDao dance_dao = new Dance_BoardDao();
		QNA_BoardDao qna_dao = new QNA_BoardDao();
		CommentDao comment_dao = new CommentDao();
		QNA_CommentDao qna_comment_dao = new QNA_CommentDao();

		String fileSavePath = "upload";
		int uploadSizeLimit = 1000 * 1024 * 1024;
		String encType = "UTF-8";
		if (!ServletFileUpload.isMultipartContent(request)) {
			response.sendRedirect("dance_boardinsert.jsp");
		}

		ServletContext context = getServletContext();

		String uploadPath = context.getRealPath(fileSavePath);
		System.out.println(uploadPath);
		File isDir = new File(uploadPath);

		if (!isDir.isDirectory()) {

			System.out.println("디렉토리가 없습니다. 디렉토리를 새로 생성합니다.");

			isDir.mkdir();

		}

		MultipartRequest multi = new MultipartRequest(request, uploadPath, uploadSizeLimit, encType,
				new DefaultFileRenamePolicy());
		if (command == null) {
			command = multi.getParameter("command");
		}

		String file = multi.getFilesystemName("dance_file");

		// 자유게시판 추가

		if (command.equals("free_insert")) {
			int member_seq1;
			String free_title1;
			String free_content1;
			int res1;
			Free_BoardDto dto1 = new Free_BoardDto();

			if (file == null || file.trim() == "") {
				member_seq1 = Integer.parseInt(multi.getParameter("member_seq"));
				free_title1 = multi.getParameter("free_title");
				free_content1 = multi.getParameter("free_content");
				dto1 = new Free_BoardDto();
				dto1.setMember_seq(member_seq1);
				dto1.setFree_title(free_title1);
				dto1.setFree_content(free_content1);

				res1 = free_dao.insert(dto1);

				if (res1 > 0) {
					jsResponse("작성 성공", "move.do?command=freeboard&currentPage=1", response);
				} else {
					jsResponse("작성 실패", "move.do?command=freeinsertpage", response);
				}
			}

		} else if (command.equals("free_update")) {
//			Free_BoardDto dto = (Free_BoardDto) request.getAttribute("dto");
			int free_no=Integer.parseInt(multi.getParameter("free_no"));
			String free_title =  multi.getParameter("free_title");
			String free_content = multi.getParameter("free_content");
			Free_BoardDto dto = new Free_BoardDto();
			dto.setFree_no(free_no);
			dto.setFree_title(free_title);
			dto.setFree_content(free_content);
			int res = free_dao.update(dto);
			if (res > 0) {
				jsResponse("수정 성공", "move.do?command=freeselectpage&free_no=" + dto.getFree_no(), response);
			} else {
				jsResponse("수정 실패", "move.do?command=freeupdatepage&free_no=" + dto.getFree_no(), response);
			}
		} else if (command.equals("free_delete")) {
			int free_no = Integer.parseInt(multi.getParameter("free_no"));
			int res = free_dao.delete(free_no);
			if (res > 0) {
				jsResponse("삭제 성공", "move.do?command=freeboard&currentPage=1", response);
			} else {
				jsResponse("삭제 실패", "move.do?command=freeselectpage&free_no=" + free_no, response);
			}
			// 노래 게시판
		} else if (command.equals("song_insert")) {
			int member_seq2;
			String song_title2;
			String song_content2;
			int res2;
			Song_BoardDto dto = new Song_BoardDto();

			if (file == null || file.trim() == "") {
				member_seq2 = Integer.parseInt(multi.getParameter("member_seq"));
				song_title2 = multi.getParameter("song_title");
				song_content2 = multi.getParameter("song_content");
				dto = new Song_BoardDto();
				dto.setMember_seq(member_seq2);
				dto.setSong_title(song_title2);
				dto.setSong_content(song_content2);

				res2 = song_dao.insert(dto);

				if (res2 > 0) {
					jsResponse("작성 성공", "move.do?command=songboard&currentPage=1", response);
				} else {
					jsResponse("작성 실패", "move.do?command=songinsertpage", response);
				}
			}
		} else if (command.equals("song_update")) {
//			Song_BoardDto dto = (Song_BoardDto) request.getAttribute("dto");
			int song_no = Integer.parseInt(multi.getParameter("song_no"));
			String song_title = multi.getParameter("song_title");
			String song_content = multi.getParameter("song_content");
			Song_BoardDto dto = new Song_BoardDto();
			dto.setSong_no(song_no);
			dto.setSong_title(song_title);
			dto.setSong_content(song_content);
			int res = song_dao.update(dto);
			if (res > 0) {
				jsResponse("수정 성공", "move.do?command=songselectpage&song_no=" + dto.getSong_no(), response);
			} else {
				jsResponse("수정 실패", "move.do?command=songupdatepage&song_no=" + dto.getSong_no(), response);
			}
		} else if (command.equals("song_delete")) {
			int song_no = Integer.parseInt(multi.getParameter("song_no"));
			int res = song_dao.delete(song_no);
			if (res > 0) {
				jsResponse("삭제 성공", "move.do?command=songboard&currentPage=1", response);
			} else {
				jsResponse("삭제 실패", "move.do?command=songselectpage&song_no=" + song_no, response);
			}

			// 댄스게시판
		} else if ("dance_insert".equals(command)) {
			int member_seq;
			String dance_title;
			String dance_content;
			int res;
			Dance_BoardDto dto = new Dance_BoardDto();
			if (file == null || file.trim() == "") {
				member_seq = Integer.parseInt(multi.getParameter("member_seq"));
				dance_title = multi.getParameter("dance_title");
				dance_content = multi.getParameter("dance_content");
				dto = new Dance_BoardDto();
				dto.setMember_seq(member_seq);
				dto.setDance_title(dance_title);
				dto.setDance_content(dance_content);

				res = dance_dao.insert(dto);

				if (res > 0) {
					jsResponse("작성 성공", "move.do?command=danceboard&currentPage=1", response);
					System.out.println("1번 성공");
				} else {
					jsResponse("작성 실패", "move.do?command=danceinsertpage", response);
				}

			} else {
				if (dance_dao.selectFile(file) == null) {
					member_seq = Integer.parseInt(multi.getParameter("member_seq"));
					dance_title = multi.getParameter("dance_title");
					dance_content = multi.getParameter("dance_content");
					dto = new Dance_BoardDto();

					dto.setMember_seq(member_seq);
					dto.setDance_content(dance_content);
					dto.setDance_title(dance_title);
					dto.setDancerealfname(file);
					dto.setDancefname(file);
					dto.setDancerealpath(uploadPath);
					res = dance_dao.insertFile(dto);

					if (res > 0) {
						jsResponse("작성 성공", "move.do?command=danceboard&currentPage=1", response);
					} else {
						jsResponse("작성 실패", "move.do?command=danceinsertpage", response);
					}

				} else {
					member_seq = Integer.parseInt(multi.getParameter("member_seq"));
					dance_title = multi.getParameter("dance_title");
					dance_content = multi.getParameter("dance_content");
					String dancefname = file + Math.floor(Math.random() * 10000000);
					if (dance_dao.selectFile(dancefname) == null) {
						dto = new Dance_BoardDto();
						dto.setMember_seq(member_seq);
						dto.setDance_content(dance_content);
						dto.setDance_title(dance_title);
						dto.setDancerealfname(file);
						dto.setDancefname(dancefname);
						dto.setDancerealpath(uploadPath);
						res = dance_dao.insertFile(dto);

						if (res > 0) {
							jsResponse("작성 성공", "move.do?command=danceboard&currentPage=1", response);
						} else {
							jsResponse("작성 실패", "move.do?command=danceinsertpage", response);
						}
					}
				}
			}

		} else if (command.equals("dance_update")) {
			int dance_no;
			String dance_title;
			String dance_content;
			int res;
			Dance_BoardDto dto = new Dance_BoardDto();
			if (file == null || file.trim() == "") {
				dance_no = Integer.parseInt(multi.getParameter("dance_no"));
				dance_title = multi.getParameter("dance_title");
				dance_content = multi.getParameter("dance_content");
				dto = new Dance_BoardDto();
				dto.setDance_title(dance_title);
				dto.setDance_content(dance_content);
				dto.setDance_no(dance_no);
				res = dance_dao.update(dto);

				if (res > 0) {
					jsResponse("수정 성공", "move.do?command=danceselectpage&dance_no="+dto.getDance_no(), response);
				} else {
					jsResponse("수정 실패", "move.do?command=danceupdatepage&dance_no="+dto.getDance_no(), response);
				}

			} else {
				if (dance_dao.selectFile(file) == null) {
					dance_no = Integer.parseInt(multi.getParameter("dance_no"));
					dance_title = multi.getParameter("dance_title");
					dance_content = multi.getParameter("dance_content");
					dto = new Dance_BoardDto();
					dto.setDance_no(dance_no);
					dto.setDance_content(dance_content);
					dto.setDance_title(dance_title);
					dto.setDancerealfname(file);
					dto.setDancefname(file);
					dto.setDancerealpath(uploadPath);
					res = dance_dao.updateFile(dto);

					if (res > 0) {
						jsResponse("수정 성공", "move.do?command=danceselectpage&dance_no="+dto.getDance_no(), response);
					} else {
						jsResponse("수정 실패", "move.do?command=danceupdatepage&dance_no="+dto.getDance_no(), response);
					}

				} else {
					dance_no = Integer.parseInt(multi.getParameter("dance_no"));
					dance_title = multi.getParameter("dance_title");
					dance_content = multi.getParameter("dance_content");
					String dancefname = file + Math.floor(Math.random() * 10000000);
					if (dance_dao.selectFile(dancefname) == null) {
						dto = new Dance_BoardDto();
						dto.setDance_no(dance_no);
						dto.setDance_content(dance_content);
						dto.setDance_title(dance_title);
						dto.setDancerealfname(file);
						dto.setDancefname(dancefname);
						dto.setDancerealpath(uploadPath);
						res = dance_dao.updateFile(dto);

						if (res > 0) {
							jsResponse("수정 성공", "move.do?command=danceselectpage&dance_no="+dance_no, response);
						} else {
							jsResponse("수정 실패", "move.do?command=danceupdatepage&dance_no="+dance_no, response);
						}
					}
				}
			}
			
		} else if (command.equals("dance_delete")) {
			int dance_no = Integer.parseInt(multi.getParameter("dance_no"));
			int res = dance_dao.delete(dance_no);
			if (res > 0) {
				jsResponse("삭제 성공", "move.do?command=danceboard&currentPage=1", response);
			} else {
				jsResponse("삭제 실패", "move.do?command=danceselectpage&dance_no=" + dance_no, response);
			}
		} else if (command.equals("musicinsert")) {

			// 문의 게시판
		} else if (command.equals("qna_insert")) {
			int member_seq;
			String qna_title;
			String qna_content;
			int res;
			QNA_BoardDto dto = new QNA_BoardDto();

			if (file == null || file.trim() == "") {
				member_seq = Integer.parseInt(multi.getParameter("member_seq"));
				qna_title = multi.getParameter("qna_title");
				qna_content = multi.getParameter("qna_content");
				dto = new QNA_BoardDto();
				dto.setMember_seq(member_seq);
				dto.setQna_title(qna_title);
				dto.setQna_content(qna_content);

				res = qna_dao.insert(dto);

				if (res > 0) {
					jsResponse("작성 성공", "move.do?command=qnaboard&currentPage=1", response);
				} else {
					jsResponse("작성 실패", "move.do?command=qnainsertpage", response);
				}
			}

		} else if (command.equals("qna_update")) {
			int qna_no = Integer.parseInt(multi.getParameter("qna_no"));
			String qna_title = multi.getParameter("qna_title");
			String qna_content = multi.getParameter("qna_content");
			QNA_BoardDto dto = new QNA_BoardDto();
			dto.setQna_no(qna_no);
			dto.setQna_title(qna_title);
			dto.setQna_content(qna_content);
			int res = qna_dao.update(dto);
			if (res > 0) {
				jsResponse("수정 성공", "move.do?command=selectpageBasics&qna_no=" +qna_no , response);
			} else {
				jsResponse("수정 실패", "move.do?command=selectpageBasics&qna_no=" +qna_no, response);
			}
		} else if (command.equals("qna_delete")) {
			int qna_no = Integer.parseInt(multi.getParameter("qna_no"));
			int res = qna_dao.delete(qna_no);
			if (res > 0) {
				jsResponse("삭제 성공", "move.do?command=qnaboard&currentPage=1", response);
			} else {
				jsResponse("삭제 실패", "move.do?command=selectpage&qna_no=" + qna_no, response);
			}

		} else if (command.equals("qnacommentinsert")) {
			String qna_comment_content = multi.getParameter("qna_comment_content");
			int member_seq = Integer.parseInt(multi.getParameter("member_seq"));
			int qna_no = Integer.parseInt(multi.getParameter("qna_no"));
			QNA_CommentDto qna_comment_dto = new QNA_CommentDto();
			qna_comment_dto.setMember_seq(member_seq);
			qna_comment_dto.setQna_comment_content(qna_comment_content);
			qna_comment_dto.setQna_no(qna_no);
			int res = qna_comment_dao.insertQna_Commnet(qna_comment_dto);
			if (res > 0) {
				jsResponse("답글 작성 성공", "move.do?command=selectpageBasics&qna_no="+qna_no, response);
			} else {
				jsResponse("답글 작성 실패", "move.do?command=selectpageBasics&qna_no="+qna_no, response);
			}
		}else if(command.equals("qna_comment_delete")) {
			int qna_no=Integer.parseInt(multi.getParameter("qna_no"));
			QNA_CommentDto dto = new QNA_CommentDto();
			dto.setQna_no(qna_no);
			int res=qna_comment_dao.delete(qna_no);
			if(res>0) {
				jsResponse("답글 삭제", "move.do?command=selectpageBasics&qna_no="+qna_no, response);
			}else {
				jsResponse("답글 삭제 실패", "move.do?command=selectpageBasics&qna_no="+qna_no, response);
			}
		}
		// 댓글 작성
		else if(command.equals("free_comment_insert")) {
			int free_no=Integer.parseInt(multi.getParameter("free_no"));
			int member_seq=Integer.parseInt(multi.getParameter("member_seq"));
			String comment_content=multi.getParameter("comment_content");
			CommentDto dto=new CommentDto();
			dto.setComment_content(comment_content);
			dto.setFree_no(free_no);
			dto.setMember_seq(member_seq);
			int res=comment_dao.insertFree(dto);
			if(res>0) {
				jsResponse("댓글 작성", "move.do?command=freeselectpage&free_no="+free_no, response);
			}else {
				jsResponse("댓글 작성 실패", "move.do?command=streaminsertpage", response);
			}
			
			
		} else if (command.equals("dance_comment_insert")) {
			String comment_content = multi.getParameter("comment_content");
			int member_seq = Integer.parseInt(multi.getParameter("member_seq"));
			int dance_no = Integer.parseInt(multi.getParameter("dance_no"));
			CommentDto comment_dto = new CommentDto();
			comment_dto.setMember_seq(member_seq);
			comment_dto.setComment_content(comment_content);
			comment_dto.setDance_no(dance_no);
			int res = comment_dao.insertDance(comment_dto);
			if (res > 0) {
				jsResponse("댓글 작성 성공", "move.do?command=danceselectpage&dance_no="+dance_no, response);
			} else {
				jsResponse("댓글 작성 실패", "move.do?command=danceselectpage&dance_no="+dance_no, response);
			}

		} else if (command.equals("song_comment_insert")) {
			int song_no = Integer.parseInt(multi.getParameter("song_no"));
			int member_seq = Integer.parseInt(multi.getParameter("member_seq"));
			String comment_content = multi.getParameter("comment_content");
			
			CommentDto comment_dto = new CommentDto();
			comment_dto.setMember_seq(member_seq);
			comment_dto.setComment_content(comment_content);
			comment_dto.setSong_no(song_no);
			int res = comment_dao.insertSong(comment_dto);
			if (res > 0) {
				jsResponse("댓글 작성 성공", "move.do?command=songselectpage&song_no="+song_no, response);
			} else {
				jsResponse("댓글 작성 실패", "move.do?command=songselectpage&song_no="+song_no, response);
			}
			//댓글 삭제
			}else if(command.equals("dance_comment_delete")) {
				int comment_no=Integer.parseInt(multi.getParameter("comment_no"));
				int res=comment_dao.delete(comment_no);
				int dance_no=Integer.parseInt(multi.getParameter("dance_no"));
				if(res>0) {
					jsResponse("댓글 삭제", "move.do?command=danceselectpage&dance_no="+dance_no, response);
				}else {
					jsResponse("댓글 삭제 실패", "move.do?command=danceselectpage&dance_no="+dance_no, response);
				}
			}else if(command.equals("free_comment_delete")) {
				int comment_no=Integer.parseInt(multi.getParameter("comment_no"));
				int res=comment_dao.delete(comment_no);
				int free_no=Integer.parseInt(multi.getParameter("free_no"));
				if(res>0) {
					jsResponse("댓글 삭제", "move.do?command=freeselectpage&free_no="+free_no, response);
				}else {
					jsResponse("댓글 삭제 실패", "move.do?command=freeselectpage&free_no="+free_no, response);
				}
			}else if(command.equals("song_comment_delete")) {
				int comment_no=Integer.parseInt(multi.getParameter("comment_no"));
				int res=comment_dao.delete(comment_no);
				int song_no=Integer.parseInt(multi.getParameter("song_no"));
				if(res>0) {
					jsResponse("댓글 삭제", "move.do?command=songselectpage&song_no="+song_no, response);
				}else {
					jsResponse("댓글 삭제 실패", "move.do?command=songselectpage&song_no="+song_no, response);
				}
			}

		}

	private void jsResponse(String msg, String url, HttpServletResponse response) throws IOException {
		String result = "<script> alert(\"" + msg + "\"); location.href=\"" + url + "\"; </script> ";
		response.getWriter().append(result);

	}
}
