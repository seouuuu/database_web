<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="insertOrdersOK.jsp" method="post">
		주문번호를 입력하세요==><input type="text" name="orderid"><br>
		고객번호를 입력하세요==><input type="text" name="custid"><br>
		도서번호를 입력하세요==><input type="text" name="bookid"><br>
		주문가격을 입력하세요==><input type="text" name="saleprice"><br>
		<input type= "submit" value="등록">
		<input type= "reset" value="취소" >
	</form>
</body>
</html>