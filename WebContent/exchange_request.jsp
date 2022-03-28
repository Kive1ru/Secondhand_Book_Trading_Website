<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.sql.*"%>
<jsp:useBean id="db" class = "com.book.db.Database"></jsp:useBean>    
 
 
 <%
 
 
 String b_id = request.getParameter("b_id");
 String my_b_id = request.getParameter("my_b_id");
 String u_id = request.getParameter("u_id");
 String u_phone = request.getParameter("u_phone");
 String u_address = request.getParameter("u_address");
 String u_qq = request.getParameter("u_qq");
 String sql ="select * from exchange where b_id = " + b_id + " and my_b_id = " + my_b_id;
 ResultSet rs = db.query(sql);
 if(!rs.next()){
	 sql = "insert into exchange(b_id, my_b_id, u_id, u_phone, u_address, u_qq) values("+b_id+","+my_b_id+",'"+u_id+"','"+u_phone+"','"+u_address+"','"+u_qq+"')";
	 db.execute(sql);
	 %>
	 <script>
	 	alert("Exchange is Requested.");
	 	location = "index.jsp";
	 </script>
 <%}%>