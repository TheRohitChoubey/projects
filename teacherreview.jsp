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
        <meta name="viewport" content="width=device-width, initial-scale=1">
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
                    <form>
                        <div class="limiter">
                            <div class="container-table100">
                                <div class="wrap-table100">
                                    <div class="table100 ver1 m-b-110">
                                        <div class="table100-head">
                                            <table>
                                                <thead>
                                                    <tr class="row100 head">
                                                        <th align="center" class="cell100 column5">Assig.No.</th>
                                                        <th align="center" class="cell100 column4">Post Date</th>
                                                        <th align="center" class="cell100 column4">Last Date</th>
                                                        <th align="center" class="cell100 column4">Semester</th>
                                                        <th align="center" class="cell100 column3">Submitted By</th>
                                                        <th align="center" class="cell100 column1">Submission Date</th>
                                                        <th align="center" class="cell100 column1">Marks</th>
                                                        <th align="center" class="cell100 column2">Review</th>
                                                    </tr>
                                                </thead>
                                            </table>
                                        </div>
                                        <%
                                            String ss = session.getAttribute("naa").toString();
                                            if (request.getParameter("sk") != null) {
                                                ss = request.getParameter("sk");
                                            }
                                            String depart = session.getAttribute("depart").toString();
                                            String temail = session.getAttribute("email").toString();
                                            String t_han = session.getAttribute("handle").toString();
                                            String sql = "select assignnum,postdate,lastdate,sub_sem,sub_by,sub_date from "
                                                    + " teacherassign,studentassign where teacherassign.assignnum=studentassign.assign_num and "
                                                    + " studentassign.postby='" + t_han + "'"
                                                    + "  and studentassign.branch='" + depart + "' and "
                                                    + "teacherassign.branch=studentassign.branch and studentassign.sub_sem=teacherassign.sem";
                                            DBConnect x = new DBConnect();
                                            ResultSet rs = x.queryReturner(sql);
                                            int i = Integer.parseInt(ss.substring(1));
                                            rs.absolute(i);
                                        %> 

                                        <div class="table100-body js-pscroll">
                                            <table>
                                                <tbody>
                                                    <tr class="row100 body">
                                                        <td align="center" class="cell100 column5"><%= rs.getString(1)%></td>
                                                        <td align="center" class="cell100 column4"><%= rs.getString(2)%></td>
                                                        <td align="center" class="cell100 column4"><%= rs.getString(3)%></td>
                                                        <td align="center" class="cell100 column4"><%= rs.getString(4)%></td>
                                                        <td align="center" class="cell100 column3"><%= rs.getString(5)%></td>
                                                        <td align="center" class="cell100 column1"><%= rs.getString(6)%></td>

                                                        <td align="center" class="cell100 column1"><input type="text" value="" name="marks" required=""/></td>
                                                        <td align="center" class="cell100 column0"><input type="hidden" value="<%=ss%>" name="sk"/></td>
                                                        <td align="center" class="cell100 column2"><input type="submit" value="Submit" name="s1"/></td>
                                                    </tr>

                                                </tbody>
                                            </table>
                                        </div>
                                    </div></div></div></div>
                    </form>
                    <%
                        if (request.getParameter("s1") != null) {
                            sql = "select lastdate,sub_date,exdate,deduct_marks from teacherassign,studentassign where studentassign.sub_by='"
                                    + rs.getString(5) + "' and studentassign.postby=teacherassign.postby and studentassign.assign_num=teacherassign.assignnum and"
                                    + " teacherassign.assignnum=" + rs.getString(1) + " and teacherassign.sem='" + rs.getString(4) + "'";

                            ResultSet ts = x.queryReturner(sql);
                            ts.absolute(1);
                            int marks = Integer.parseInt(request.getParameter("marks"));
                            
                            
                        }
                    %>
                    
                </div></div></div>
       

    </body>
</html>
