<%@page import="com.sist.vo.memberVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sist.dao.memberDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h2>ȸ�� ���� Ȯ��</h2>
	<form action="searchMember.jsp" method="post">
	������ �̸��� �Է��ϼ���==><input type="text" name="mgr"><br>
	�ٹ��������� �Է��ϼ���==><input type="text" name="month">
	<input type="submit" value="Ȯ��">
	</form>
	
	<%
	request.setCharacterEncoding("euc-kr");
	if(request.getParameter("mgr")!= null && request.getParameter("month")!=null){
		String mgr = request.getParameter("mgr");
		int month = Integer.parseInt(request.getParameter("month"));
		memberDAO dao = new memberDAO();
		ArrayList<memberVO> list = dao.listmember(mgr,month);
		
		%>
			<table border="1">
				<tr>
					<td>�����ȣ</td>
					<td>�����</td>
					<td>�Ի���</td>
					<td>����</td>
					<td>�ֹι�ȣ</td>
					<td>���̵�</td>
				</tr>
				<%
					for(memberVO m : list){
						%>
						<tr>
							<td><%=m.getEno() %></td>
							<td><%=m.getEname() %></td>
							<td><%=m.getHirdate() %></td>
							<td><%=m.getSalary() %></td>
							<td><%=m.getJumin() %></td>
							<td><%=m.getId() %></td>
							
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