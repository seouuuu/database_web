<%@page import="com.sist.vo.OrdersVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sist.dao.OrdersDAO"%>
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
		����ȣ�� �Է��ϼ��� ==> <input type="text" name="custid">
		<input type="submit" value="�˻�">
	</form>
	
	<%
		if(request.getParameter("custid") != null){
			int custid = Integer.parseInt(request.getParameter("custid"));
			OrdersDAO dao = new OrdersDAO();
			ArrayList<OrdersVO> list = dao.searchOrders(custid);
			%>
			<table border="1">
				<tr>
					<td>�ֹ���ȣ</td>
					<td>����ȣ</td>
					<td>������ȣ</td>
					<td>���űݾ�</td>
					<td>���ų�¥</td>
				</tr>
				<%
					for(OrdersVO o:list){
				%>
							<tr>
								<td><%= o.getOrderid() %></td>
								<td><%= o.getCustid() %></td>
								<td><%= o.getBookid() %></td>
								<td><%= o.getSaleprice() %></td>
								<td><%= o.getOrderdate() %></td>
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