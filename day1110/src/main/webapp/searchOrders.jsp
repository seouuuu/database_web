<%@page import="com.sist.vo.OrderBookCustomerVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sist.dao.OrdersBookCustomerDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="searchOrders.jsp" method="post">
		���̸��� �Է��ϼ��� ==> <input type="text" name="name">
		<input type="submit" value="�˻�">
	</form>
	
	<%
		request.setCharacterEncoding("euc-kr");
		if(request.getParameter("name") != null){
			String name = request.getParameter("name");
			OrdersBookCustomerDAO dao = new OrdersBookCustomerDAO();
			ArrayList<OrderBookCustomerVO> list =dao.listOrders(name);
			int total = dao.getTotalSalePrice(name);
		%>
			<table border="1" width="80%">
				<tr>
					<td>����ȣ</td>
					<td>���̸�</td>
					<td>�����̸�</td>
					<td>���ǻ��</td>
					<td>��������</td>
					<td>�ǸŰ���</td>
					<td>�Ǹ�����</td>
				</tr>
				<% 
					for(OrderBookCustomerVO o: list){
						%>
							<tr>
								<td><%=o.getCustid() %></td>
								<td><%=o.getName() %></td>
								<td><%=o.getBookname()%></td>
								<td><%=o.getPublisher()%></td>
								<td><%=o.getPrice() %></td>
								<td><%=o.getSaleprice() %></td>
								<td><%=o.getOrderdate() %></td>
							</tr>
						<%
					}
				
				%>
			
			</table>
			<br>
			<hr>
			���ֹ��ݾ� : <%=total %>
			<%
		}
	%>
</body>
</html>