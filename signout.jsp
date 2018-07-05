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
    </head>
    <body>
       <% 
           session.removeAttribute("email");
           session.removeAttribute("name");
             session.removeAttribute("depart");
            
            
            response.sendRedirect("login.jsp");
          
           %>
    </body>
</html>
