<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
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
	<%
		String sql= "select nvl(max(bookid),0)+1 from book";
		int bookid = 0;
		try{
			Connection conn =ConnectionProvider.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			if(rs.next()){
				bookid=rs.getInt(1);
			}
			ConnectionProvider.close(conn,stmt,rs);
		}catch(Exception e){
			%>
			���ܹ߻�:<%=e.getMessage() %>
			<%
		}
	%>

	<h2>�������</h2>
	<hr>
	<form action="insertBookOK.jsp" method="post">
		������ȣ:<input type="number" name="bookid" value="<%=bookid%>"><br>
		�����̸�:<input type="text" name="bookname"><br>
		���ǻ��:<input type="text" name="publisher"><br>
		��������:<input type="number" name="price"><br>
		<input type="submit" value="���">
		<input type="reset" value="���">
	</form>
</body>
</html>