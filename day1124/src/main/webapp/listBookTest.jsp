<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.sist.db.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>
			<td>������ȣ</td>	
			<td>�����̸�</td>	
			<td>���ǻ��</td>	
			<td>��������</td>
			<td>�Ǹż���</td>
			<td>  Action</td>
		</tr>
			
	<%
		String sql="select bookid,bookname,publisher,price,"+
				" (select count(saleprice) from orders o where b.bookid = o.bookid)"+
				" from book b order by bookid";
		try{
			Connection conn =ConnectionProvider.getConnection();
		 	PreparedStatement pstmt = conn.prepareStatement(sql);
		 	ResultSet rs = pstmt.executeQuery();
		 	while(rs.next()){
		 		int cnt = rs.getInt(5);
		 		%>
		 		<tr>
					<td><%=rs.getInt(1) %></td>	
					<td><%=rs.getString(2) %></td>	
					<td><%=rs.getString(3) %></td>	
					<td><%=rs.getInt(4) %></td>
					<td><%=cnt %></td>
					<td>
						<a href="updateBook.jsp?bookid=<%=rs.getInt(1) %>">����</a>
						<%
						if(cnt==0){
							%>
							<a href="deleteBook.jsp?bookid=<%=rs.getInt(1) %>">����</a>
							<%
						}
						%>
					</td>
				</tr>
		 		<%
		 	}
		 	ConnectionProvider.close(conn,pstmt,rs);
		}catch(Exception e){
			%>
			���ܹ߻�:<%=e.getMessage() %>
			<%	
		}
	%>
	</table>
	<hr>
	<a href="insertBook.jsp">�������</a>
</body>
</html>