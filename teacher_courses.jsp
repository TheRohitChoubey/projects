<%-- 
    Document   : regteacher.jsp
    Created on : Feb 8, 2018, 9:51:53 PM
    Author     : Lenovo
--%>



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

        <form action="./TeacherCourses">
            <%
                String tea_han = session.getAttribute("handle").toString();
            %>
            <div class="main-container">
                <jsp:include page="tea_header.jspf"/>
                <div class="center_content">
                    <div id="header">
                        <div class="center_left">
                            <div class="title">
                                Add the Subject </div>
                            <div class="text_box_reg">
                                <input type="hidden" name="handle" value="<%=tea_han%>"/>
                                <div class="login_form_row">
                                    <label class="login_label">Enter Number of Subjects</label>
                                    <input type="text" name="t1" id="t0" required="" class="login_input" value=""/>
                                </div>

                                <div class="login_form_row">
                                    <input type='button' value="Add" id="button" onclick="generate()"/>
                                </div>
                                <div class="login_form_row" id="sub">

                                </div>

                                <div class="login_form_row">
                                    <input type="submit" name="b1"
                                           value="Submit" class="login" />
                                </div>
                            </div>
                        </div>

                    </div>

                </div>
            </div>
            <h1 id="demo"></h1>
        </form>

        <script>
                    function generate() {

                    var a = parseInt(document.getElementById("t0").value);
                    var ch = document.getElementById("sub");
                            for (i = 2; i <= a + 1; i++) {
                            var label = document.createElement('label');
                            var t = document.createTextNode("Enter Names");
                            label.className = "login_label";
                            label.appendChild(t);
                            ch.appendChild(label);
                            var input = document.createElement("input");
                            input.setAttribute("name", "t" + i);
                            input.className = "login_input";
                            ch.appendChild(input);
                            
                            var label = document.createElement('label');
                            var t = document.createTextNode("Semester");
                            label.className = "login_label";
                            label.appendChild(t);
                            ch.appendChild(label);
                            
                            var sel = document.createElement("select");
                            sel.setAttribute("name", "s" + i);
                            sel.className = "login_input";
                            ch.appendChild(sel);
                            
                            for (j = 1; j <= 8; j++){
                                var z = document.createElement("option");
                            z.setAttribute("value", j);
                            var t = document.createTextNode(j);
                            z.appendChild(t);
                            sel.appendChild(z);
                    }

                    }
                    document.getElementById("t0").readOnly = true;
                            document.getElementById("button").onclick = function () {
                    ""
                    };
                    }
        </script>
    </body>
</html>

