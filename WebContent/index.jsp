<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="head.jsp" %>

  <div class="center_content">
    <div class="left_content">
      <div class="title"><span class="title_icon"><img src="images/bullet1.gif" alt="" title="" /></span>New Arrivals</div>
<%
sql = "select * from books where b_status = -1 and u_id <> '"+session.getAttribute("currentUser")+"' order by b_time desc limit 0,3";
//System.out.println(sql);
rs = db.query(sql);
while(rs.next()){
	int b_id = rs.getInt("b_id");
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
      
      <div class="feat_prod_box">
        <div class="prod_img"><a href="details.jsp?b_id=<%=b_id%>"><img width = "120" src="<%=b_pic %>" alt="" title="" border="0" /></a></div>
        <div class="prod_det_box">
          <div class="box_top"></div>
          <div class="box_center">
            <div class="prod_title"><%=b_name %></div>
            <p class="details">
            	<b>Author: </b><%=b_author %><br/>
            	<b>Publish Time: </b><%=b_date %><br/>
            	<b>Original Price: </b><%=b_price %><br/>
            	<b>Introduction: </b><%=b_desc %><br/>
            </p>
            <a href="details.jsp?b_id=<%=b_id%>" class = "more">- more details -</a>
            <div class="clear"></div>
          </div>
          <div class="box_bottom"></div>
        </div>
        <div class="clear"></div>
      </div>
<%} %>      
     
      <div class="clear"></div>
    </div>
    <!--end of left content-->
<%@ include file = "right.jsp" %>    
    
    <!--end of right content-->
    <div class="clear"></div>
  </div>
  <!--end of center content-->
<%@ include file="foot.jsp" %>