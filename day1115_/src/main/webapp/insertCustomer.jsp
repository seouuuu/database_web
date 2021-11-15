<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h3>고객등록</h3>
	<form action="insertCustomerOK.jsp" method = "post">
		고객번호를 입력하세요==><input type = "text" name="custid"><br>
		고객이름을 입력하세요==><input type = "text" name="name"><br>
		고객주소를 입력하세요==><input type = "text" name="address"><br>
		고객번호를 입력하세요==><input type = "text" name="phone"><br>
		<input type = "submit" value="등록">
		<input type="reset" value="취소">
	</form>
	
</body>
</html>