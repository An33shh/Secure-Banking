/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import connection.DatabaseConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author admin
 */
public class own_login extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session=request.getSession(true);
        
        try 
        {
          DatabaseConnection connection=new DatabaseConnection();
          String email=request.getParameter("mail");
        String pass=request.getParameter("password");
          String query="select * from ownregister where email='"+email+"' and pass_word='"+pass+"'";
          ResultSet rs=connection.Select(query);
          if(rs.next())
          { 
              String st=rs.getString("sts");
              if(st.equals("NO"))
              {
                  session.setAttribute("msg","Approval Is Must!...........");
                  response.sendRedirect("own_login.jsp");
              }
              else
              {
                  
              String uname=rs.getString("username");
              session.setAttribute("user", uname);
              session.setAttribute("mail",email);
              response.sendRedirect("owner_home.jsp");
          }
          }
          else{
              response.sendRedirect("own_login.jsp");
          }
        }
        catch(Exception ex)
        {
            out.println(ex);
        } 
        finally {            
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
