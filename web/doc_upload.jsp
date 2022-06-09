<%@page import="java.util.UUID"%>
<%@page import="java.util.Random"%>
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
    addEventListener("load", function () {
      setTimeout(hideURLbar, 0);
    }, false);

    function hideURLbar() {
      window.scrollTo(0, 1);
    }
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
    String msg=(String)session.getAttribute("msg");
    if(msg!=null)
    {
%>
<script>
     var msg1='<%=msg%>';
     alert(msg1);
    </script>
<%
        session.removeAttribute("msg");
    }
    
    Random ran = new Random();
    int rannum = ran.nextInt(123456);
                                
%>



<%
    String enc=UUID.randomUUID().toString().substring(0,10);
    String key=UUID.randomUUID().toString().substring(0,10);
%>
<script>
            window.onload = function Generate_Keys() 
            {
                var dcv = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890";
                var sxc = "";
                for (var dc = 0; dc < 8; dc++) {
                    sxc += dcv.charAt(Math.floor(Math.random() * dcv.length));
                }
                document.getElementById("key").value = sxc;
            }
   </script>
<script>
    function validateAll()
    {
        var email=document.forms[0].mail.value;
        if(email=="")
            {
                alert("Email Id is Empty");
                return false;
            }
         var pass=document.forms[0].password.value;
        if(pass=="")
            {
                alert("Password is Empty");
                return false;
            }
            return true;
    }
    
    function checksum()
    {
        var key=window.event.keyCode;
        if(!(key>47 && key<58))
            {
                windoe.event.returnValue=false;
            }
    }
    </script>
<body>
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
          <li class="active">
            <a href="doc_upload.jsp">Document Upload</a>
          </li>
          <li class="active">
            <a href="view_doc.jsp">View Document</a>
          </li>
          <li class="active">
            <a href="check_authen.jsp">Check Authentication</a>
          </li>
          <li>
            <a href="index.jsp">Logout</a>
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
      <center>
          <form action="upload" method="post"  onsubmit="return validateAll();">
        <h2> <font face="Algerian" color="black">APPLY BANK ACCOUNT</font></h2><br>
        <input type="hidden" name="key" id="key">
        <font face="Algerian" color="#0C6E69">FILE ID&nbsp;:<br>&nbsp;<input type="text" name="file_id" value ="ID<%=rannum%>" readonly="true" style="text-align: center;"></font><br><br>
<font face="Algerian" color="#0C6E69">NAME &nbsp;:<br>&nbsp;<input type="text" name="uname" style="text-align: center;"></font><br><br>
<font face="Algerian" color="#0C6E69">Email Id &nbsp;:<br>&nbsp;<input type="text" name="email" style="text-align: center;"></font><br><br>
<font face="Algerian" color="#0C6E69">Select Bank &nbsp;:<br>&nbsp;
<select  name="banksel" style="text-align: center;">
<option value="HDFC">HDFC</option>
<option value="ICICI">ICICI</option>
<option value="AXIS">AXIS</option></select>
</font><br><br>

<font face="Algerian" color="#0C6E69">Date &nbsp;:<br>&nbsp;<input type="date" name="sub" style="text-align: center;"></font><br><br>
<font face="Algerian" color="#0C6E69">Address &nbsp;:<br>&nbsp;<input type="text" name="address" style="text-align: center;"></font><br><br>
<font face="Algerian" color="#0C6E69">Sex &nbsp;:<br>&nbsp;<input type="text" name="sex" style="text-align: center;"></font><br><br>
<font face="Algerian" color="#0C6E69">Phone No &nbsp;:<br>&nbsp;<input type="text" name="phone_no" style="text-align: center;"></font><br><br>
            <input type="submit" name="submit" value="REQUEST">
       
            
        </form>
             </center>    
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