<%@page import="com.ict.edu.VO"%>
<%@page import="java.util.List"%>
<%@page import="com.ict.edu.DAO"%>
<%@page
	import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="org.springframework.web.context.WebApplicationContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	WebApplicationContext context =
	WebApplicationContextUtils.getWebApplicationContext(application);
	
	DAO dao =(DAO)context.getBean("dao");
	List<VO> list = dao.getList();
	pageContext.setAttribute("list", list);
	%>
	
	<h2> 전체보기</h2>
	<h3>
	<table>
		<thead>
			<tr><th>번호</th>
		    <th>ID</th></tr>
			<!-- <tr><th>PW</th></tr>
			<tr><th>이름</th></tr>
			<tr><th>가입일</th></tr>
			<tr><th>주소</th> -->
		</thead>	
		<tbody>
			<c:choose>
				<c:when test="${empty list }">
				<tr><td colspan="5">원하는 자료없</td></tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="k" items="${list }" varStatus="vs">
						<tr>
						<td>${vs.count }</td>
						<td><a href="oneList.jsp?m_idx=${k.m_idx}">${k.m_id }</a></td>
						<%-- <td>${k.m_name }</td>
						<td>${k.m_pw }</td>
						<td>${k.m_reg }</td>
						<td>${k.m_addr }</td> --%>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		
		</tbody>
		
	</table>
	
	</h3>
	


</body>
</html>