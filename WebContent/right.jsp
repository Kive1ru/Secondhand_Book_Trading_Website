<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.sql.*"%>
    <div class="right_content">
      <div class="languages_box" style = "text-align:right;"> 
      
<%
if(session.getAttribute("currentUser")==null){
%>    
		<span class="red" style = "text-align:right;">  
	      <a class = "txt1" style = "color:#660000;text-decoration:none;" href = "login.jsp">Login</a> &nbsp; &nbsp; &nbsp; &nbsp;
	      <a class = "txt1" style = "color:#660000;text-decoration:none;" href = "register.jsp">Register</a>
	    </span> 
    </div>
    <div class="languages_box"> <span class="red"></span> <a href="#"></a> <a href="#"></a> <a href="#"></a> </div>
      <div class="currency"> <span class="red"> </span> <a href="#"></a> <a href="#"></a> <a href="#"><strong></strong></a> </div>
      <div class="cart">
        <div class="title"><span class="title_icon"></span></div>
        <div class="home_cart_content">  <span class="red"></span> </div>
        <a href="cart.htm" class="view_cart"></a> </div>
      <div class="title"><span class="title_icon"><img src="images/bullet3.gif" alt="" title="" /></span>About My Website</div>
      <div class="about">
        <p> <img src="images/about.gif" alt="" title="" class="right" /> This website is The First Second-Hand Book Exchange Platform in China. My purpose to create this website is to help people save money and reuse the books again. Hope you guys enjoy, if you have any question please contact me through email. Email Address: Kylinguo627@gmail.com</p>
      </div>
    </div>
<%}else{ %>
	<span class="red">
	  <a class = "txt1" style = "color:#660000;text-decoration:none;" href = "mycenter.jsp"><%=session.getAttribute("currentUser")%>'s Personal Center</a> &nbsp; &nbsp; &nbsp; &nbsp;
      <a class = "txt1" style = "color:#660000;text-decoration:none;" href = "logout.jsp">Logout</a>
    </span>       
      </div>
      
       <div class="cart">
       </div>
		<div class="title"><span class="title_icon"><img src="images/bullet3.gif" alt="" title="" /></span>My Books</div>
      
<%
if(session.getAttribute("currentUser")!=null){
	String u_id = session.getAttribute("currentUser").toString();
	sql = "select * from books where u_id = '"+u_id+"' and b_status = -1";
	rs = db.query(sql);
	while(rs.next()){
		String b_id1 = rs.getString("b_id");
		String b_name = rs.getString("b_name");
		String b_author = rs.getString("b_author");
		String b_desc = rs.getString("b_desc");
		if(b_desc.length()>150){
			b_desc = b_desc.substring(0, 150) + "...";
		}
		String b_date = rs.getString("b_date");
		String b_pic = rs.getString("b_pic");
		int b_price = rs.getInt("b_price");
		
%>      
      <div class="about" style = "height:150px;">
        <p><img height = "140" src="<%=b_pic %>" alt="" title="" class="right" />
        <b>Book Name:</b><%=b_name %><br/>
        <b>Author:</b><%=b_author %><br/>
        
        <a href="details.jsp?b_id=<%=b_id1%>" class = "more">- more details -</a>     
        </p>
        <p>
       <b>Request List</b> 
 <form name = "ffff" method = "post" action = "exchange_confirm.jsp?b_id=<%=b_id1%>">      
		<%
		sql = "select * from exchange,books where exchange.my_b_id = books.b_id and exchange.b_id = " + b_id1;
		//System.out.println(sql);
		ResultSet rs1 = db.query(sql);
		
		while(rs1.next()){
			String b_id2 = rs1.getString("my_b_id");
			String b_name2= rs1.getString("b_name");
%>
		<input type = "radio" name ="my_b_id" value = "<%=b_id2%>"/>
		<a target = "_new" href = "details.jsp?b_id=<%=b_id2%>"><%=b_name2 %></a> 
		<a target="_blank" href="http://wpa.qq.com/msgrd?v=1&uin=82796458&site=qq&menu=yes"><img src = "images/qq.jpg" height = "12"/></a>
		<br/>
<%			
		}
		%>
		<input type = "submit" value = "Confirm"/>
</form>          
        </p>
      </div>
      
<%	}
} %>      
    </div>
<%} %> 