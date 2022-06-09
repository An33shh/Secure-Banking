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
  %>
  
<body>
    <script type="text/javascript">
        function validateAll()
        {
           // var uname=document.getElementById("uname").value;
           var uname=document.forms[0].uname.value;
        if(uname=="")
            {
                alert("Username Is Empty");
                return false;
            }
         var mail=document.forms[0].mail.value;
         if(mail=="")
             {
                 alert("Email Id Is Empty");
                 return false;
             }
         var password=document.forms[0].password.value;
         if(password=="")
             {
                 alert("Password Is Empty");
                 return false;
             }
         var con_pwd=document.forms[0].con_pass.value;
         if(con_pwd=="")
             {
                 alert("Confirm Password is Empty");
                 return false;
              
             }
         var d_o_b=document.forms[0].birth.value;
         if(d_o_b=="")
             {
                 alert("Enter your Date Of Birth");
                 return false;
             }
        var mob_no=document.forms[0].mobile.value;
         if(mob_no=="")
             {
                 alert("Enter Your Contact No");
                 return false;
             }
        var city=document.forms[0].city.value;
         if(city=="")
             {
                 alert("Enter Your CityName");
                 return false;
             }
        var address=document.forms[0].address.value;
         if(address=="")
             {
                 alert("Fill Up the Address");
                 return false
             }
             return true;
        }
        
        function checksum()
        {
        var key=window.event.keyCode;
        if(!(key>47 && key<58))
            {
                window.event.returnValue=false;
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
            <a href="index.jsp">Home</a>
          </li>
          <li class="mx-lg-3 mx-md-2 my-md-0 my-1">
            <!-- First Tier Drop Down -->
            <label for="drop-2" class="toggle toogle-2">Login
              <span class="fa fa-angle-down" aria-hidden="true"></span>
            </label>
            <a href="#">Login
              <span class="fa fa-angle-down" aria-hidden="true"></span>
            </a>
            <input type="checkbox" id="drop-2">
            <ul>
              <li>
                <a href="own_login.jsp" class="drop-text">Public User</a>
              </li>
              <li>
                <a href="user_login.jsp" class="drop-text">Banking</a>
              </li>
            </ul>
          </li>
          <li class="mx-lg-3 mx-md-2 my-md-0 my-1">
            <!-- First Tier Drop Down -->
            <label for="drop-2" class="toggle toogle-2">Registration
              <span class="fa fa-angle-down" aria-hidden="true"></span>
            </label>
            <a href="#">Registration
              <span class="fa fa-angle-down" aria-hidden="true"></span>
            </a>
            <input type="checkbox" id="drop-2">
            <ul>
              <li>
                <a href="owner_register.jsp" class="drop-text">Public User</a>
              </li>
              <li>
                <a href="user_register.jsp" class="drop-text">Banking</a>
              </li>
            </ul>
          </li>
          <li>
            <a href="admin_login.jsp">Admin</a>
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
        
        <form action="owner_register" method="post" >
            <center>
               
            &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;<h2> &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;<font face="Algerian" color="#0C6E69">PUBLIC USER REGISTRATION</font></h2><br>
             &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font face="Algerian" color="black">USERNAME&nbsp;:&nbsp;<input type="text" name="uname"><br><br></font>
         &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font face="Algerian" color="black">EMAIL ID&nbsp;:&nbsp;<input type="text" name="mail"><br><br></font>
         &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;<font face="Algerian" color="black"> PASSWORD&nbsp;:&nbsp;<input type="password" name="password"><br><br></font>
          <font face="Algerian" color="black">CONFIRM PASSWORD&nbsp;:&nbsp;<input type="password" name="con_pass"><br><br></font>

<font face="Algerian" color="black">&nbsp;&nbsp;<input type="hidden" name="birth"></font>
  &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font face="Algerian" color="black">MOBILE NUMBER&nbsp;:&nbsp;<input type="text" name="mobile" onkeypress="checksum()" maxlength="10"><br><br></font>

        &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;<font face="Algerian" color="black">CITY NAME&nbsp;:&nbsp;<input type="text" name="city"><br><br></font>
            &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;<font face="Algerian" color="black">ADDRESS&nbsp;:&nbsp;<input type="text" name="address"><br><br></font>

            &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;<input type="submit" name="submit" value="REGISTER">
                        
</center>
            
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