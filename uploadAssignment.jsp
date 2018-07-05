<%-- 
    Document   : uploadAssignment
    Created on : 9 Feb, 2018, 11:34:18 PM
    Author     : mohit
--%>

<%@page import="java.util.Enumeration"%>
<%@page import="java.lang.System.*"%>
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

                    <h3 class="title">Upload the Assignments</h3>
                    <div class="limiter">
                        <div class="container-table100">
                            <div class="wrap-table100">
                                <div class="table100 ver1 m-b-110">
                                    <div class="table100-head">
                                        <table>
                                            <thead>
                                                <tr class="row100 head">
                                                    <th align="center" class="cell100 column5">Assng. No.</th>
                                                    <th align="center" class="cell100 column2">Question</th>
                                                    <th align="center" class="cell100 column3">Post By</th>
                                                    <th align="center" class="cell100 column4">Post Date</th>
                                                    <th align="center" class="cell100 column4">Last Date</th>
                                                    <th align="center" class="cell100 column4">Subject</th>
                                                    <th align="center" class="cell100 column1">Semester</th>
                                                    <th align="center" class="cell100 column1">Upload</th>

                                                </tr>
                                                <%
                                                    String email = session.getAttribute("email").toString();
                                                    String depart = session.getAttribute("depart").toString();
                                                    String sem = session.getAttribute("sem").toString();
                                                    String rollnum = session.getAttribute("rollnum").toString();
                                                   
                                                    String sql = "select assignnum,question,postby,postdate,lastdate,subject from teacherassign where"
                                                            + " sem='" + sem + "' and branch='" + depart + "'";
                                                    DBConnect x = new DBConnect();
                                                    ResultSet rs = x.queryReturner(sql);
                                                    
                                                    String rcc = "c" + 1;
                                                    int i = 1;
                                                    String flag = "0";

                                                    while (rs.next()) {
                                                        rcc = "c" + i;
                                                %>
                                            </thead>

                                        </table>
                                    </div>
                                    <div class="table100-body js-pscroll">
                                        <table >
                                            <tbody>
                                                <tr class="row100 body">
                                                    <td align="center" class="cell100 column5"><%= rs.getString(1)%></td>
                                                    <td align="center" class="cell100 column2"><%= rs.getString(2)%></td>
                                                    <td align="center" class="cell100 column3"><%= rs.getString(3)%></td>
                                                    <td align="center" class="cell100 column4"><%= rs.getString(4)%></td>
                                                    <td align="center" class="cell100 column4"><%= rs.getString(5)%></td>
                                                    <td align="center" class="cell100 column4"><%= rs.getString(6)%></td>
                                                    <td align="center" class="cell100 column1"><%=sem%></td>
                                                    
                                                    <td align="center" class="cell100 column1"> 
                                                        <form action="upload" method="post" enctype="multipart/form-data">
                                                            <input type="hidden" name="sem" value="<%=sem%>"/>
                                                            <input type="hidden" name="roll" value="<%=rollnum%>"/>
                                                            <input type="hidden" name="t_han" value="<%=rs.getString(3)%>"/>
                                                            <input type="hidden" name="subject" value="<%=rs.getString(6)%>"/>
                                                            <input type="hidden" name="assignnum" value="<%=rs.getString(1)%>"/>
                                                            <input type="file"  name="file" />
                                                            <input type="submit" value="Upload" name="<%=rcc%>"/>
                                                        </form>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>

                                        <%
                                                i++;
                                            }
                                        %> 
                                        <%
                                            if (response.getHeader("na") != null) {
                                                rcc = response.getHeader("na");
                                                i = Integer.parseInt(rcc.substring(1));
                                                rs.absolute(i);
                                                sql = "insert into studentassign(sub_by,sub_date,postby,branch,assign_num,sub_sem,sub_roll)"
                                                        + " values('" + email + "',sysdate,'" + rs.getString(3) + "',"
                                                        + "'" + depart + "','" + rs.getString(1) + "','" + sem + "'"
                                                        + ",'" + rollnum + "')";
                                                x.queryExecuter(sql);
                                                out.println("Upload SuccessFull");
                                            }
                                        %>
                                    </div>

                                </div></div></div>
                    </div>
                </div></div></div>
    </body>
</html>
