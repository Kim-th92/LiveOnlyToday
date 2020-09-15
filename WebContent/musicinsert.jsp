<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="board.do" method="post" enctype="multipart/form-data">
		<input type="hidden" value="musicinsert" name="command">
		<table>
			<tr>
				<th>노래제목:</th>
				<th>가수이름:</th>
				<th>음악파일:</th>
				<th>가사파일:</th>
			</tr>
			<tr>
				<td>
					<input type="text" name="music_name"/>
				</td>
				<td>
					<input type="text" name="music_artist"/>
				</td>
				<td>
					<input type="file" name="music_file"/>
				</td>
				<td>
					<input type="file" name="music_subtitle">
				</td>
			</tr>
			<tr>
				<td colspan="4" align="right">
					<input type="submit" value="노래추가"/>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>