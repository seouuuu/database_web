<%@page import="com.sist.vo.MemberVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sist.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="searchMember.jsp" method="post">
		�ٹ������� �Է��ϼ��� ==> <input type="text" name="eloc">
		<input type="submit" value="�˻�">
	</form>
		<%
		request.setCharacterEncoding("euc-kr");
		if(request.getParameter("eloc") != null){
			String eloc = request.getParameter("eloc");
			MemberDAO dao = new MemberDAO();
			ArrayList<MemberVO> list =dao.searchLoc(eloc);
		%>
			<table border="1" width="80%">
				<tr>
					<td>�����ȣ</td>
					<td>�̸�</td>
					<td>�޿�</td>
					<td>����</td>
					<td>�Ǽ��ɾ�</td>
					<td>�μ���ȣ</td>
					<td>�μ���</td>
				</tr>
				
				<% 
					for(MemberVO o: list){
						%>
							<tr>
								<td><%=o.getEno() %></td>
								<td><%=o.getEname() %></td>
								<td><%=o.getSalary()%></td>
								<td><%=o.getComm()%></td>
								<td><%=o.getReal() %></td>
								<td><%=o.getDno() %></td>
								<td><%=o.getDname() %></td>
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