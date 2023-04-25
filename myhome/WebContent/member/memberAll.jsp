<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, my.member.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberAll</title>
<%@include file="../top.jsp"%>
<script type="text/javascript">
	function checkDel(no){
		var isDel = window.confirm("회원을 삭제하시겠습니까?")
		if (isDel){
			location.href="member_delete.jsp?no=" + no
		}
	}
</script>
</head>
<div align="center">
	<hr color="green" width="300">
	<h2>회원목록</h2>
	<hr color="green" width="300">
	<table border="1" width="100%">
		<tr bgcolor="yellow">
	   <th>번호</th>
	   <th>이름</th>
	   <th>아이디</th>
	   <th>이메일</th>
	   <th>전화번호</th>
	   <th>가입날짜</th>
	   <th>수정 | 삭제</th>
	  </tr>
<jsp:useBean id="mbdao" class="my.member.MemberDAO" />
<%	List<MemberDTO> list = mbdao.listMember(); 
	if (list == null || list.size() == 0){%>
		<tr>
			<td colspan="7">회원목록</td>
		</tr>
<%	}else { 
		for(MemberDTO dto : list) {%>	
		<tr>
			<td><%=dto.getNo()%></td>
			<td><%=dto.getName()%></td>
			<td><%=dto.getId()%></td>
			<td><%=dto.getEmail()%></td>
			<td><%=dto.getAllHp()%></td>
			<td><%=dto.getJoindate()%></td>
			<td>
			<a href="member_update.jsp?no=<%=dto.getNo()%>">수정</a> | 
			<a href="javascript:checkDel('<%=dto.getNo()%>')">삭제</a></td>
		</tr>
<%		}
	}%>
	</table>
</div>
<%@include file="../bottom.jsp" %>
</html>