<%@page import="com.sist.exam.insertVO"%>
<%@page import="com.sist.exam.insertDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h2>��ǰ���</h2>
	<form action="insertExam.jsp" method = "post">
	��ǰ��ȣ�� �Է��ϼ���==><input type = "text" name = "no"><br>
	��ǰ�̸��� �Է��ϼ���==><input type = "text" name = "name"><br>
	��ǰ������ �Է��ϼ���==><input type = "text" name = "price"><br>
	<input type="submit" value="���">
	<input type="reset" value="���">
	</form>
	<%
	request.setCharacterEncoding("euc-kr");
	if(request.getParameter("no")!=null&& request.getParameter("name")!=null && request.getParameter("price")!=null){
		int no = Integer.parseInt(request.getParameter("no"));
		String name = request.getParameter("name");
		int price = Integer.parseInt(request.getParameter("price"));
		
		insertVO v= new insertVO(no,name,price);
		insertDAO dao = new insertDAO();
		int re = dao.insertProduct(v);
		if(re==1){
			%>
			��ǰ��Ͽ� �����Ͽ����ϴ�.
			<%	
		}else{
			%>
			��ǰ��Ͽ� �����Ͽ����ϴ�.
			<%
		}
	}
	%>
	
	
</body>
</html>