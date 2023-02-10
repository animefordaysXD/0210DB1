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
	<h2>삭제화면</h2>
	<%
	String m_idx = request.getParameter("m_idx");
	WebApplicationContext context = 
			WebApplicationContextUtils.getWebApplicationContext(application);

	DAO dao = (DAO)context.getBean("dao");
	int result = dao.getDelete(m_idx);
	pageContext.setAttribute("result", result);
	%>
	<script type="text/javascript">
	if ("${result }"==1){
		alert("삭제 성공 ㅅㄱ");
	
	}else{
		alert("삭제 실패 ㅅㄱ");
	}
	</script>
	<p><a href="list.jsp">다시 메인으로</a></p>
</body>
</html>