<%-- 
    Document   : viewans
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
            <jsp:include page="stu_header.jspf" />

            <div class="center_content">
                <div id="header">
                    <h2 class="title_welcome" >Welcome <%= session.getAttribute("name")%></h2>

                    <h3 class="title">Answers you asked for </h3>

                    <form>
                        <div class="limiter">
                            <div class="container-table100">
                                <div class="wrap-table100">
                                    <div class="table100 ver1 m-b-110">
                                        <div class="table100-head">
                                            <table>
                                                <thead>
                                                    <tr class="row100 head">
                                                        <th class="cell100 column2">Question</th>
                                                        <th class="cell100 column4">Post Date</th>
                                                        <th class="cell100 column1">Answer</th>
                                                        <th class="cell100 column3">Answered By</th>
                                                        <th class="cell100 column4">Answer Date</th>
                                                    </tr>
                                                </thead>
                                            </table>
                                        </div>



                                        <%

                                            String email = session.getAttribute("email").toString();

                                            String sql = "select question,postdate,ans,replyby,replydate from reply,postquestion where "
                                                    + "postquestion.postdate=reply.qdate and reply.replyto='" + email + "'";
                                            DBConnect x = new DBConnect();
                                            ResultSet rs = x.queryReturner(sql);

                                            while (rs.next()) {

                                        %>
                                        <div class="table100-body js-pscroll">
                                            <table>
                                                <tbody>
                                                    <tr class="row100 body">
                                                        <td align="center" class="cell100 column2"><%= rs.getString(1)%></td>
                                                        <td align="center" class="cell100 column4"><%= rs.getString(2)%></td>
                                                        <td align="center" class="cell100 column1"><%= rs.getString(3)%></td>
                                                        <td align="center" class="cell100 column3"><%= rs.getString(4)%></td>
                                                        <td align="center" class="cell100 column4"><%= rs.getString(5)%></td>

                                                    </tr>
                                                    <%
                                                        }
                                                    %>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div></div></div>
                    </form>
                </div></div></div>
    </body>
</html>
