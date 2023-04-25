<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- delete.jsp -->
<jsp:useBean id="stdao" class="my.student.StudentDAO" />
<%
	String id = request.getParameter("id");
	if (id == null || id.trim().equals("")){
		response.sendRedirect("student.jsp");
		return;
	}
	
	int res = stdao.deleteStudent(id);
	String msg = null, url = null;
	if (res > 0){
		msg = "학생삭제 성공!! 학생목록페이지로 이동합니다.";
		url = "list.jsp";
	}else { 
		msg = "학생삭제 실패!! 학생등록페이지로 이동합니다.";
		url = "student.jsp";
	}
%>
<script type="text/javascript">
	alert("<%=msg%>")
	location.href="<%=url%>"
</script>