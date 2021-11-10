<%@page import="com.sist.vo.MemberVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sist.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="searchMember.jsp" method="post">
		근무지역을 입력하세요 ==> <input type="text" name="eloc">
		<input type="submit" value="검색">
	</form>
		<%
		request.setCharacterEncoding("euc-kr");
		if(request.getParameter("eloc") != null){
			String eloc = request.getParameter("eloc");
			MemberDAO dao = new MemberDAO();
			ArrayList<MemberVO> list =dao.searchLoc(eloc);
		%>
			<table border="1" width="80%">
				<tr>
					<td>사원번호</td>
					<td>이름</td>
					<td>급여</td>
					<td>수당</td>
					<td>실수령액</td>
					<td>부서번호</td>
					<td>부서명</td>
				</tr>
				
				<% 
					for(MemberVO o: list){
						%>
							<tr>
								<td><%=o.getEno() %></td>
								<td><%=o.getEname() %></td>
								<td><%=o.getSalary()%></td>
								<td><%=o.getComm()%></td>
								<td><%=o.getReal() %></td>
								<td><%=o.getDno() %></td>
								<td><%=o.getDname() %></td>
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