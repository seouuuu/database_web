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
			<td>���ǻ��</td>	
			<td>�����̸�</td>	
			<td>��������</td>	
			<td>��ձݾ�</td>	
		</tr>
		<%
			String sql ="select publisher,bookname,price,(select avg(price) from book b3 where b1.publisher = b3.publisher) avg from book b1 where price>(select avg(price) from book b2 where b1.publisher = b2.publisher) order by publisher";
		try{
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){
				%>
				<tr>
					<td><%=rs.getString(1) %></td>
					<td><%=rs.getString(2) %></td>
					<td><%=rs.getInt(3) %></td>
					<td><%=rs.getInt(4) %></td>
				</tr>
				<%
			}
			ConnectionProvider.close(conn,pstmt,rs);
		}catch(Exception e){
			System.out.println("���ܹ߻�:"+e.getMessage());
		}
		%>

	</table>
</body>
</html>