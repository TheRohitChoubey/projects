<%-- 
    Document   : login
    Created on : 06 Jan, 2018, 7:39:32 AM
    Author     : mohit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="mycss1.css?ver=1" />
    </head>
    <body>
        <div id="background">
            <img src="2.jpg" class="stretch" alt="">
        </div>
       
        <form action="./Login">
            <div class="main-container">
                <jsp:include page="header.jspf"/>
                <div class="center_content">
                    <div id="header">
                    <div class="center_left">
                        <div class="title"></div>
                        <div class="text_box">
                            <div class="login_form_row">
                                <label class="login_label">User email: </label>
                                <input type="email" name="t1" class="login_input" 
                                       value="" required="" />
                            </div>

                            <div class="login_form_row">
                                <label class="login_label">Password:</label>
                                <input type="password" name="t2" class="login_input"
                                       value="" required="" />
                            </div>

                            <input type="submit" value="Login" name="b1" class="login" />
                            <div class="login_form_row">
                            <label class="login_label">Sign up</label>

                            <a href="reg.jsp">As Student</a>
                            <a href="regteacher.jsp">As Teacher</a>
                            </div>
                        </div>

                    </div>
                        
                        
                    </div>
                    </div>
                </div>
                </form> 
            
       
        
    </body>
</html>
