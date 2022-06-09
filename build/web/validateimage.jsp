

<%@page import="connection.vino_decryption"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
              String path = request.getSession().getServletContext().getRealPath("/");
              // String patt=path.replace("\\build", "");
               String path2=path+"\\serverImage\\";
               
            
            String sname=(String)session.getAttribute("sname");
            String kname=(String)session.getAttribute("kname");
                String name=(String)session.getAttribute("name");
                String temp=name;
                String path3=path+"\\"+kname;
                        //JOptionPane.showMessageDialog(null,"image1"+sname+","+kname);
                System.out.println("kname:\t"+kname+"\t"+sname);
             vino_decryption vv=new vino_decryption();

               int i= vv.vino_decryption1(path3,sname,temp,path2); 
               if(i==0)
               {
                 
                    String msg11="correct Image";
                                          session.setAttribute("msg11",msg11);
                response.sendRedirect("validateimageprocess.jsp?valid=1&name="+name);
                //response.sendRedirect("checkingImage.jsp?name="+temp);
               }
               else
               {
                  
                    String msg11="Invalid Image";
                                          session.setAttribute("msg11",msg11);
                     response.sendRedirect("validateimageprocess_1.jsp?valid=0");
                                          //response.sendRedirect("check1.jsp?nam="+temp);
               }
              
               
            %>
    </body>
</html>
