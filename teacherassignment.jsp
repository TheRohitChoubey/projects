<%-- 
    Document   : login
    Created on : 06 Jan, 2018, 7:39:32 AM
    Author     : mohit
--%>
<%@page import="java.sql.*"%>
<%@page import="db.*" %>
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

                    <h3 class="title">Post Assignment</h3>

                    <%
                        String email = session.getAttribute("email").toString();
                        String depart = session.getAttribute("depart").toString();
                        String sem = request.getParameter("sem");
                        String handle = session.getAttribute("handle").toString();
                        int rc = 0;
                    %>

                    <div class="center_left">
                        <div class="text_box_assignment">
                            <form>

                                <%
                                    String sql = "select max(assignnum) from teacherassign where sem='" + sem + "' and branch='" + depart + "' and postby='"
                                            + email + "'";
                                    DBConnect x = new DBConnect();
                                    ResultSet rs = x.queryReturner(sql);
                                    rs.absolute(1);
                                    if (rs.getString(1) == null) {
                                        rc = 1;
                                    } else {
                                        rc = Integer.parseInt(rs.getString(1));
                                        rc = rc + 1;
                                    }
                                    String query = "select tea_subject from teachercourse where tea_handle='" + handle + "' and sem='" + sem + "'";
                                    ResultSet ts = x.queryReturner(query);

                                %>
                                
                                <div class="login_form_row">
                                    <label class="login_label">Assignment Number</label>
                                    <input type="text" class="login_input" name="assignnum" value="<%=rc%>" readonly />

                                    <input type="hidden" class="login_input" name="sem" value="<%=sem%>"/>
                                </div>

                                <div class="login_form_row" id="sub">
                                    <label class="login_label">Subject</label>
                                </div>
                                <script>
                                    var sub = document.getElementById("sub");
                                    var x = document.createElement("SELECT");
                                    x.setAttribute("id", "mySelect");
                                    x.setAttribute("name", "subject");
                                    sub.appendChild(x);
                                    <%
                                        
                                        while (ts.next()) {
                                    %>
                                    var z = document.createElement("option");
                                    z.setAttribute("value", "<%=ts.getString(1)%>");
                                    var t = document.createTextNode("<%=ts.getString(1)%>");
                                    z.appendChild(t);
                                    x.appendChild(z);
                                    <%
                                        }
                                        
                                    %>   
                                </script>
                                <div class="login_form_row">
                                    <label class="login_label">Question</label>
                                    <textarea  name="q" rows="8" cols="25"
                                               spellcheck>
                                    </textarea>
                                </div>
                                <div class="login_form_row">
                                    <label class="login_label">Enter Number of Days for Submission</label>
                                    <input type="text" class="login_input" name="lastdate" value="" required=""/>
                                </div>
                                <div class="login_form_row">
                                    <label class="login_label">Enter Number of Days for Extended Submission</label>
                                    <input type="text" class="login_input" name="exdate" value="" required=""/>
                                </div>

                                <div class="login_form_row">
                                    <label class="login_label">Marks deduction on extended submission(in %)</label>
                                    <input type="text" class="login_input_marks" name="deduct_marks" value="" 
                                           placeholder="Marks will be deducted accordingly for submission b/w lastdate and extended date " required=""/>
                                </div>
                                <div class="login_form_row">
                                    <label class="login_label"></label>
                                    <input type="submit" value="Submit" name="b1" />
                                </div>


                            </form>

                            <%
                                if (request.getParameter("b1") != null) {
                                    int eld = Integer.parseInt(request.getParameter("exdate")) + Integer.parseInt(request.getParameter("lastdate"));
                                    x.queryExecuter(
                                            "insert into teacherassign(assignnum,question,postby,sem,branch,postdate,lastdate,exdate,deduct_marks,subject) values('"
                                            + request.getParameter("assignnum") + "','"
                                            + request.getParameter("q") + "','"
                                            + handle + "','"
                                            + request.getParameter("sem") + "','"
                                            + depart + "',sysdate,sysdate+" + request.getParameter("lastdate") + ",sysdate+"
                                            + eld + ",'" + request.getParameter("deduct_marks") + "','" + request.getParameter("subject") + "')");
                                           
                                }


                            %>
                        </div></div>  </div></div></div>

    </body>
</html>
