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
<h2>상품등록</h2>
	<form action="insertExam.jsp" method = "post">
	상품번호를 입력하세요==><input type = "text" name = "no"><br>
	상품이름을 입력하세요==><input type = "text" name = "name"><br>
	상품가격을 입력하세요==><input type = "text" name = "price"><br>
	<input type="submit" value="등록">
	<input type="reset" value="취소">
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
			상품등록에 성공하였습니다.
			<%	
		}else{
			%>
			상품등록에 실패하였습니다.
			<%
		}
	}
	%>
	
	
</body>
</html>