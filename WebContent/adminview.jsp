<%@page import="com.whatsup.dto.Member_BoardDto"%>
<%@page import="java.util.List"%>
<%@page import="com.whatsup.dao.Member_BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	Member_BoardDao dao = new Member_BoardDao();
	List<Member_BoardDto> list = dao.selectList();
	Member_BoardDto dto=(Member_BoardDto)request.getAttribute("dto");
%>
</head>
<body>
<br>
<table class="table">
<tr>
	<td align="center" valign="middle" style="background-color: #FFFFCC">
		<form name="modifyFormAdmin" method="post" action=member_modify_admin_action.jsp>
			<table border="1">
				<tr>
					<td>회원번호</td>
					<td><input type="text" name="member_seq" size="5" value="<%=dto.getMember_seq() %>"></td>
				</tr>
				<tr>
					<td>아이디</td>
					<td><input type="text" name="id" value="<%=dto.getId() %>" /></td>
				</tr>

				<tr>
					<td>이름</td>
					<td><input type="text" name="name" size="15" value="<%=dto.getName() %>"></td>
				</tr>
                                                 <tr>
					<td>닉네임</td>
					<td><input type="text" name="nickname" size="10" value="<%=dto.getNickname()%>"></td>
				</tr>
                                                 <tr>
					<td>회원등급</td>
					<td><input type="text" name="grade" size="10" value="<%=dto.getGrade()%>"></td>
				</tr>

				<tr>
					<td>이메일</td>
					<td><input type="text" name="email" size="27" value="<%=dto.getEmail() %>"></td>
				</tr>
                                                 <tr>
					<td>생년월일</td>
					<td><input type="text" name="birthday" size="10" value="<%=dto.getBirthday()%>"></td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td><input type="text" name="phone" size="20" value="<%=dto.getPhone() %>"></td>
				</tr>

				<tr>
					<td>주소</td>
					<td><input type="text" name="addr" size="60" value="<%=dto.getAddr()%>"></td>
				</tr>

				<tr>
					<td>멤버십</td>
					<td><input type="text" name="membership" size="10" value="<%=dto.getMembership()%>"></td>
				</tr>


				<tr>
					<td colspan="2" align="center">

						<input type="button" value="수정완료" id="btnModify" />

						&nbsp;&nbsp;

						<input type="button" value="수정취소" id="btnModifyCancel" />

						<input type="button" value="회원삭제" id="btnDelete" />
					</td>
				</tr>
			</table>
		</form>
	</td>
</tr>

</table>
</body>
</html>