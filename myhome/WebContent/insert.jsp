<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("utf-8");
%>
<!-- 넘어온 데이터 넣기 -->
<jsp:useBean id="stdto" class="my.student.StudentDTO" />
<jsp:setProperty property="*" name="stdto" />

<!-- DAO객체 만들기 -->
<jsp:useBean id="stdao" class="my.student.StudentDAO" />

<%
	if (stdto.getId() == null || stdto.getId().trim().equals("") || 
		stdto.getPass() == null || stdto.getPass().trim().equals("") ||
		stdto.getName() == null || stdto.getName().trim().equals("") || 
		stdto.getCname() == null || stdto.getCname().trim().equals("")){
		response.sendRedirect("student.jsp");
		return;
	}
	int res = stdao.insertStudent(stdto);
	String msg = null, url = null;
	if (res > 0){
		msg = "학생등록 성공!! 학생목록페이지로 이동합니다.";
		url = "list.jsp";
	}else { 
		msg = "학생등록 실패!! 학생등록페이지로 이동합니다.";
		url = "student.jsp";
	}
%>
<script type="text/javascript">
    alert("<%= msg %>");
    location.href="<%= url %>";
</script>