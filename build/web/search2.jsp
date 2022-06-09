<%@page import="connection.Encryption"%>
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
    String wer=(String)session.getAttribute("keyword");
    if(wer!="")
    {
%>
<body>
  <!--headder-->
  <div class="header-outs inner_page-banner " id="home">
    <div class="headder-top">
      <!-- nav -->
      <nav>
        <div id="logo">
          <h1>
            <a href="index.jsp">Gateau</a>
          </h1>
        </div>
        <label for="drop" class="toggle">Menu</label>
         <input type="checkbox" id="drop">
        <ul class="menu mt-2">
          <li class="active">
            <a href="user_home.jsp">Home</a>
          </li>
          <li class="active">
            <a href="search.jsp">Search</a>
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
  
 <%
    
    DatabaseConnection db1=new DatabaseConnection();
    String query1="select * from file_upload where fid='"+session.getAttribute("file_id1")+"'";
    ResultSet rs=db1.Select(query1);
    if(rs.next())
    {
        String ww=rs.getString("fid");
        session.setAttribute("fie" ,ww);
  %>
  
  
  <section class="stats-count py-lg-4 py-md-3 py-sm-3 py-3">
      <div class="container-fluid py-lg-5 py-md-4 py-sm-4 py-3">
        <form action="search2.jsp" method="post">
            <center>
            <h3><font face="Algerian" color="#0C6E69">SEARCH FILES</font></h3><br>
            <%
              Encryption ewe1=new Encryption();
              String qer=ewe1.Encryption2(rs.getString("search_key"));
              session.setAttribute("qer1", qer);  
            %>
            <font face="Algerian" color="#0C6E69">SEARCH KEYWORD:<br><input type="text" name="serch_keyword" value="<%=qer%>" ></font><br><br>
           <%
             DatabaseConnection db2=new DatabaseConnection();
             String query="select * from encrypt where file_id='"+ww+"'";
             ResultSet rs1=db2.Select(query);
             if(rs1.next())
             {
           %>
           <input type="hidden" name="sub" value="<%=rs1.getString("file_id")%>">
           <input type="hidden" name="sub" value="<%=rs1.getString("serch_key1")%>">
           <input type="hidden" name="sub" value="<%=rs1.getString("subject")%>">
           <input type="hidden" name="sub" value="<%=rs1.getString("secrete_key")%>">

            <input type="submit" name="submit" value="SEARCH">
            </center>
            </form>
            <table border="1" align="center"> 
               
          <tr>
              <td><font face="Times New Roman" color="#0C6E69">FILE ID</font></td>
              <td><font face="Times New Roman"  color="#0C6E69">ENCRYPTED KEYWORD</font></td>
              <td><font face="Times New Roman"  color="#0C6E69">SEND</font></td>
          </tr>
          <tr>
                <td><%=rs.getString("fid")%></td>
                <td><%=qer%></td>
                <td><a href="send_cloud?username=<%=session.getAttribute("user_name")%>&fileid=<%=rs.getString("fid")%>&key=<%=session.getAttribute("qer1")%>&ownername=<%=rs.getString("ownername")%>&keyyy=<%=rs.getString("search_key")%>&fileid1=<%=rs1.getString("file_id")%>&search21=<%=rs1.getString("serch_key1")%>&subject12=<%=rs1.getString("subject")%>&secrete=<%=rs1.getString("secrete_key")%>&mail=<%=session.getAttribute("Mail")%>">Search Files Check</a></td>
          </tr>  
            </table>
          <%
             }
          %>
      <%
    }
      %>
      <%
    }
      %>
     
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