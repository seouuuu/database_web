<%@page import="java.util.ArrayList"%>
<%@page import="com.sist.exam.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="memberExam.jsp" method="post">
		�����̸��� �Է��ϼ���==><input type= "text" name="name">
		������ �ٹ����� �Է��ϼ���==><input type="text" name="eloc">
		<input type="submit" value="Ȯ��">
	</form>
	<%
		request.setCharacterEncoding("euc-kr");
		if(request.getParameter("name") != null & request.getParameter("eloc") != null){
			String name = request.getParameter("name");
			String eloc = request.getParameter("eloc");
			MemberDao dao = new MemberDao();
			ArrayList<String> list = dao.searchMember(name,eloc);
			%>
				<table >
					<tr>
						<td>�����̸�</td>
					</tr>
					<%
						for(String ename : list){
							%>
								<tr>
									<td><%= ename %></td>
								</tr>
							<%
						}
					%>
				</table>
			
			<%
		}
	%>
	
</body>
</html>