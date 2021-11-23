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
	 int no = Integer.parseInt(request.getParameter("no"));
	%>
	전달된 번호:<%=no %>
</body>
</html>