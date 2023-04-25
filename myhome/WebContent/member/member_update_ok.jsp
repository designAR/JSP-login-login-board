<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- member_update_ok.jsp -->
<%@ include file="../top.jsp" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="mbdto" class="my.member.MemberDTO" />
<jsp:setProperty property="*" name="mbdto" />
<jsp:useBean id="mbdao" class="my.member.MemberDAO" />
</head>
<body>
<%
	if(mbdto.getName() == null || mbdto.getName().trim().equals("")){
		response.sendRedirect("memberAll.jsp");
		return;
	}
	int res = mbdao.updateMember(mbdto);
	if(res > 0){%>
		<script type="text/javascript">
		 alert("회원정보수정에 성공하였습니다!! 회원목록페이지로 이동합니다.")
		 location.href="memberAll.jsp"
		</script>
<%}else{ %>
		<script type="text/javascript">
		 alert("회원정보수정에 실패하였습니다!. 회원목록페이지로 이동합니다.")
		 location.href="memberAll.jsp"
		</script>
<%} %>
</body>
</html>
<%@ include file="../bottom.jsp" %>