<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="head.jsp" %>
  <div class="center_content">
    <div class="left_content">
      <div class="crumb_nav"> <a href="index.jsp">Home</a> &gt;&gt; Book Details </div>
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
				<p align = "right">          
					<input type = "button"  value = "Exchange Now" onclick = "location='exchange.jsp?b_id=<%=b_id%>'"/>
				</p>
      		</td>
      	</tr>
      </table>
      

        <div class="clear"></div>
      </div>
<% }%>


      <div id="demo" class="demolayout">
        <ul id="demo-nav" class="demolayout">
          <li><a class="active" href="#tab">Related Books</a></li>
        </ul>
        <div class="tabs-container">
        <div style="display: block;" class="tab" id="tab1">
        <table><tr>
<%
if(c_id != 0){
	sql = "select * from books where c_id = " + c_id + " limit 0, 3";
	rs = db.query(sql);
	while(rs.next()){
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
<%}
} %>     
			</tr></table>
		  </div>     
        </div>
      </div>
      <div class="clear"></div>
    </div>
    <!--end of left content-->
<%@ include file = "right.jsp" %> 
    <!--end of right content-->
    <div class="clear"></div>
  </div>
  <!--end of center content-->
<%@ include file="foot.jsp" %>