<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<select>
		<option>���</option>
		<option>����</option>
		<option>����</option>
	</select>
	
	<hr>
	<%
		String []list = {"������","��þ�","������","�ڼ���","�ӻ���","������"};
		
	%>
	<select>
	<%
		for(String name:list){
			%>
				<option> <%=name %> </option>
			<%
		}
	
	%>
	</select>
</body>
</html>