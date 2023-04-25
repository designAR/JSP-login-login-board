<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- memberSsn.jsp -->
<html>
<head>
	<title>회원등록</title>
</head>
<body>
	<div align="center">
		<hr color="green" width="300">
		<h2>회원등록</h2>
		<hr color="green" width="300">
		<form name="f" action="checkMember.jsp" method="post">
			<table border="1" width="500">
				<tr>
					<th>이름</th>
					<td><input type="text" name="name"></td>
				</tr>			
				<tr>
					<th>주민번호</th>
					<td><input type="text" name="ssn1" maxlength="6"> -
					<input type="password" name="ssn2" maxlength="7"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="가입">
						<input type="reset" value="취소">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>