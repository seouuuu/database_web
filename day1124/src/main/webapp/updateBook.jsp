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
	<%
		int bookid = Integer.parseInt(request.getParameter("bookid"));
		String sql="select bookname,publisher,price from book where bookid=?";
		String bookname = "";
		String publisher = "";
		int price = 0;
		try{
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,bookid);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()){
				bookname = rs.getString(1);
				publisher = rs.getString(2);
				price = rs.getInt(3);
			}
			ConnectionProvider.close(conn,pstmt,rs);
		}catch(Exception e){
			System.out.println("���ܹ߻�:"+e.getMessage());
		}
		
	%>
	<h2> �������� </h2>
	<form action = "updateBookOK.jsp" method = "post">
		������ȣ:<input type="number" name="bookid" value="<%=bookid%>"><br>
		�����̸�:<input type="text" name="bookname" value="<%=bookname%>"><br>
		���ǻ��:<input type="text" name="publisher" value="<%=publisher%>"><br>
		��������:<input type="number" name="price" value="<%=price%>"><br>
		<input type="submit" value="����">
		<input type="reset" value="���">
	</form>
</body>
</html>