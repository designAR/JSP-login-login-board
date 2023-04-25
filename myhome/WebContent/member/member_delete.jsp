<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- member_delete.jsp -->
<title>Insert title here</title>
<jsp:useBean id="mbdao" class="my.member.MemberDAO" />
<%@ include file="../top.jsp" %>
</head>
<body>
<%
	String no = request.getParameter("no");
	if(no == null || no.trim().equals("")){
		response.sendRedirect("memberAll.jsp");
		return;
	}
	
	int res = mbdao.deleteMember(Integer.parseInt(no));
	String msg = null, url = "memberAll.jsp";
	if(res > 0){
		msg = "회원삭제에 성공하였습니다!! 회원목록페이지로 이동합니다.";
	}else{
		msg = "회원삭제에 실패하였습니다!! 회원목록페이지로 이동합니다.";
	}
%>
<script type="text/javascript">
	alert("<%=msg%>")
	location.href="<%=url%>"
</script>
</body>
</html>
<%@ include file="../bottom.jsp" %>