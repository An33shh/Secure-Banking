
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.servlet.http.HttpSession;


@WebServlet("/accept")
   // upload file's size up to 16MB
public class accept extends HttpServlet {

    // database connection settings
    private String dbURL = "jdbc:mysql://localhost:3306/image_authentication";
    private String dbUser = "root";
    private String dbPass = "admin";

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        // gets values of text fields
        HttpSession session=request.getSession(true);

        PrintWriter out = response.getWriter();
        
        
       String username=request.getParameter("username");
       System.out.println(username);
       String id=request.getParameter("id");
       String email=request.getParameter("mail");
       String ret=request.getParameter("rto_name");
       String add_ress=request.getParameter("addr");
       String vehicle=request.getParameter("vehi");
       String keyword=request.getParameter("key1");


        

        Connection conn = null; // connection to the database
        String message = null;  // message will be sent back to client


        try {
            // connects to the database
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

            // constructs SQL statement
            String sql = "insert into viw_upload(user_name, id_d, email_id, BANKING SECTOR_name, add_ress, vehicle,key_1) values (?,?,?,?,?,?,?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1,username);
            //statement.setString(2, file);
            statement.setString(2, id);
            statement.setString(3, email);
            statement.setString(4, ret);
            statement.setString(5, add_ress);
            statement.setString(6, vehicle);
             statement.setString(7, keyword);
            
            // sends the statement to the database server
            int row = statement.executeUpdate();
            if (row > 0)
            {
                session.setAttribute("fileid", id);
             session.setAttribute("msg", "File Uploaded Successfully");
           response.sendRedirect("sendmail?Email="+email+ "&keyyy="+keyword);
            }
             
            // sends the statement to the database server
           
        } 
        catch (Exception ex) {
           out.println(ex);
           //out.println(ex);

            response.sendRedirect("already.jsp");
        }
        finally
        {
            System.out.println("print");
        }
    }
}