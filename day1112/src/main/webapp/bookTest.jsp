<%@page import="com.sist.dao.BookDao"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action ="bookTest.jsp" method="post">
		���̸��� �Է��ϼ���==><input type= "text" name="name">
		<input type= "submit" value="Ȯ��">
	</form>
	<%
		request.setCharacterEncoding("euc-kr");
		if(request.getParameter("name") != null){
			String name = request.getParameter("name");
			BookDao dao = new BookDao();
			ArrayList<String> list = dao.getNotPurchased(name);
			%>
				<table border ="1">
					<tr>
						<td>������</td>
					</tr>
					<%
						for(String bookname : list){
							%>
								<tr>
									<td><%= bookname %></td>
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