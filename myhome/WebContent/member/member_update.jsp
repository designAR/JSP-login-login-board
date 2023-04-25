<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="my.member.*"%>
<!-- member_update.jsp -->
<jsp:useBean id="mbdao" class="my.member.MemberDAO" />
<%
	String no = request.getParameter("no");	
	if (no == null || no.trim().equals("")){
		response.sendRedirect("memberAll.jsp");
		return;
	}
	MemberDTO dto = mbdao.getMember(Integer.parseInt(no));
%>
<%@ include file="../top.jsp"%>
	<script type="text/javascript">
		function check(){
			if (f.passwd.value==""){
				alert("비밀번호를 입력해주세요!!")
				f.passwd.focus()
				return
			}
			document.f.submit()
		}		
	</script>
	<body onload="f.passwd.focus()">
		<form name="f" method="POST" action="member_update_ok.jsp">
			<input type="hidden" name="no" value="<%=no%>"/>
			<table width="600" border="1">
  				<tr bgcolor="yellow">
					<td colspan="2" align=center class="m2">회원정보수정</td>
 				</tr>
				<tr>
					<td width="150" class="m3">이름</td>
					<td class="m3">
						<input type="text" name="name" class="box" 
							value="<%=dto.getName()%>" readOnly>
					</td>
				</tr>
				<tr>
					<td width="150" class="m3">아이디</td>
					<td class="m3">
						<input type="text" name="id" class="box"
							value="<%=dto.getId()%>" readOnly>
					</td>
  				</tr>
  				<tr>
					<td width="150" class="m3">비밀번호</td>
					<td class="m3">
						<input type="password" name="passwd" class="box"
							value="<%=dto.getPasswd()%>">
					</td>
  				</tr>
  				<tr>
					<td width="150" class="m3">주민번호</td>
					<td class="m3">
						<input type="text" name="ssn1" class="box"
							value="<%=dto.getSsn1()%>" readOnly> -
						<input type="password" name="ssn2" class="box"
							value="<%=dto.getSsn2()%>" readOnly>
					</td>
  				</tr>
  				<tr>
					<td width="150" class="m3">이메일</td>
					<td class="m3">
						<input type="text" name="email" class="box"
							value="<%=dto.getEmail()%>">
					</td>
  				</tr>
  				<tr>
					<td width="150" class="m3">전화번호</td>
					<td class="m3">
						<input type="text" name="hp1" class="box" 
						size="3" maxlength="3" value="<%=dto.getHp1()%>"> -
						<input type="text" name="hp2" class="box" 
						size="4" maxlength="4" value="<%=dto.getHp2()%>"> -
						<input type="text" name="hp3" class="box" 
						size="4" maxlength="4" value="<%=dto.getHp3()%>">
					</td>
  				</tr>
  				<tr>
					<td colspan="2" align="center">
					    <input type="button" value="수정하기" onclick="check()">
					    <input type="reset" value="취소">
					</td> 
  				</tr>
  			</table>
		</form>
	</body>
<%@ include file="../bottom.jsp"%>