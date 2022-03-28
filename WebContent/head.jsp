<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.sql.*"
    pageEncoding="UTF-8"%>
<jsp:useBean id="db" class = "com.book.db.Database"></jsp:useBean>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>The First Second-Hand Book Exchange Platform in China</title>
<link rel="stylesheet" type="text/css" href="style.css" />
<style>
.txt1{
	font-size:12pt;
}
.txt2{
	width:240px;
}
</style>
</head>
<body>
<br/>
<div id="wrap">
  <div class="header">
    <div class="logo"><a href="index.jsp" style = "text-decoration:none;"><span style = "font-size:14pt;position:relative;left:-60px;color:#663333;"><b><i>Second-Hand Book <br/>Exchange Platform</i></b></span></a></div>
    <div id="menu" >
      <ul>
        <li class="selected"><a href="index.jsp">Home </a></li>
<%
String sql = "select * from category";
ResultSet rs = db.query(sql);

while(rs.next()){
	String c_name = rs.getString("c_name");
	int c_id = rs.getInt("c_id"); 
%>
	<li><a href="category.jsp?c_id=<%=c_id%>"><%=c_name%></a></li>
<%	
}
%>        
        

      </ul>
    </div>
  </div>