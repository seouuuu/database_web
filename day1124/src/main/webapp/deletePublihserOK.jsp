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
		request.setCharacterEncoding("euc-kr");
		String publisher = request.getParameter("publisher");
		String sql="delete book100 where publisher =?";
		try{
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,publisher);
			int re = pstmt.executeUpdate();
			ConnectionProvider.close(conn,pstmt,null);
			if(re>0){
			 	out.print("������ �����Ͽ����ϴ�.");
			}else{
				out.print("������ �����Ͽ����ϴ�.");
			}
			ConnectionProvider.close(conn,pstmt,null);
		}catch(Exception e){
			System.out.println("���ܹ߻�:"+e.getMessage());
		}
		
	%>
	
</body>
</html>