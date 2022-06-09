

<%@page import="connection.DatabaseConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <%
            String requ=request.getParameter("username");
            DatabaseConnection db1=new DatabaseConnection();
            String query="update image_authentication.upload set sts='Response' where name='"+requ+"'";
            int i=db1.Update(query);
            if(i>0)
            {
                session.setAttribute("msg", "Respponse Sucessfully");
                response.sendRedirect("view_resp.jsp");
            }
        %>
    </body>
</html>
