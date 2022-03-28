<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="head.jsp" %>

  <div class="center_content">
    <div class="left_content">
      <div class="title"><span class="title_icon"><img src="images/bullet1.gif" alt="" title="" /></span>My account</div>
      <div class="feat_prod_box_details">
        <p class="details"> Please login in your account</p>
        <div class="contact_form">
          <div class="form_subtitle">login into your account</div>
  <form name="frmLogin" action="check.jsp">
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
            </div>
            <div class="form_row">
              
                
            </div>
            <div class="form_row">
  <input type="submit" class="register" value="login" />
            </div>
  </form>
        </div>
      </div>
      <div class="clear"></div>
    </div>
    <!--end of left content-->
<%@ include file = "right.jsp" %>    
    
    <!--end of right content-->
    <div class="clear"></div>
  </div>
    <div class="clear"></div>
  </div>
  <!--end of center content-->
<%@ include file="foot.jsp" %>
