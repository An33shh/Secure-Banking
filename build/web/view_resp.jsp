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
  <title>BANKING SECTOR</title>
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
%>




<%
    String u_name=(String)session.getAttribute("user_name");
    if(u_name!="")
    {
%>
<%
    }
%>
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
            <a href="user_home.jsp">Home</a>
          </li>
          <li class="active">
            <a href="view_resp.jsp">View Response</a>
          </li>
          <li class="active">
            <a href="appiled.jsp">Applied User</a>
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
   
   
  <section class="stats-count py-lg-4 py-md-3 py-sm-3 py-3">
    <div class="container-fluid py-lg-5 py-md-4 py-sm-4 py-3">
       <center> <h1><font face="Algerian" color="black">BANKING RESPONSE </font></h1></center><br><br>
       <input type="hidden" name="id" value="<%=u_name%>">
       <input type="hidden" name="key1" id="key">
       <table border="1" align="center">
           <tr>
               <td><font face="Algerian" color="#0C6E69">USERNAME</font></td>
               <td><font face="Algerian" color="#0C6E69">USER ID</font></td>
               <td><font face="Algerian" color="#0C6E69">EMAIL ID</font></td>
              <td><font face="Algerian" color="#0C6E69">BANK NAME</font></td>
                <td><font face="Algerian" color="#0C6E69">ADDRESS</font></td>
               <td><font face="Algerian" color="#0C6E69">SEX</font></td>
               <td><font face="Algerian" color="#0C6E69">BRANCH</font></td>
               <td><font face="Algerian" color="#0C6E69">MOBILE NUMBER</font></td>
               <td><font face="Algerian" color="#0C6E69">STATUS</font></td>
               <td><font face="Algerian" color="#0C6E69">ACCEPT</font></td>
               </tr>
               <%
                   DatabaseConnection db1=new DatabaseConnection();
                   String query="select * from image_authentication.upload";
                   ResultSet rs=db1.Select(query);
                   while(rs.next())
                   {
                       String file=rs.getString("blood");
                       session.setAttribute("id1", file);
               %>

        <tr>
            <td><%=rs.getString("name")%></td>
            <td><%=rs.getString("id_no")%></td>
            <td><%=rs.getString("email")%></td>
            <td><%=rs.getString("bank")%></td>
            <td><%=rs.getString("address")%></td>
            <td><%=rs.getString("sex")%></td>
            <td><%=rs.getString("vehicle")%></td>
            <td><%=rs.getString("mobile")%></td>
            <td><%=rs.getString("sts")%></td>
            <% if(rs.getString("sts").equalsIgnoreCase("request")){ %>
            <td><a href="accept.jsp?uname=<%=rs.getString("name")%>&id=<%=rs.getString("id_no")%>&mail=<%=rs.getString("email")%>&bank_name=<%=rs.getString("bank") %>&addr=<%=rs.getString("address")%>&vehi=<%=rs.getString("vehicle")%>&key=<%=rs.getString("blood")%>&sn=<%=rs.getString("sno")%>">Accept</a></td>
             <% } %>
             
             
        </tr>
           <%
                   }
           %>
       </table>
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