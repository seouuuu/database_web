<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h3>�������</h3>
	<form action="insertBookOK.jsp" method="post">
		������ȣ:<input type="text" name="bookid"><br>
		�����̸�:<input type="text" name="bookname"><br>
		���ǻ��:<input type="text" name="publisher"><br>
		��������:<input type="text" name="price"><br>
		<input type="submit" value="���">
		<input type="reset" value="���">
	</form>
</body>
</html>