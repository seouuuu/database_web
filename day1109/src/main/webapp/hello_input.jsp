<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="hello_input.jsp" method="post">
		�̸��� �Է��ϼ��� ==> <input type = "text" name="user_name">
		<input type="submit" value="Ȯ��">
	</form>
	
	<%
		request.setCharacterEncoding("euc-kr");
		String name = request.getParameter("user_name");
		if(name != null){
			%>
			�ȳ��ϼ���. <%=name %>�Դϴ�!
			<%
		}
	%>
	
	
</body>
</html>