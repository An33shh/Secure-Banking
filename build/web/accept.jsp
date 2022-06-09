<%@page import="java.sql.PreparedStatement"%>
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
            <a href="index.jsp">Enhanced Data Protection Using Honey Encryption And Binocular VCS</a>
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
       <center> <h1><font face="Algerian" color="black">LICENSE APPLICATION VERIFY THE BANKING SECTOR</font></h1></center><br><br>
       
         <%
    try
    {
      String username=request.getParameter("uname");
       System.out.println(username);
       String id=request.getParameter("id");
       String email=request.getParameter("mail");
       String ret=request.getParameter("bank_name");
       String add_ress=request.getParameter("addr");
       String vehicle1=request.getParameter("vehi");
       String keyword=request.getParameter("key");
              String sn=request.getParameter("sn");
       DatabaseConnection db1=new DatabaseConnection();
    
       String query="Insert into viw_upload(user_name, id_d, email_id, BANKING_SECTOR_name, add_ress, vehicle, key_1) values('"+username+"','"+id+"','"+email+"','"+ret+"','"+add_ress+"','"+vehicle1+"','"+keyword+"')";
        int i=db1.Insert(query);
          DatabaseConnection db2=new DatabaseConnection();
        
          PreparedStatement ps=db2.con.prepareStatement("update upload set sts='Accepted' where sno='"+sn+"' ");
        int k=ps.executeUpdate();
        if(i>0 && k>0)
        {
                          response.sendRedirect("sendmail?Email="+email+ "&keyyy="+keyword);
        }
    }
    catch(Exception ex)
    {
        out.println(ex);
    }
         %>
       
      
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