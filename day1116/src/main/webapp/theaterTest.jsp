<%@page import="com.sist.vo.TheaterVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sist.dao.TheaterDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
  <h2>�󿵰� ���� Ȯ��</h2>
	<form action="theaterTest.jsp" method="post">
	�����̸��� �Է��ϼ���==><input type="text" name="cinemaName">
	<input type="submit" value="Ȯ��">
	</form>
	
	<%
	request.setCharacterEncoding("euc-kr");
	if(request.getParameter("cinemaName")!=null){
		String cinemaName = request.getParameter("cinemaName");
		TheaterDAO dao = new TheaterDAO();
		ArrayList<TheaterVO> list = dao.listTheater(cinemaName);
		int total = dao.getTotalByCinemaName(cinemaName);
		%>
		<table border="1">
			<tr>
				<td>�����ȣ</td>
				<td>�󿵰���ȣ</td>
				<td>��ȭ����</td>
				<td>����</td>
				<td>�¼���</td>
			</tr>
			<%
				for(TheaterVO t : list){
					%>
					<tr>
						<td><%=t.getCinema_number() %></td>
						<td><%=t.getTheater_number() %></td>
						<td><%=t.getTitle() %></td>
						<td><%=t.getPrice() %></td>
						<td><%=t.getSeats() %></td>
					</tr>
					<%
				}
			%>
			
		</table>
		<br>
		������ �Ѽ���:<%=total %>
		<%
	}
	
	%>
</body>
</html>