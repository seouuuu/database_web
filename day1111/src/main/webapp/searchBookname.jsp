<%@page import="com.sist.exam.BookVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sist.exam.BookDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="searchBookname.jsp" method="post">
		���̸��� �Է��ϼ��� ==> <input type="text" name="name">
		<input type="submit" value="�˻�">
	</form>
		<%
		request.setCharacterEncoding("euc-kr");
		if(request.getParameter("name") != null){
			String bookname = request.getParameter("name");
			BookDAO dao = new BookDAO();
			ArrayList<BookVO> list =dao.searchBook(bookname);
		%>
			<table border="1" width="80%">
				<tr>
					<td>�����̸�</td>
				</tr>
				
				<% 
					for(BookVO b: list){
						%>
							<tr>
								<td><%=b.getBookname() %></td>
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