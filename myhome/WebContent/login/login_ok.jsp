<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="my.login.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- login_ok.jsp -->
<jsp:useBean id="loginCheck" class="my.login.LoginCheck" />
<jsp:setProperty property="*" name="loginCheck"/>
</head>
<body>
<%
	if (loginCheck.getId() == null || loginCheck.getId().trim().equals("")) {
		response.sendRedirect("login.jsp");
		return;
	}
	String saveId = request.getParameter("saveId");
	int res = loginCheck.checkLogin();
	String msg = null, url = null;
	switch(res){
	case LoginCheck.OK :
		msg = "로그인성공!!";
		url = request.getContextPath() + "/index.jsp";
		Cookie ck = new Cookie("saveId", loginCheck.getId());
		if(saveId != null){
			ck.setMaxAge(24*60*60);
		}else{
			ck.setMaxAge(0);
		}
		response.addCookie(ck);
		session.setAttribute("mbId", loginCheck.getId());
		break;
	case LoginCheck.NOT_ID :
		msg = "아이디가 존재하지 않습니다.";
		url = "login.jsp";
		break;
	case LoginCheck.NOT_PWD :
		msg = "비밀번호가 틀렸습니다.";
		url = "login.jsp";
		break;
	case LoginCheck.ERROR :
		msg = "존재하지 않는 회원입니다!!";
		url = request.getContextPath()+"/index.jsp";
	}
%>
<script type="text/javascript">
 alert("<%=msg%>")
 location.href="<%=url%>"
</script>
</body>
</html>