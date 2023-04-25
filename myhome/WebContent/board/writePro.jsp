<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- writeForm.jsp -->    
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="bdto" class="my.board.BoardDTO" />
<jsp:setProperty property="*" name="bdto"/>
<jsp:useBean id="bdao" class="my.board.BoardDAO"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../top.jsp" %>
<%
	if(bdto.getWriter() == null || bdto.getWriter().trim().equals("")){
		response.sendRedirect("list.jsp");
		return;
	}
	String ip = request.getRemoteAddr();
	bdto.setIp(ip);
	int res = bdao.insertBoard(bdto);
	String msg = null, url = null;
	if(res > 0){
		msg = "글쓰기성공!게시판목록으로 이동합니다.";
		url = "list.jsp";
	}else{
		msg = "Error";
		url = "writeForm.jsp";
	}
%>
<script type="text/javascript">
	alert("<%=msg%>")
	location.href="<%=url%>"
</script>
<%@ include file="../bottom.jsp" %>
</body>
</html>