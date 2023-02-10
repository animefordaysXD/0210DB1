<%@page import="com.ict.edu.VO"%>
<%@page import="java.util.List"%>
<%@page import="com.ict.edu.DAO"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="org.springframework.web.context.WebApplicationContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String m_idx = request.getParameter("m_idx");
	WebApplicationContext context =
			WebApplicationContextUtils.getWebApplicationContext(application);

	DAO dao = (DAO)context.getBean("dao");
	List<VO> list = dao.getOneList(m_idx);
	pageContext.setAttribute("vo", list.get(0));
	%>
	
	<h1>상세보기 페이지</h1>
		<h2>
			<ul>
				<li>${vo.m_id }</li>
				<li>${vo.m_name }</li>
				<li>${ vo.m_addr}</li>
				<li>${vo.m_reg }</li>
				<li><button onclick="delete_go()">삭?제</button></li>
			</ul>
		</h2>
		<script type="text/javascript">
		function delete_go(){
			location.href = "delete.jsp?m_idx=${vo.m_idx}";
		}
		</script>

</body>
</html>