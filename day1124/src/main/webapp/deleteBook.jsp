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
		String sql="delete book where bookid =?";
		
		try{
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,bookid);
			int re = pstmt.executeUpdate();
			if(re==1){
				response.sendRedirect("listBookTest.jsp");
			}else{
				%>
					도서삭제에 실패하였습니다.<br>
					<a href="listBookTest.jsp">도서목록</a>
				<%
			}
			ConnectionProvider.close(conn,pstmt,null);
		}catch(Exception e){
			System.out.println("예외발생:"+e.getMessage());
		}
		
	%>
	<h2> 도서삭제 </h2>
	<form action = "updateBookOK.jsp" method = "post">
		도서번호:<input type="number" name="bookid" value="<%=bookid%>"><br>
		<input type="submit" value="삭제">
		<input type="reset" value="취소">
	</form>
</body>
</html>