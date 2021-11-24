<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
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
	<%
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url="jdbc:oracle:thin:@localhost:1521:XE";
	String user="c##madang";
	String pwd="madang";
	String sql="select bookid,bookname from book";
	Connection conn = DriverManager.getConnection(url,user,pwd);
	PreparedStatement stmt = conn.prepareStatement(sql);
	ResultSet rs= stmt.executeQuery();
	%>
	<table>
		<tr>
			<td>도서번호</td>		
			<td>도서이름</td>		
		</tr>
		
		<%
		if(rs != null){
			while(rs.next()){
				int bookid = rs.getInt("bookid");
				String bookname = rs.getString("bookname");
				%>
				<tr>
					<td></td>		
					<td></td>		
				</tr>
				
				<% 
			}
		}
		%>
		
		
	
	</table>
	
</body>
</html>