<%@page import="my.board.BoardDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- list.jsp -->
<title>list</title>
</head>
<body>
<%@include file="../top.jsp"%>
<div align="center">
	<b>게시판</b>
	<table border="0" width="100%">
		<tr bgcolor="yellow">
		 <td align="right"><a href="writeForm.jsp">글쓰기</a></td>
		</tr>
	</table>
	<table border="1" width="100%">
		<tr bgcolor="green">
		 <th>번호</th>
		 <th width="30%">게시글제목</th>
		 <th>작성자</th>
		 <th>작성일</th>
		 <th>조회수</th>
		 <th>IP</th>
		</tr>
<jsp:useBean id="bdao" class="my.board.BoardDAO" />
<%
	List<BoardDTO> list = bdao.listBoard();
	if (list == null || list.size() == 0){%>
		<tr>
			<td colspan="6">등록된 게시물이 없습니다..</td>
		</tr>		
<%	}else {
		for(BoardDTO dto : list){%>
		<tr>
			<td><%=dto.getNum()%></td>
			<td><a href="content.jsp?num=<%=dto.getNum()%>"><%=dto.getSubject()%></a></td>
			<td><%=dto.getWriter()%></td>
			<td><%=dto.getReg_date()%></td>
			<td><%=dto.getReadcount()%></td>
			<td><%=dto.getIp()%></td>
		</tr>	
<%		}
	}
%>		
	</table>
</div>
<%@ include file="../bottom.jsp"%>
</body>
</html>