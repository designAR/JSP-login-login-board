<%@page import="my.board.*"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- list.jsp -->
<title>list</title>
</head>
<body>
<jsp:useBean id="bdao" class="my.board.BoardDAO" />
<%
	String num = request.getParameter("num");
	if (num == null || num.trim().equals("")){
		response.sendRedirect("list.jsp");
		return;
	}
	
	BoardDTO dto = bdao.getBoard(Integer.parseInt(num), "content");
%>
<%@include file="../top.jsp"%>
<div align="center">
	<b>게시글</b>
	<table border="1" width="100%">
		<tr>
			<th bgcolor="yellow" width="20%">글번호</th>
			<td width="30%"><%=dto.getNum()%></td>
			<th bgcolor="yellow" width="20%">조회수</th>
			<td width="30%"><%=dto.getReadcount()%></td>
		</tr>
		<tr>
			<th bgcolor="yellow" width="20%">작성자</th>
			<td width="30%"><%=dto.getWriter()%></td>
			<th bgcolor="yellow" width="20%">작성일</th>
			<td width="30%"><%=dto.getReg_date()%></td>
		</tr>
		<tr>
			<th bgcolor="yellow" width="20%">제목</th>
			<td width="80%" colspan="3"><%=dto.getSubject()%></td>
		</tr>
		<tr>
			<th bgcolor="yellow" width="20%">내용</th>
			<td width="80%" colspan="3"><%=dto.getContent()%></td>
		</tr>
		<tr bgcolor="yellow">
		 <td colspan="4" align="right">
		  <input type="button" value="수정하기" onclick="window.location='updateForm.jsp?num=<%=dto.getNum() %>'">&nbsp;&nbsp;&nbsp;&nbsp;
		  <input type="button" value="삭제하기" onclick="window.location='deleteForm.jsp?num=<%=dto.getNum() %>'">&nbsp;&nbsp;&nbsp;&nbsp;
		  <input type="button" value="목록으로" onclick="window.location='list.jsp'">
		 </td>
		</tr>
	</table>
</div>
<%@ include file="../bottom.jsp"%>
</body>
</html>