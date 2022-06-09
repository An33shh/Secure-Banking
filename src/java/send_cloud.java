/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import connection.DatabaseConnection;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author admin
 */
public class send_cloud extends HttpServlet {

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
        String u_name=request.getParameter("username");
        String fid=request.getParameter("fileid");
        String key=request.getParameter("key");
        String owner=request.getParameter("ownername");
        String keyyyy=request.getParameter("keyyy");
        String fileid1=request.getParameter("fileid1");
        String suer=request.getParameter("search21");
        String subj=request.getParameter("subject12");
        String secrete=request.getParameter("secrete");
         String mail=request.getParameter("mail");
        try
        {
           DatabaseConnection db1=new DatabaseConnection();
           String qury="Insert into search(username, fid_1, keyword_ser, ownername, sts, search_key, fid_2, search_1, subject,secret,mail) values('"+u_name+"','"+fid+"','"+key+"','"+owner+"','NO','"+keyyyy+"','"+fileid1+"','"+suer+"','"+subj+"','"+secrete+"','"+mail+"')";
           int i=db1.Insert(qury);
           if(i>0)
           {
               response.sendRedirect("search.jsp");
           }
           else
           {
               response.sendRedirect("search21.jsp");
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
