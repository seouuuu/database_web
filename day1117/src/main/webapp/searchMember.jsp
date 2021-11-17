<%@page import="com.sist.vo.memberVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sist.dao.memberDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h2>회원 정보 확인</h2>
	<form action="searchMember.jsp" method="post">
	관리자 이름을 입력하세요==><input type="text" name="mgr"><br>
	근무개월수를 입력하세요==><input type="text" name="month">
	<input type="submit" value="확인">
	</form>
	
	<%
	request.setCharacterEncoding("euc-kr");
	if(request.getParameter("mgr")!= null && request.getParameter("month")!=null){
		String mgr = request.getParameter("mgr");
		int month = Integer.parseInt(request.getParameter("month"));
		memberDAO dao = new memberDAO();
		ArrayList<memberVO> list = dao.listmember(mgr,month);
		
		%>
			<table border="1">
				<tr>
					<td>사원번호</td>
					<td>사원명</td>
					<td>입사일</td>
					<td>연봉</td>
					<td>주민번호</td>
					<td>아이디</td>
				</tr>
				<%
					for(memberVO m : list){
						%>
						<tr>
							<td><%=m.getEno() %></td>
							<td><%=m.getEname() %></td>
							<td><%=m.getHirdate() %></td>
							<td><%=m.getSalary() %></td>
							<td><%=m.getJumin() %></td>
							<td><%=m.getId() %></td>
							
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