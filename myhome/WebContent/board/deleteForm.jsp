<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="my.board.*"%>
<!-- deleteForm.jsp -->    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../top.jsp" %>
<%
	String num = request.getParameter("num");
	if(num == null || num.trim().equals("")){
		response.sendRedirect("list.jsp");
		return;
	}
%>

</head>
<body>
<div align="center">
	<b>게시글삭제</b>
	<form name="f" action="deletePro.jsp" method="post">
		<input type="hidden" name="num" value="<%=num %>"/>
		<table border="1" width="80%">
			<tr bgcolor="yellow">
			 <th>게시글을 삭제하시겠습니까?</th>
			</tr>
			<tr>
			 <td align="center">
			   비밀번호 : <input type="password" name="passwd">
			 </td>
			</tr>
			<tr bgcolor="yellow">
			 <td align="center">
			  <input type="submit" value="삭제하기">
			  <input type="button" value="목록으로" onclick="window.location='list.jsp'">
			 </td>
			</tr>
		</table> 
	</form>
</div>
<%@ include file="../bottom.jsp" %>
</body>
</html>