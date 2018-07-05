
<%-- 
    Document   : teacherhome
    Created on : 06 Jan, 2018, 7:39:32 AM
    Author     : lenovo
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


                    <form>
                        <div class="limiter">
                            <div class="container-table100">
                                <div class="wrap-table100">
                                    <div class="table100 ver1 m-b-110">
                                        <div class="table100-head">
                                            <table>
                                                <thead>
                                                    <tr class="row100 head">
                                                        <th align="center" class="cell100 column0">Roll.No.</th>
                                                        <th align="center" class="cell100 column0">Question</th>
                                                        <th align="center" class="cell100 column0">Post By</th>
                                                        <th align="center" class="cell100 column0">Post Date</th>
                                                    </tr>
                                                </thead>
                                            </table>
                                        </div>
                                        <%

                                            String depart = session.getAttribute("depart").toString();

                                            String sql = "select pos_roll,question,postby,postdate from "
                                                    + " postquestion,studentreg where "
                                                    + " postquestion.postby=studentreg.email"
                                                    + "  and studentreg.branch='" + depart + "' order by postdate desc";
                                            DBConnect x = new DBConnect();
                                            ResultSet rs = x.queryReturner(sql);
                                            String rc, ac;
                                            int i = 1;
                                            while (rs.next()&&i<=4) {
                                               
                                        %>
                                        <div class="table100-body js-pscroll">
                                            <table>
                                                <tbody>
                                                    <tr class="row100 body">
                                                        <td align="center" class="cell100 column0"><%= rs.getString(1)%></td>
                                                        <td align="center" class="cell100 column0"><%= rs.getString(2)%></td>
                                                        <td align="center" class="cell100 column0"><%= rs.getString(3)%></td>
                                                        <td align="center" class="cell100 column0"><%= rs.getString(4)%></td>
                                                    </tr>

                                                    <%
                                                            i++;
                                                        }
                                                    %>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div></div></div></div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>

