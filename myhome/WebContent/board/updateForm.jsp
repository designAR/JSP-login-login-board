<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="my.board.*"%>
<!-- updateForm.jsp -->    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../top.jsp" %>
<jsp:useBean id="bdao" class="my.board.BoardDAO" />
<%
	String num = request.getParameter("num");
	if(num == null || num.trim().equals("")){
		response.sendRedirect("list.jsp");
		return;
	}
	
	BoardDTO dto = bdao.getBoard(Integer.parseInt(num), "update");
%>
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
	<form name="f" action="updatePro.jsp" method="post" onsubmit="return check()">
		<h3>게시슬수정</h3>
		<input type="hidden" name="num" value="<%=num %>"/>
		<table border="1" width="80%">
			<tr>
			 <td width="20%" bgcolor="yellow">작성자</td>
			 <td width="80%"><input type="text" name="writer" value="<%=dto.getWriter() %>"></td>
			</tr>
			<tr>
			 <td width="20%" bgcolor="yellow">제목</td>
			 <td width="80%"><input type="text" name="subject" value="<%=dto.getSubject() %>"></td>
			</tr>
			<tr>
			 <td width="20%" bgcolor="yellow">Email</td>
			 <td width="80%"><input type="text" name="Email" value="<%=dto.getEmail() %>"></td>
			</tr>
			<tr>
			 <td width="20%" bgcolor="yellow">글내용</td>
			 <td width="80%"><textarea rows="11" cols="50" name="content"><%=dto.getContent() %></textarea></td>
			</tr>
			<tr>
			 <td width="20%" bgcolor="yellow">비밀번호</td>
			 <td width="80%"><input type="password" name="passwd"></td>
			</tr>
			<tr bgcolor="yellow">
			 <td colspan="2" align="center">
			  <input type="submit" value="수정하기">
			  <input type="reset" value="다시쓰기">
			  <input type="button" value="목록으로" onclick="window.location='list.jsp'">
			 </td>
			</tr>
		</table> 
	</form>
</div>
<%@ include file="../bottom.jsp" %>
</body>
</html>