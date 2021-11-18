<%@page import="com.sist.vo.bookVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sist.dao.bookDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h2>추천 도서</h2>
	<form action="searchBook.jsp" method="post">
	고객이름을 입력하세요==><input type="text" name="name">
	<input type="submit" value="확인">
	</form>
	<%
	request.setCharacterEncoding("euc-kr");
	if(request.getParameter("name")!=null){
		String name = request.getParameter("name");
		bookDAO dao = new bookDAO();
		ArrayList<bookVO> list = dao.listbook(name);
	%>
				<table border="1">
					<tr>
						<td>도서번호</td>
						<td>도서이름</td>
						<td>출판사명</td>
						<td>도서가격</td>
					</tr>
				<%
				
				for(bookVO v: list){
						%>
						<tr>
							<td><%=v.getBookid() %></td>
							<td><%=v.getBookname() %></td>
							<td><%=v.getPublisher() %></td>
							<td><%=v.getPrice() %></td>
							
						</tr>
						<%
					}
				%>
				</table>
		<%
	}
	%>
</body>
</html>