<%-- 
    Document   : teacherViewQ
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

                    <h2 class="title_welcome">Submission on <%= session.getAttribute("name")%>'s Assignments</h2>
                    <form action="./TeacherReview" method="Post">

                        <div class="limiter">
                          
                            <div class="container-table100">
                                <div class="wrap-table100">
                                    <div class="table100 ver1 m-b-110">
                                        <div class="table100-head">
                                            <table>
                                                <thead>
                                                    <tr class="head">
                                                        <th class="column5">Assig.No.</th>
                                                        <th class="column4">Post Date</th>
                                                        <th class="column4">Last Date</th>
                                                        <th class="column3">Submitted By</th>
                                                        <th class="column1">Submission Date</th>
                                                        <th class="column5">Marks</th>
                                                        <th class="column5">Grade</th>
                                                    </tr>
                                                </thead>
                                            </table>
                                        </div>
                                        <%

                                            String depart = session.getAttribute("depart").toString();
                                            String temail = session.getAttribute("email").toString();
                                            String t_han = session.getAttribute("handle").toString();
                                            String sql = "select assignnum,postdate,lastdate,sub_sem,sub_by,sub_date,ass_marks,"
                                                    + "ass_grade from "
                                                    + " teacherassign,studentassign where teacherassign.assignnum=studentassign.assign_num and "
                                                    + " studentassign.postby='" + t_han + "'"
                                                    + "  and studentassign.branch='" + depart + "' and "
                                                    + "teacherassign.branch=studentassign.branch and studentassign.sub_sem=teacherassign.sem and"
                                                    + " teacherassign.postby=studentassign.postby order by sub_sem";
                                            DBConnect x = new DBConnect();
                                            ResultSet rs = x.queryReturner(sql);
                                            String rc, ac;
                                            int i = 1;
                                            
                                            while(rs.next()) {
                                                rc = "b" + i;
                                                ac = "a" + i;
                                        %>
                                        <div class="table100-body js-pscroll">
                                            <table>
                                                <tbody>
                                                    <tr class="row100 body">
                                                        <td class="column5"><%= rs.getString(1)%></td>
                                                        <td class="column2"><%= rs.getString(2)%></td>
                                                        <td class="column4"><%= rs.getString(3)%></td>
                                                        <td class="column4"><%= rs.getString(4)%></td>
                                                        <td class="column3"><a href="studentreadonlyprofile.jsp?email=<%=rs.getString(5)%>"><%=rs.getString(5)%></a></td>
                                                        <td class="column4"><%= rs.getString(6)%></td>
                                                       

                                                        <%
                                                            if (rs.getString(8) != null) {
                                                        %> 

                                                        <td class="column5"><%= rs.getString(7)%></td>
                                                        <td class="column5"><%= rs.getString(8)%></td>
                                                        <td class="column2"><input type="button" value="Not Available" name="<%=rc%>"/></td>
                                                            <%
                                                            } else {
                                                            %>
                                                        <td class="column5">Not Yet Reviewed</td>
                                                        <td class="column5">Not Yet Reviewed</td>
                                                        
                                                        
                                                            <%
                                                                }
                                                            %>

                                                    </tr>

                                                    <%
                                                            i++;
                                                        }
                                                    %>
                                                </tbody>
                                            </table>
                                        </div>                     
                                    </div></div></div></div>
                    </form></div></div></div>
    </body>
</html>
