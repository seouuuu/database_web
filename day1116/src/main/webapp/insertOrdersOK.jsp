<%@page import="com.sist.dao.OrdersDAO"%>
<%@page import="com.sist.vo.OrdersVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
 int orderid= Integer.parseInt(request.getParameter("orderid"));
 int custid= Integer.parseInt(request.getParameter("custid"));
 int bookid= Integer.parseInt(request.getParameter("bookid"));
 int saleprice= Integer.parseInt(request.getParameter("saleprice"));
 
 //OrdersVO o = new OrdersVO(orderid,custid,bookid,saleprice,null);
 OrdersVO o = new OrdersVO();
 o.setOrderid(orderid);
 o.setCustid(custid);
 o.setBookid(bookid);
 o.setSaleprice(saleprice);
 
 OrdersDAO dao = new OrdersDAO();
 int re= dao.insertOrders(o);
 if(re ==1 ){
	 %>
	 �ֹ��� ����Ͽ����ϴ�.
	 <%
 }else{
	 %>
	 �ֹ� ��Ͽ� �����Ͽ����ϴ�.
	 <%
 }
%>
</body>
</html>