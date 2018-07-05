<%-- 
    Document   : login
    Created on : 06 Jan, 2018, 7:39:32 AM
    Author     : mohit
--%>
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
            <jsp:include page="stu_header.jspf" />

            <div class="center_content">
                <div id="header">
                    <h2 class="title_welcome" >Welcome <%= session.getAttribute("name")%></h2>

                    <h3 class="title">List of Assignments for you</h3>
                    <form>
                         <%
                String rollnum=session.getAttribute("rollnum").toString();
            %>
                    <div class="center_left">
                        <div class="text_box_reg">
                            <div class="login_form_row">
                                <label class="login_label">Question</label>
                                <textarea  name="q" rows="8" cols="25"
                                    spellcheck
                                    >
                                    </textarea>
                            </div>
                             <div class="login_form_row">
                                 
                                <label class="login_label"></label>
                                 <input type="submit"  class="login" value="Submit" name="b1" />
                            </div>
                        </div>
                        
                    </div>  
           
           
        </form>
        
        <%
            if (request.getParameter("b1") != null) {
                DBConnect x = new DBConnect();
                x.queryExecuter(
                        "insert into postquestion(question,postby,postdate,pos_roll) values('"
                        + request.getParameter("q") + "','"
                        + session.getAttribute("email") + "',sysdate,'"+rollnum+"')");
                out.println("Question post successfully");
            }


        %>
                </div>
            </div></div>
    </body>
</html>
