<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
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
			<td>������</td>
		</tr>
	<%
		String sql="select bookid,bookname from book";
		String driver="oracle.jdbc.driver.OracleDriver";
		String url="jdbc:oracle:thin:@localhost:1521:XE";
		String user="c##madang";
		String pwd="madang";
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try{
			Class.forName(driver);
			conn = DriverManager.getConnection(url,user,pwd);
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()){
				%>
					<tr>
						<td><%=rs.getInt(1)%></td>
						<td><a href="detailBook.jsp?bookid=<%=rs.getInt(1)%>"><%=rs.getString(2)%></a></td>
					</tr>
				<% 
				
			}
			
			if(rs!=null){
				rs.close();
			}
			if(conn!= null){
				conn.close();
			}
			if(stmt!= null){
				stmt.close();
			}
		}catch(Exception e){
			System.out.println("���ܹ߻�:"+e.getMessage());
		}
	
	%>
	</table>
</body>
</html>