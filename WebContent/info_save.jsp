<%@ page language="java" contentType="text/html; charset=UTF-8" import = "java.sql.*"
    pageEncoding="UTF-8"%>
<jsp:useBean id="db" class = "com.book.db.Database"></jsp:useBean>    
 
 <%
 request.setCharacterEncoding("utf-8");
 String u_id = request.getParameter("u_id");
 String u_pwd = request.getParameter("u_pwd");
 String sql = "update students set u_id = '"+u_id+"', u_pwd = '"+u_pwd+"'";
 db.execute(sql);
 %>
 <script>
	alert("Password change successful！")
	location = "index.jsp";
</script>