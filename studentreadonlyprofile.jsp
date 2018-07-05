<%-- 
    Document   : studentprofile
    Created on : 06 Jan, 2018, 7:39:32 AM
    Author     : mohit
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

                    <h3 class="title">Student Profile</h3>
                    <%
                        Reg r = new Reg();
                        r.getUserInfoStudent(request.getParameter("email"));
                    %>
                    <form>
                        <div class="center_left">
                            <div class="text_box_profile">
                                <div class="login_form_row">
                                    <label class="login_label">Roll Number</label>
                                    <input type="text" name="t1" class="login_input"
                                           value=<%= r.getRollnum()%> required autofocus readonly/>
                                </div>
                                <div class="login_form_row">
                                    <label class="login_label">Email</label>
                                    <input type="email" name="t2" class="login_input"
                                           value=<%= r.getEmail()%> required readonly />
                                </div>
                                <div class="login_form_row">
                                    <label class="login_label">Password</label>
                                    <input type="password" class="login_input"
                                           name="t3" value=<%= r.getPassword()%> required readonly />
                                </div>
                                <div class="login_form_row">
                                    <label class="login_label">Name</label>
                                    <input type="text" name="t4" class="login_input" 
                                           value=<%= r.getName()%> required readonly/>
                                </div>
                                <div class="login_form_row">
                                    <label class="login_label">Mobile Number</label>
                                    <input type="text" name="t5" class="login_input"
                                           value=<%= r.getMobile()%> required readonly/>
                                </div>
                                <div class="login_form_row">
                                    <label class="login_label">Branch / Department</label>
                                    <input type="text" name="t6" class="login_input"
                                           value=<%= r.getBranch()%> required
                                           readonly
                                           />
                                </div>

                                <div class="login_form_row">
                                    <label class="login_label">Semester</label>
                                    <input type="text" name="t7" class="login_input"
                                           value=<%= r.getSemester()%> required readonly
                                           />
                                </div>
                            </div>
                        </div>

                    </form>
                </div></div></div>
    </body>
</html>
