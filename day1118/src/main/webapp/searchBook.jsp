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
	<h2>��õ ����</h2>
	<form action="searchBook.jsp" method="post">
	���̸��� �Է��ϼ���==><input type="text" name="name">
	<input type="submit" value="Ȯ��">
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
						<td>������ȣ</td>
						<td>�����̸�</td>
						<td>���ǻ��</td>
						<td>��������</td>
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