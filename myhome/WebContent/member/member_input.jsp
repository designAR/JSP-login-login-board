<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- member_input.jsp -->
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="mbdto" class="my.member.MemberDTO" />
<jsp:setProperty property="*" name="mbdto"/>
<jsp:useBean id="mbdao" class="my.member.MemberDAO" />
</head>
<body>
<%
	if(mbdto.getName() == null || mbdto.getName().trim().equals("")){
		response.sendRedirect("memberSsn.jsp");
		return;
	}
	int res = mbdao.insertMember(mbdto);
	if(res > 0){%>
	<script type="text/javascript">
	 alert("회원가입이 완료되었습니다!");
	 self.close()
	</script>
<%}else{ %>
	<script type="text/javascript">
	 alert("!!");
	 location.href="memberSsn.jsp"
	</script>
<%} %>	
</body>
</html>