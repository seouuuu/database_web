<%@page import="com.sist.vo.BookVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sist.dao.BookDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="searchBook.jsp" method="post">
		�ݾ��� �Է��ϼ��� ==><input type="text" name ="price">
		<input type="submit" value ="�˻�">
	</form>
	
	<%
		if(request.getParameter("price") != null){
			int price = Integer.parseInt(request.getParameter("price"));
			BookDAO dao = new BookDAO();
			ArrayList<BookVO> list = dao.searchBook(price);
			%>
				<table>
					<tr>
						<td>������ȣ</td>
						<td>������</td>
						<td>���ǻ��</td>
						<td>����</td>
					</tr>
					<%
						for(BookVO b:list){
							%>
							<tr>
								<td><%=b.getBookid() %></td>
								<td><%=b.getBookname() %></td>
								<td><%=b.getPublisher() %></td>
								<td><%=b.getPrice() %></td>
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