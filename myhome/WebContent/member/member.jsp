<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member</title>
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
%>
<script type="text/javascript">
	function check(){
		if(f.id.value == ""){
			alert("아이디를 입력해주세요!");
			f.id.focus()
			return
		}
		if(f.passwd.value == ""){
			alert("비밀번호를 입력해주세요!");
			f.passwd.focus()
			return
		}
		document.f.submit()
	}
</script>
</head>
<body onload="f.name.focus()">
<form name="f" action="member_input.jsp" method="post">
	<table width="600" align="center" class="outline">
		<tr>
		 <td colspan="2" align="center" class="m2">회원가입?</td>
		</tr> 
		<tr>
		 <td width="150" class="m3">이름</td>
		 <td class="m3">
		  <input type="text" name="name" class="box" value="<%=name %>" readOnly>
		 </td>
		</tr>
		<tr>
		 <td width="150" class="m3">아이디</td>
		 <td class="m3">
		  <input type="text" name="id" class="box">
		 </td>
		</tr>
		<tr>
		 <td width="150" class="m3">비밀번호</td>
		 <td class="m3">
		  <input type="password" name="passwd" class="box">
		 </td>
		</tr>
		<tr>
		 <td width="150" class="m3">주민번호</td>
		 <td class="m3">
		  <input type="text" name="ssn1" class="box" value="<%=ssn1%>" readOnly> -
		  <input type="text" name="ssn2" class="box" value="<%=ssn2 %>" readOnly>
		 </td>
		</tr>
		<tr>
		 <tr>
		 <td width="150" class="m3">이메일</td>
		 <td class="m3">
		  <input type="email" name="email" class="box">
		 </td>
		</tr>
		<tr>
		 <td width="150" class="m3">전화번호</td>
		 <td class="m3">
		  <input type="text" name="hp1" class="box" size="3" maxlength="3"> - 
		  <input type="text" name="hp2" class="box" size="4" maxlength="4"> - 
		  <input type="text" name="hp3" class="box" size="4" maxlength="4"> - 
		 </td>
		</tr>
		<tr>
		 <td colspan="2" align="center">
			<input type="button" value="회원가입" onclick="check()">
			<input type="reset" value="취소">
		 </td>
		</tr>
	</table>
</form>
</body>
</html>