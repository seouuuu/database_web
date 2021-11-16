<%@page import="com.sist.vo.ExamVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sist.dao.ExamDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h2>극장이름,상영관번호,영화제목,날짜,좌석번호,가격 출력</h2>
	<form action="Exam.jsp" method="post">
	극장이름을 입력하세요==><input type="text" name= "name">
	<input type="submit" value="확인">
	
	</form>
	
	<%
	request.setCharacterEncoding("euc-kr");
	if(request.getParameter("name")!=null){
		String name = request.getParameter("name");
		ExamDAO dao = new ExamDAO();
		ArrayList<ExamVO> list = dao.listCustomer(name);
		%>
		<table border ="1">
		<tr>
				<td>극장이름</td>
				<td>상영관번호</td>
				<td>영화제목</td>
				<td>날짜</td>
				<td>좌석번호</td>
				<td>가격</td>
		</tr>
		<%
		for(ExamVO e : list){
			%>
			<tr>
				<td><%=e.getTheater() %></td>
				<td><%=e.getCinemanumber() %></td>
				<td><%=e.getTitle() %></td>
				<td><%=e.getDate() %></td>
				<td><%=e.getSeatnumber() %></td>
				<td><%=e.getPrice() %></td>
			</tr>
			<%
		}
		%>
		</table>
		<%
	}
	%>
</body>
</html>