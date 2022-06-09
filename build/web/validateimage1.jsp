<%@page import="java.util.Random"%>
<%@page import="java.awt.image.PixelGrabber"%>
<%@page import="java.awt.Toolkit"%>
<%@page import="java.awt.Image"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.io.File"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.*"%>

<%@page import="java.util.UUID"%>
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

        <link href="jquery/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">

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



    <%
        String enc = UUID.randomUUID().toString().substring(0, 10);
        String key = UUID.randomUUID().toString().substring(0, 10);
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
            var email = document.forms[0].mail.value;
            if (email == "")
            {
                alert("Email Id is Empty");
                return false;
            }
            var pass = document.forms[0].password.value;
            if (pass == "")
            {
                alert("Password is Empty");
                return false;
            }
            return true;
        }

        function checksum()
        {
            var key = window.event.keyCode;
            if (!(key > 47 && key < 58))
            {
                windoe.event.returnValue = false;
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
                <%
                        try {
                            String userid = request.getParameter("id");
                            Class.forName("com.mysql.jdbc.Driver");
                            /*if (userid.equals("admin") && pwd.equals("admin")) {
                             response.sendRedirect("adminhome.jsp");
                             session.setAttribute("userid", userid);
                             }*/
                            String saveFile = "";
                            String contentType = request.getContentType();
                            // Create a factory for disk-based file items
                            DiskFileItemFactory factory = new DiskFileItemFactory();

// Set factory constraints
                            factory.setSizeThreshold(4012);
//factory.setRepository("c:");

// Create a new file upload handler
                            ServletFileUpload upload = new ServletFileUpload(factory);

// Set overall request size constraint
                            //upload.setSizeMax(10024);

// Parse the request
                            List items = null;
                            try {
                                items = upload.parseRequest(request);
                            } catch (FileUploadException e) {
                                e.printStackTrace();
                            }
                            byte[] data = null;
                            String fileName = null;
// Process the uploaded items
                            Iterator iter = items.iterator();
                            while (iter.hasNext()) {
                                FileItem item = (FileItem) iter.next();

                                if (item.isFormField()) {
                                    //processFormField(item);

                                    String name = item.getFieldName();
                                    String value = item.getString();
                                    if (name.equalsIgnoreCase("id")) {
                                        userid = value;
                                    } else {
                                        System.out.println("ERROR");
                                    }
                                } else {
                                    data = item.get();
                                    fileName = item.getName();
                                }
                            }
                            saveFile = fileName;

                            String path = request.getSession().getServletContext().getRealPath("/");
                            String patt = path.replace("\\build", "");

                            //String strPath = patt + "\\bio\\" + mail + "\\";
                            File internalpath = new File(patt + "\\uploadImage");
                            File ff = new File(internalpath + "\\" + saveFile);


                            FileOutputStream fileOut = new FileOutputStream(ff);
                            fileOut.write(data, 0, data.length);
                            fileOut.flush();
                            fileOut.close();
                            int fsize = (int) ff.length();
                            out.println(saveFile);
                            String bioname = null;

                            try {
                                String path1 = request.getSession().getServletContext().getRealPath("/");
                                String patt1 = path1.replace("\\build", "");
                                String newfilepath = patt1 + "\\serverImage\\";
                                String file1 = newfilepath + "\\srcimg.png";
                                String file2 = internalpath + "\\" + saveFile;

                                Image image1 = Toolkit.getDefaultToolkit().getImage(file1);
                                Image image2 = Toolkit.getDefaultToolkit().getImage(file2);

                                try {

                                    PixelGrabber grab1 = new PixelGrabber(image1, 0, 0, -1, -1, false);
                                    PixelGrabber grab2 = new PixelGrabber(image2, 0, 0, -1, -1, false);

                                    int[] data1 = null;

                                    if (grab1.grabPixels()) {
                                        int width = grab1.getWidth();
                                        int height = grab1.getHeight();
                                        data1 = new int[width * height];
                                        data1 = (int[]) grab1.getPixels();
                                    }

                                    int[] data2 = null;

                                    if (grab2.grabPixels()) {
                                        int width = grab2.getWidth();
                                        int height = grab2.getHeight();
                                        data2 = new int[width * height];
                                        data2 = (int[]) grab2.getPixels();
                                    }
                                    boolean b = java.util.Arrays.equals(data1, data2);
                                    System.out.println("Pixels equal: " + b);
                                    if (b == true) {
                                        
                                        response.sendRedirect("validateimageprocess.jsp?valid=1&mail="+session.getAttribute("mail"));
                                        
                                    } else {
                                        response.sendRedirect("validateimageprocess_1.jsp?valid=0");
                                    }
                                } catch (InterruptedException e1) {
                                    e1.printStackTrace();
                                }
                            } catch (Exception e) {
                                System.out.print(e);
                            }
                        } 
                        catch(Exception e )
                        {
                            System.out.println(e);
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