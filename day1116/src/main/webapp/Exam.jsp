<%@page import="com.sist.vo.ExamVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sist.dao.ExamDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h2>�����̸�,�󿵰���ȣ,��ȭ����,��¥,�¼���ȣ,���� ���</h2>
	<form action="Exam.jsp" method="post">
	�����̸��� �Է��ϼ���==><input type="text" name= "name">
	<input type="submit" value="Ȯ��">
	
	</form>
	
	<%
	request.setCharacterEncoding("euc-kr");
	if(request.getParameter("name")!=null){
		String name = request.getParameter("name");
		ExamDAO dao = new ExamDAO();
		ArrayList<ExamVO> list = dao.listCustomer(name);
		%>
		<table border ="1">
		<tr>
				<td>�����̸�</td>
				<td>�󿵰���ȣ</td>
				<td>��ȭ����</td>
				<td>��¥</td>
				<td>�¼���ȣ</td>
				<td>����</td>
		</tr>
		<%
		for(ExamVO e : list){
			%>
			<tr>
				<td><%=e.getTheater() %></td>
				<td><%=e.getCinemanumber() %></td>
				<td><%=e.getTitle() %></td>
				<td><%=e.getDate() %></td>
				<td><%=e.getSeatnumber() %></td>
				<td><%=e.getPrice() %></td>
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