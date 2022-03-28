<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.sql.*"%>
<jsp:useBean id="db" class = "com.book.db.Database"></jsp:useBean>    
 
 
 <%
 String b_id = request.getParameter("b_id");
 String my_b_id = request.getParameter("my_b_id");
 String sql = "insert into sysorder (o_one, o_two) values("+b_id+", "+my_b_id+");";
 db.execute(sql);
 sql = "update books set b_status = 0 where b_id = " + b_id;
 db.execute(sql);
	 %>
	 <script>
	 	alert("Exchange Success!");
	 	location = "index.jsp";
	 </script>
