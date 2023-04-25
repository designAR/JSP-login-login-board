<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- deletePro.jsp -->    
<jsp:useBean id="bdao" class="my.board.BoardDAO"/>
<%
	String num = request.getParameter("num");
	String passwd = request.getParameter("passwd");
	if (num == null || num.trim().equals("")){
		response.sendRedirect("list.jsp");
		return;
	}
	if (passwd == null || passwd.trim().equals("")){%>
		<script type="text/javascript">
			alert("비밀번호를 확인해주세요!")
			history.back()
		</script>	
<%		return;
	}%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%
	
	int res = bdao.deleteBoard(Integer.parseInt(num), passwd);
	String msg = null, url = null;
	if(res > 0){
		msg = "게시글삭제성공!게시판목록으로 이동합니다.";
		url = "list.jsp";
	}else if(res < 0){
		msg = "비밀번호가 틀렸습니다! 비밀번호를 확인해주세요!";
		url = "deleteForm.jsp?num+" + num;
	}else{
		msg = "게시글삭제";
		url = "content.jsp?num" + num;
	}
%>
<script type="text/javascript">
	alert("<%=msg%>")
	location.href="<%=url%>"
</script>
</body>
</html>