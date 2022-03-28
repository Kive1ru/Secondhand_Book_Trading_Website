<%@ page language="java" contentType="text/html; charset=UTF-8" import = "java.sql.*"
    pageEncoding="UTF-8"%>
<jsp:useBean id="db" class = "com.book.db.Database"></jsp:useBean>    
 
 <%
 request.setCharacterEncoding("utf-8");
 String u_id = request.getParameter("u_id");
 String u_pwd = request.getParameter("u_pwd");
 String u_email = request.getParameter("u_email");
 String u_phone = request.getParameter("u_phone");
 String sql = "insert into sysuser(u_id, u_pwd, u_email, u_phone) values('"+u_id+"','"+u_pwd+"','"+u_email+"','"+u_phone+")";
 ResultSet rs = db.query(sql);
 %>
 <script>
	alert("user registered successful！")
	location = "index.jsp";
</script>