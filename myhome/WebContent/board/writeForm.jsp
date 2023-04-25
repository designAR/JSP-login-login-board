<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- writeForm.jsp -->    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../top.jsp" %>
<script type="text/javascript">
	function check(){
		if(f.writer.value==""){
			alert("작성자를 입력해주세요!!");
			f.writer.focus()
			return false
		}
		if(f.subject.value==""){
			alert("제목를 입력해주세요!!");
			f.subject.focus()
			return false
		}
		if(f.content.value==""){
			alert("내용를 입력해주세요!!");
			f.content.focus()
			return false
		}
		if(f.passwd.value==""){
			alert("비밀번호를 입력해주세요!!");
			f.passwd.focus()
			return false
		}
		return true;
	}
</script>
</head>
<body>
<div align="center">
	<form name="f" action="writePro.jsp" method="post" onsubmit="return check()">
		<table border="1" width="80%">
			<tr bgcolor="yellow">
				<td align="center" colspan="2">게시글작성</td>
			</tr>
			<tr>
				<th width="30%" bgcolor="yellow">작성자</th>
				<td width="100%"><input type="text" name="writer"></td>
			</tr>
			<tr>
				<th width="30%" bgcolor="yellow">글제목</th>
				<td width="100%"><input type="text" name="subject" size="50"></td>
			</tr>
			<tr>
				<th width="30%" bgcolor="yellow">Email</th>
				<td width="100%"><input type="email" name="email" size="50"></td>
			</tr>
			<tr>
				<th width="30%" bgcolor="yellow">내용</th>
				<td width="100%"><textarea name="content" rows="11" cols="50"></textarea></td>
			</tr>
			<tr>
				<th width="30%" bgcolor="yellow">비밀번호</th>
				<td width="100%"><input type="password" name="passwd"></td>
			</tr>
			<tr bgcolor="yellow">
			 <td colspan="2" align="center">
			  <input type="submit" value="글등록">
			  <input type="reset" value="취소">
			  <input type="button" value="목록으로" onclick="window.location='list.jsp'">
			 </td>
			</tr>
		</table> 
	</form>
</div>
<%@ include file="../bottom.jsp" %>
</body>
</html>