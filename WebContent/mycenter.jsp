<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="head.jsp" %>

  <div class="center_content">
    <div class="left_content">
      <div class="title"><span class="title_icon"><img src="images/bullet1.gif" alt="" title="" /></span>My Center</div>
      <div class="feat_prod_box_details">
        
        <div class="contact_form">
          <div class="form_subtitle">Personal Information Management</div>
  <form name="frmLogin" action="info_save.jsp">
  <%
  if(session.getAttribute("err")!=null){
	  out.println(session.getAttribute("err"));
  }
  %>
            <div class="form_row">
              <label class="contact"><strong>Username:</strong></label>
  <input type="text" class="contact_input" name = "u_id" value = ""/>
            </div>
            <div class="form_row">
              <label class="contact"><strong>Password:</strong></label>
  <input type="password" class="contact_input" name = "u_pwd" value = ""/>
  
   			<label class="contact"><strong>Confirm:</strong></label>
  <input type="password" class="contact_input" name = "u_pwd1" value = ""/>
            </div>
            <div class="form_row">
              
                
            </div>
            <div class="form_row">
  <input type="submit" class="register" value="Save" />
            </div>
  </form>
        </div>
        
 <div class="contact_form">
          <div class="form_subtitle">Exchange History</div>
  [MyBook]    ...... [Other Book]       ....  [2018-08-29]
        </div>       
        
      </div>
      <div class="clear"></div>
    </div>
    <!--end of left content-->
<%@ include file = "right.jsp"%>
    <div class="clear"></div>
  </div>
  <!--end of center content-->
<%@ include file="foot.jsp" %>
