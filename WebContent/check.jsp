<%@ page language="java" contentType="text/html; charset=UTF-8" import = "java.sql.*"
    pageEncoding="UTF-8"%>
<jsp:useBean id="db" class = "com.book.db.Database"></jsp:useBean>    
 
 <%
 request.setCharacterEncoding("utf-8");
 String u_id = request.getParameter("u_id");
 String u_pwd = request.getParameter("u_pwd");
 String sql = "select * from sysuser where u_id = '"+ u_id +"'";
 ResultSet rs = db.query(sql);
 String url = "login.jsp";
 String err = "<font color = 'red' size = '2'>Username or password incorrect！</font>";
 if(rs.next()){
	 if(u_pwd!=null && u_pwd.equals(rs.getString("u_pwd"))){
		 	session.setAttribute("currentUser", u_id);
		 	url = "index.jsp";
		 	err = "";
	 }
 }
 session.setAttribute("err", err);
 response.sendRedirect(url);
 %>