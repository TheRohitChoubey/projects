<%-- 
    Document   : teacherprofile
    Created on : 25 Oct, 2017, 8:00:09 AM
    Author     : sameer
--%>

<%@page import="db.*" %>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
   <link rel="stylesheet" type="text/css" href="mycss1.css?ver=1" />
    </head>
    <body>
        <div id="background">
            <img src="2.jpg" class="stretch" alt="">
        </div>
        <div class="main-container">
            <jsp:include page="tea_header.jspf" />

            <div class="center_content">
                <div id="header">
                    <h2 class="title_welcome" >Welcome <%= session.getAttribute("name")%></h2>

                    <h3 class="title">View / Edit Profile</h3>

        <%
       Reg r = new Reg();
       r.getUserInfoTeacher(
          session.getAttribute("email").toString());
        %>
        
        
        
        <form action="./Updater" >
           <div class="center_left">
               <div class="text_box_profile_tea">
                   <div class="login_form_row">
                                <label class="login_label">Handle</label>
                                <input type="text" name="t1" class="login_input" 
                               value=<%= r.getHandle()%> required autofocus readonly/>
                            </div>
                  <div class="login_form_row">
                                <label class="login_label">Email</label>
                                <input type="email" name="t2" class="login_input" 
                               value=<%= r.getEmail() %> required readonly/>
                            </div>
                <div class="login_form_row">
                                <label class="login_label">Password</label>
                                <input type="password" class="login_input"
                                       name="t3" value=<%= r.getPassword()%> required />
                            </div>
                
                <div class="login_form_row">
                                <label class="login_label">Name</label>
                                <input type="text" name="t4" class="login_input" 
                                       value=<%= r.getName()%> required/>
                            </div>
                            <div class="login_form_row">
                                <label class="login_label">Mobile Number</label>
                                <input type="text" name="t5" class="login_input"
                                       value=<%= r.getMobile()%> required />
                            </div>
                            <div class="login_form_row">
                                <label class="login_label">Branch / Department</label>
                                <input type="text" name="t6" class="login_input"
                                       value=<%= r.getBranch()%> required
                                       readonly
                                       />
                            </div>
               
                   <div class="login_form_row">


                                <input type="submit" name="b1"
                                       value="Update" class="login" />

                            </div>
                </div></div> 
        </form>
               </div></div></div>
    </body>
</html>
