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
	request.setCharacterEncoding("euc-kr");
	int orderid = Integer.parseInt(request.getParameter("orderid"));
	int custid = Integer.parseInt(request.getParameter("custid"));
	int bookid = Integer.parseInt(request.getParameter("bookid"));
	int saleprice = Integer.parseInt(request.getParameter("saleprice"));
	OrdersVO o =new OrdersVO(orderid,custid,bookid,saleprice);
	OrdersDAO dao = new OrdersDAO();
	int re = dao.insertOrders(o);
	if(re ==1 ){
		%>
		등록하였습니다.
		<%
	}else{
		%>
		등록에 실패하였습니다.
		<%
	}
	%>
</body>
</html>