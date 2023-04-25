<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- top.jsp -->
<html>
<head>
	<title>홈페이지</title>
	<script type="text/javascript">
		function checkMember(){
			window.open("<%=request.getContextPath()%>/member/memberSsn.jsp", "", "width=620, height=400")
		}
	</script>
</head>
<%
	String mbId = (String)session.getAttribute("mbId");
	boolean isLogin = false;
	if(mbId != null) isLogin = true;
%>
<body>
	<div align="center">
	<table border="1" width="800" height="600">
		<tr height="10%">
			<td colspan="2" align="center">
				<a href="<%=request.getContextPath() %>/index.jsp">main</a> |
		<% if(isLogin){ %>	
				<%= mbId %>님 환영합니다.			
				<a href="<%=request.getContextPath()%>/login/logout.jsp">로그아웃</a> |  
		<%}else{ %>
				<a href="javascript:checkMember()">회원가입</a> |
				<a href="<%=request.getContextPath()%>/login/login.jsp">로그인</a> |
		<%} %>
				<a href="<%=request.getContextPath()%>/member/memberAll.jsp">회원목록</a> |
				<a href="<%=request.getContextPath()%>/board/list.jsp">게시판</a> |
				<a href="<%=request.getContextPath()%>/company.jsp">회사소개</a>
		
			</td>
		</tr>
		<tr>
			<td width="20%">tree/view</td>
			<td width="80%">