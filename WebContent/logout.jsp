<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
session.setAttribute("currentUser", null);
%>

<script>
	alert("User logged out！");
	location = "index.jsp";
</script>