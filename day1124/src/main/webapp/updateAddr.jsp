<%@page import="java.sql.ResultSet"%>
<%@page import="com.sist.db.ConnectionProvider"%>
<%@page import="java.sql.PreparedStatement"%>
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
		int custid = Integer.parseInt(request.getParameter("custid"));
		String address = "";
		try{
			String sql = "select address from customer where custid = ?";
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,custid);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()){
				address = rs.getString(1);
			}
			ConnectionProvider.close(conn,pstmt,rs);
		}catch(Exception e){
			System.out.println("���ܹ߻�:"+e.getMessage());
		}
	%>

	<h2>�� �ּ� ����</h2>
	<hr>
	<form action="updateAddrOK.jsp" method="post">
		<input type="hidden" name="custid" value="<%=custid%>">
		���ο� �ּ�:<input type="text" name="address" value="<%=address%>">
		<input type="submit" value="����">
	</form>
</body>
</html>