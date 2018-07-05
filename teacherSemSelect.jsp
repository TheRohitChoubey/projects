<%-- 
    Document   : teacherSemSelect
    Created on : 20 Feb, 2018, 12:30:17 PM
    Author     : mohit
--%>

<%@page import="db.DBConnect"%>
<%@page import="java.sql.ResultSet"%>
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

                    <h3 class="title">Select Semester</h3>
                    <%

                        String email = session.getAttribute("email").toString();
                        String depart = session.getAttribute("depart").toString();
                        String sem = request.getParameter("sem");
                        String handle = session.getAttribute("handle").toString();
                       
                    %>
                    <form action="teacherassignment.jsp">
                        <div class="center_left">
                            <div class="text_box_sem_select">
                                <div class="login_form_row">
                                    <label class="login_label">Semester </label>
                                    <select name="sem" required="" id="semester" onchange="myFunction()">
                                        <option value="" selected>Select</option>
                                        <option value="1">1</option>
                                        <option value="2">2</option>
                                        <option value="3">3</option>
                                        <option value="4">4</option>
                                        <option value="5">5</option>
                                        <option value="6">6</option>
                                        <option value="7">7</option>
                                        <option value="8">8</option>
                                    </select>

                                </div>
                                <div class="login_form_row">
                                    <label class="login_label" ></label>
                                    <input type="submit" name="submit" value="Submit"/>
                                </div>
                            </div></div>

                    </form>
                </div></div></div>
        
    </body>
</html>
