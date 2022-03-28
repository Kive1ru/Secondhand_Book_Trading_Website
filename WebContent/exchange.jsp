<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="head.jsp" %>
  <div class="center_content">
    <div class="left_content">
      <div class="crumb_nav"> <a href="index.jsp">Home</a> &gt;&gt; Exchange Book </div>
<% 
request.setCharacterEncoding("utf-8");
String b_id = request.getParameter("b_id");
sql = "select * from books where b_id = '"+b_id+"'";
//System.out.println(sql);
rs = db.query(sql);
int c_id = 0;
if(rs.next()){
	String b_name = rs.getString("b_name");
	String b_author = rs.getString("b_author");
	String b_desc = rs.getString("b_desc");
	String b_date = rs.getString("b_date");
	String b_pic = rs.getString("b_pic");
	int b_price = rs.getInt("b_price");
	c_id = rs.getInt("c_id");
	
%>
      <div class="title"><span class="title_icon"><img src="images/bullet1.gif" alt="" title="" /></span><%=b_name %></div>
    
      
      <div class="feat_prod_box_details">
      <table style = "width：100%">
      	<tr>
      		<td valign = "top">
      			<a href="details.jsp"><img height = "180" src="<%=b_pic %>" alt="" title="" border="0" /></a>
      		</td>
      		<td>
	      		<p class="details"> 
	            	<b>Author: </b><%=b_author %><br/>
	            	<b>Publish Time: </b><%=b_date %><br/>
	            	<b>Original Price: </b><%=b_price %><br/>
	            	<b>Introduction: </b><%=b_desc %><br/>
	            </p> 
      		</td>
      	</tr>
      </table>
      

        <div class="clear"></div>
      </div>
<% }%>


      <div id="demo" class="demolayout">
        <ul id="demo-nav" class="demolayout">
          <li><a class="active" href="#tab">Choose One of your Books for Exchange</a></li>
        </ul>
        <div class="tabs-container">
        <div style="display: block;" class="tab" id="tab1">
        <table><tr>
<%
String my_b_id = request.getParameter("my_b_id");
if(my_b_id==null){
	sql = "select * from books where u_id = '" + session.getAttribute("currentUser") + "' and b_status = -1";
}else{
	sql = "select * from books where b_id = " + my_b_id;	
}
	rs = db.query(sql);
	if(rs.next()){
		int b_id1 = rs.getInt("b_id");
		String b_name = rs.getString("b_name");
		if(b_name.length()>20){
			b_name = b_name.substring(0,20)+"...";
		}
		String b_author = rs.getString("b_author");
		String b_desc = rs.getString("b_desc");
		String b_date = rs.getString("b_date");
		String b_pic = rs.getString("b_pic");
		int b_price = rs.getInt("b_price");				
%>        
      
          <td width = "33%">
            <a href = "detail.jsp?b_id=<%=b_id1%>">
            	
            	<div><img src = "<%=b_pic%>" width = "120" height = "200"/></div>
            	<div><%=b_name %></div>  	
            </a>
          </td>
          <td width = "67%">
          	<form name = "ff1" method = "post" action = "exchange_request.jsp?b_id=<%=b_id%>&my_b_id=<%=b_id1%>">
          	<table>	
          	<tr>
          		<td>U_id:</td>
          		<td><input class = "txt2" readonly type = "text" name = "u_id" value = "<%=session.getAttribute("currentUser")%>"/></td>
          	</tr>
          	<tr>
          		<td>Phone:</td>
          		<td><input class = "txt2" type = "text" name = "u_phone"/></td>
          	</tr>
          	<tr>
          		<td>Address:</td>
          		<td><input class = "txt2" type = "text" name = "u_address"/></td>
          	</tr>
          	<tr>
          		<td>QQ:</td>
          		<td><input class = "txt2" type = "text" name = "u_qq"/></td>
          	</tr>
          	<tr>
          		
          		<td colspan = "2" align = "center">
          		<input type = "submit"  value = "Exchange Now" /></td>
          	</tr>
          		
          	</table>
          	</form>
          </td>
	<%}else{
%>
	<span>You have no book for exchange now!</span>
<%		
	}
%>     
			</tr>
			<tr>
				<td colspan ="2" align = "left" height = "40">      
			
				</td>
			</tr>
			</table>
		  </div>     
        </div>
      </div>
      <div class="clear"></div>
    </div>
    <!--end of left content-->
<div class="right_content">
      <div class="languages_box" style = "text-align:right;"> 
      
<%
if(session.getAttribute("currentUser")==null){
%>    
		<span class="red" style = "text-align:right;">  
	      <a class = "txt1" style = "color:#660000;text-decoration:none;" href = "login.jsp">Login</a> &nbsp; &nbsp; &nbsp; &nbsp;
	      <a class = "txt1" style = "color:#660000;text-decoration:none;" href = "regist.jsp">Register</a>
	    </span> 
    </div>
    <div class="languages_box"> <span class="red"></span> <a href="#"></a> <a href="#"></a> <a href="#"></a> </div>
      <div class="currency"> <span class="red"> </span> <a href="#"></a> <a href="#"></a> <a href="#"><strong></strong></a> </div>
      <div class="cart">
        <div class="title"><span class="title_icon"></span></div>
        <div class="home_cart_content">  <span class="red"></span> </div>
        <a href="cart.htm" class="view_cart"></a> </div>
      <div class="title"><span class="title_icon"><img src="images/bullet3.gif" alt="" title="" /></span>About Our Store</div>
      <div class="about">
        <p> <img src="images/about.gif" alt="" title="" class="right" /> Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud. </p>
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
	sql = "select * from books where u_id = '"+u_id+"'";
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
        <b>Description:</b><%=b_desc %>
        <a href="exchange.jsp?b_id=<%=b_id%>&my_b_id=<%=b_id1%>" class = "more">- Choose this book for Exchange -</a>
        </p>
      </div>
      
<%	}
} %>      
    </div>
<%} %> 
    <!--end of right content-->
    <div class="clear"></div>
  </div>
  <!--end of center content-->
<%@ include file="foot.jsp" %>