<%@page import="com.sist.vo.BookDAO"%>
<%@page import="com.sist.vo.BookVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>
			<td>도서번호</td>
			<td>도서이름</td>
		</tr>
		<%
		 BookDAO dao = new BookDAO();
		 ArrayList<BookVO> list = dao.listBook();
		 for(BookVO b:list){
			 %>
			 <tr>
				<td><%=b.getBookid() %></td>
				<td><a href="detailBook.jsp?bookid=<%=b.getBookid()%>"><%=b.getBookname() %></a></td>
			</tr>
			 <%
		 }
		%>
	</table>
</body>
</html>