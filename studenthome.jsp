<%-- 
    Document   : studenthome
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

                    <h3 class="title">List of Assignments for you</h3>
                    <form action="uploadAssignment.jsp">


                        <div class="limiter">
                            <div class="container-table100">
                                <div class="wrap-table100">
                                    <div class="table100 ver1 m-b-110">
                                        <div class="table100-head">
                                            <table>
                                                <thead>
                                                    <tr class="row100 head">
                                                        <th align="center" class="cell100 column5">S.No.</th>
                                                        <th align="center" class="cell100 column2">Question</th>
                                                        <th align="center" class="cell100 column3">Post By</th>
                                                        <th align="center" align="center" class="cell100 column4">Post Date</th>
                                                        <th align="center" class="cell100 column4">Last Date</th>
                                                        <th align="center" class="cell100 column1">Semester</th>
                                                    </tr>
                                                </thead>
                                            </table>
                                        </div>

                                        <%
                                            String email = session.getAttribute("email").toString();
                                            String depart = session.getAttribute("depart").toString();
                                            String sem = session.getAttribute("sem").toString();
                                            String sql = "select assignnum,question,postby,postdate,lastdate from teacherassign where"
                                                    + " sem='" + sem + "' and branch='" + depart + "'";
                                            DBConnect x = new DBConnect();
                                            ResultSet rs = x.queryReturner(sql);

                                            String rcc = "c" + 1;
                                            int i = 1;

                                            while (rs.next()) {
                                                rcc = "c" + i;
                                        %>
                                        <div class="table100-body js-pscroll">
                                            <table>
                                                <tbody>
                                                    <tr class="row100 body">
                                                        <td align="center" class="cell100 column5"><%= rs.getString(1)%></td>
                                                        <td align="center" class="cell100 column2"><%= rs.getString(2)%></td>
                                                        <td align="center" class="cell100 column3"><%= rs.getString(3)%></td>
                                                        <td align="center" class="cell100 column4"><%= rs.getString(4)%></td>
                                                        <td align="center" class="cell100 column4"><%= rs.getString(5)%></td>
                                                        <td align="center" class="cell100 column1"><%=sem%></td>
                                                        <%
                                                                i++;
                                                            }
                                                        %> 
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>


                                <input type="submit" value="Upload"  name=""  />
                            </div>
                        </div>



                    </form>
                </div>
            </div>
        </div>


    </body>
</html>


