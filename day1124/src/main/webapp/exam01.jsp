<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.sist.db.ConnectionProvider"%>
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
		<td>�����̸�</td>
		<td>��������</td>
	</tr>
	<%
		String sql ="select bookname,price from book where publisher='�̻�̵��'";
		try{
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){
				%>
				<tr>
					<td><%=rs.getString(1) %></td>
					<td><%=rs.getInt(2) %></td>
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