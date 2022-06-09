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
public class owner_register extends HttpServlet {

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
        String user=request.getParameter("uname");
       String email=request.getParameter("mail");
       String password=request.getParameter("password");
       String confirm=request.getParameter("con_pass");
       String date=request.getParameter("birth");
       String mobile=request.getParameter("mobile");
       String city=request.getParameter("city");
       String address=request.getParameter("address");
       try {
             DatabaseConnection db1=new DatabaseConnection();
             String query="select username,email from ownregister where username='"+user+"' || email='"+email+"'";
             ResultSet rs=db1.Select(query);
             if(rs.next())
             {
                session.setAttribute("msg", "Already Exits");
                session.setAttribute(user, "username");
                session.setAttribute(email, "email");
                
                response.sendRedirect("owner_register.jsp");
             }
             else
             {
                 int  i = db1.Insert("insert into ownregister(username, email, pass_word, con_pass, date, mobile_no, city, address, sts) values ('"+user+"','"+email+"','"+password+"','"+confirm+"','"+date+"','"+mobile+"','"+city+"','"+address+"','NO')");
                if(i>0)
                {
                 session.setAttribute("msg", "Successfully Register");
                 response.sendRedirect("owner_register.jsp");
                } 
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
