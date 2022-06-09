


<%@page import="java.sql.ResultSet"%>
<%@page import="connection.DatabaseConnection"%>
<!--A Design by W3layouts
  Author: W3layout
  Author URL: http://w3layouts.com
  License: Creative Commons Attribution 3.0 Unported
  License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<html lang="zxx">

    <head>
        <title>Banking</title>
        <!--meta tags -->
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="keywords" content="Gateau Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
              Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
        <script>
            addEventListener("load", function() {
                setTimeout(hideURLbar, 0);
            }, false);

            function hideURLbar() {
                window.scrollTo(0, 1);
            }
        </script> 
        <script>
            $(function()
            {
                $("#start_datepicker").datepicker();
            }
            );
        </script>


        <!--//meta tags ends here-->
        <!--booststrap-->
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" media="all">
        <!--//booststrap end-->
        <!-- font-awesome icons -->
        <link href="css/font-awesome.min.css" rel="stylesheet">
        <!-- //font-awesome icons -->
        <!--stylesheets-->
        <link href="css/style.css" rel='stylesheet' type='text/css' media="all">
        <!--//stylesheets-->
        <link href="//fonts.googleapis.com/css?family=Arimo:400,700" rel="stylesheet">
        <link href="//fonts.googleapis.com/css?family=Roboto:400,500,700,900" rel="stylesheet">
    </head>
    <%
        String msg = (String) session.getAttribute("msg");
        if (msg != null) {
    %>
    <script>
        var msg1 = '<%=msg%>';
        alert(msg1);
    </script>
    <%
            session.removeAttribute("msg");
        }
    %>

    <body>
        <script type="text/javascript">
            function validateAll()
            {
                // var uname=document.getElementById("uname").value;
                var uname = document.forms[0].uname.value;
                if (uname == "")
                {
                    alert("Username Is Empty");
                    return false;
                }
                var mail = document.forms[0].mail.value;
                if (mail == "")
                {
                    alert("Email Id Is Empty");
                    return false;
                }
                var password = document.forms[0].password.value;
                if (password == "")
                {
                    alert("Password Is Empty");
                    return false;
                }
                var con_pwd = document.forms[0].con_pass.value;
                if (con_pwd == "")
                {
                    alert("Confirm Password is Empty");
                    return false;

                }
                var d_o_b = document.forms[0].birth.value;
                if (d_o_b == "")
                {
                    alert("Enter your Date Of Birth");
                    return false;
                }
                var mob_no = document.forms[0].mobile.value;
                if (mob_no == "")
                {
                    alert("Enter Your Contact No");
                    return false;
                }
                var city = document.forms[0].city.value;
                if (city == "")
                {
                    alert("Enter Your CityName");
                    return false;
                }
                var address = document.forms[0].address.value;
                if (address == "")
                {
                    alert("Fill Up the Address");
                    return false
                }
                return true;
            }

            function checksum()
            {
                var key = window.event.keyCode;
                if (!(key > 47 && key < 58))
                {
                    window.event.returnValue = false;
                }
            }
        </script>
        <!--headder-->
        <div class="header-outs inner_page-banner " id="home">
            <div class="headder-top">
                <!-- nav -->
                <nav>
                    <div id="logo">
                        <h1>
                            <a href="index.jsp">BANKING SECTOR</a>
                        </h1>
                    </div>
                    <label for="drop" class="toggle">Menu</label>
                    <input type="checkbox" id="drop">
                    <ul class="menu mt-2">
                        <li class="active">
                            <a href="owner_home.jsp">Home</a>
                        </li>    
                        <li>
                            <a href="#">About</a>
                        </li>
                    </ul>
                </nav>
                <!-- //nav -->
            </div>
        </div>
        <!--//headder-->
        <!-- short -->
        <div class="using-border py-3">
            <div class="inner_breadcrumb  ml-4">
                <ul class="short_ls">
                    <li>
                        <a href="index.html"></a>
                        <span></span>
                    </li>
                    <li></li>
                </ul>
            </div>
        </div>
        <!-- //short-->
        <!-- about -->

        <!-- //about -->
        <section class="stats-count py-lg-4 py-md-3 py-sm-3 py-3">
            <div class="container-fluid py-lg-5 py-md-4 py-sm-4 py-3">

                <form action="transucces.jsp" method="post" >
                    <center>
                        <%

                            DatabaseConnection db1 = new DatabaseConnection();
                            String query = "select acct from upload  where email='" + session.getAttribute("mail") + "' and acct is not null";
                            ResultSet rs = db1.Select(query);
                            if (rs.next()) {
                        %>
                        &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;<h2> &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;<font face="Algerian" color="#0C6E69">TRANSACTION PAGE</font></h2><br>
                        &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font face="Algerian" color="black">From Account Number&nbsp;:&nbsp;<input type="text" readonly="true" value="<%=rs.getString("acct")%>" name="account"><br><br></font>
                        &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font face="Algerian" color="black">To Account Number&nbsp;:&nbsp;<input type="text" name="mail"><br><br></font>
                        &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
                        <font face="Algerian" color="black">Amount&nbsp;:&nbsp;<input type="text" value="" name="amt"><br><br></font>

                        <font face="Algerian" color="black">&nbsp;&nbsp;<input type="hidden" name="birth"></font>
                        &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font face="Algerian" color="black">Key&nbsp;:&nbsp;<input type="text" name="key" value="<%=request.getParameter("trankey")%>" maxlength="10"><br><br></font>
                        <font face="Algerian" color="black">&nbsp;&nbsp;<input type="hidden" name="birth"></font>
                        &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<!--font face="Algerian" color="black">CVV Number&nbsp;:&nbsp;<input type="password" maxlength="4" name="key" pattern="[0-9]{3,4}" maxlength="10"><br><br></font-->

                        <input type='submit' value="Click to Transfer">
                        <button onclick="window.location.href='owner_home.jsp' " >Cancel Transaction</button>
                    </center>
                    <%
                        }
                    %>
                </form>

                <br>
                <br>
                <br>
                <br>
                <br>
                <br>


            </div>
        </section>
        <!--//counter -->
        <!-- footer -->

        <footer>
            <div class="bottem-wthree-footer text-center py-md-4 py-3">
                <p>
                    © 2019 Gateau. All Rights Reserved | Design by
                    <a href="http://www.W3Layouts.com" target="_blank">W3Layouts</a>
                </p>
            </div>
        </footer>
        <!--//footer -->
    </body>

</html>