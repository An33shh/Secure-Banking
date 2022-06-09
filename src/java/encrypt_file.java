
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


@WebServlet("/encrypt_file")
@MultipartConfig(maxFileSize = 16177215)    // upload file's size up to 16MB
public class encrypt_file extends HttpServlet {

    // database connection settings
    private String dbURL = "jdbc:mysql://localhost:3306/image_authentication";
    private String dbUser = "root";
    private String dbPass = "admin";

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        // gets values of text fields
       HttpSession session=request.getSession(true);
       PrintWriter out = response.getWriter();
       String fid=request.getParameter("file_id"); 
       System.out.print(fid);
       String secret=request.getParameter("sub");
       System.out.print(secret);
       String encrypt=request.getParameter("file");
       System.out.print(encrypt);
       
       String file_name=request.getParameter("file_name");
       System.out.print(file_name);
       String subject=request.getParameter("sub");
       System.out.print(subject);
       Connection conn = null; // connection to the database
       String message = null;  // message will be sent back to client
        try {
            // connects to the database
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

            // constructs SQL statement
            String sql = "insert into encrypt(file_id, secrete_key, content,serch_key1,subject,sts) values (?,?,?,?,?,'NO')";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1,fid);
            statement.setString(2,secret);
            statement.setString(3,encrypt);
            statement.setString(4,file_name);
            statement.setString(5,subject);
            //statement.setString(2, file);
            // sends the statement to the database server
            int row = statement.executeUpdate();
            if (row > 0)
            {
                session.setAttribute("fileid", fid);
             session.setAttribute("msg", "Encrypt File Uploaded Successfully.............");
             response.sendRedirect("doc_upload.jsp");
            }
             
            // sends the statement to the database server
           
        } 
        catch (SQLException ex) {
            message = "ERROR: " + ex.getMessage();
            System.out.println(message);
           //out.println(ex);

            response.sendRedirect("already.jsp");
        }
    }
}