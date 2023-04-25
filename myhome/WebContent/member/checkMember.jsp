<%@page import="java.awt.Desktop.Action"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>checkMember</title>
</head>
<body>
<jsp:useBean id="mbdao" class="my.member.MemberDAO" />
<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	String ssn1 = request.getParameter("ssn1");
	String ssn2 = request.getParameter("ssn2");
	if (name == null || ssn1 == null || ssn2 == null || 
		name.trim().equals("") || ssn1.trim().equals("") || ssn2.trim().equals("")){
		response.sendRedirect("memberSsn.jsp");
		return;
	}
	
	boolean isMember = mbdao.checkMember(name, ssn1, ssn2);
	if (isMember) {	%>
	<script type="text/javascript">
		alert("이미 가입된 회원입니다!")
		self.close()
	</script>	
<%	}else {	%>
	<form name="f" action="member.jsp" method="post">
		<input type="hidden" name="name" value="<%=name%>"/>
		<input type="hidden" name="ssn1" value="<%=ssn1%>"/>
		<input type="hidden" name="ssn2" value="<%=ssn2%>"/>
	</form>
	<script type="text/javascript">
		alert("가입이 가능합니다!!")
		document.f.submit()
	</script>	
<%	}
%>
</body>
</html>