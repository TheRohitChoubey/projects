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

        <link rel="stylesheet" type="text/css" href="mycss1.css?ver=1" />
    </head>

    <body>

        <div id="background">
            <img src="2.jpg" class="stretch" alt="">
        </div>
        <%
            String val = "";
            if (request.getAttribute("val") != null) {
                val = request.getAttribute("val").toString();
                if (val.equals("false")) {
                    val = "";
        %>
        <script>
            alert("Roll Number Already Exist");
        </script>    
        <%
                }
            }
        %>
        <form action="./RegSubmit">
            <div class="main-container">

                <jsp:include page="header.jspf"/>
                <div class="center_content">
                    <div id="header">
                        <div class="center_left">
                            <div class="title">
                                New Registration as a student</div>
                            <div class="text_box_reg">
                                <%
                                    if (val == "") {
                                %>
                                <div class="login_form_row">
                                    <label class="login_label">Roll Number </label>
                                    <input type="text" name="t1" id="t0" class="login_input"
                                           value="<%=val%>" required autofocus onchange="myFunction()"/>
                                </div>
                                <div class="login_form_row">
                                    <label class="login_label">Email </label>
                                    <input type="email" id="t2" name="t2" class="login_input"
                                           value="" required/>
                                </div>
                                <%
                                } else {
                                %>
                                <div class="login_form_row">
                                    <label class="login_label">Roll Number </label>
                                    <input type="text" name="t1" id="t0" class="login_input"
                                           value="<%=val%>" required onchange="myFunction()"/>
                                </div>
                                <div class="login_form_row">
                                    <label class="login_label">Email </label>
                                    <input type="email" id="t1" name="t2" class="login_input"
                                           value="" autofocus required/>
                                </div>
                                <%
                                    }
                                %>




                                <div class="login_form_row">
                                    <label class="login_label">Password </label>
                                    <input type="password" class="login_input"
                                           name="t3" value="" required />
                                </div>


                                <div class="login_form_row">
                                    <label class="login_label">Name </label>
                                    <input type="text" name="t4" class="login_input" value="" required/>
                                </div>

                                <div class="login_form_row">
                                    <label class="login_label">Mobile </label>
                                    <input type="text" name="t5" class="login_input" value="" required />
                                </div>

                                <div class="login_form_row">
                                    <label class="login_label">Branch </label>
                                    <select name="t6">
                                        <option>CS</option>
                                        <option>IT</option>
                                        <option>EC</option>

                                        <option>IP</option>
                                        <option>Mech</option>
                                        <option>Civil</option>
                                    </select>
                                </div>
                                <div class="login_form_row">
                                    <label class="login_label">Semester </label>
                                    <select name="t7">
                                        <option>1</option>
                                        <option>2</option>
                                        <option>3</option>
                                        <option>4</option>
                                        <option>5</option>
                                        <option>6</option>
                                        <option>7</option>
                                        <option>8</option>
                                    </select>
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
        </form>
        <script>
            function myFunction() {
                var x = document.getElementById("t0").value;

                location.href = "/Student_Query_System_mwf730am/Verify_stu?t0=" + x;

            }
        </script>
    </body>
</html>
