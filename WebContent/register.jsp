<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="head.jsp" %>

  <div class="center_content">
    <div class="left_content">
      <div class="title"><span class="title_icon"><img src="images/bullet1.gif" alt="" title="" /></span>Register</div>
      <div class="feat_prod_box_details">
        <p class="details"> Please register your account first and then login in. </p>
        <div class="contact_form">
          <div class="form_subtitle">create new account</div>
  <form name="frmregister" action="add.jsp">
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
              <label class="contact"><strong>Email:</strong></label>
              <input type="text" class="contact_input" name = "u_email" value = "" />
            </div>
            <div class="form_row">
              <label class="contact"><strong>Phone:</strong></label>
              <input type="text" class="contact_input" name = "u_phone" value = ""/>
            </div>
            <div class="form_row">
              <div class="terms">
                <input type="checkbox" name="terms" />
                I agree to the <a href="#">terms &amp; conditions</a> </div>
            </div>
            <div class="form_row">
              <input type="submit" class="register" value="register"/>
            </div>
          </form>
        </div>
      </div>
      <div class="clear"></div>
    </div>
<%@ include file = "right.jsp" %>    
    
    <!--end of right content-->
    <div class="clear"></div>
  </div>
    <div class="clear"></div>
  </div>
  <!--end of center content-->
<%@ include file="foot.jsp" %>