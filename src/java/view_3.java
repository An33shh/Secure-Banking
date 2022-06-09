
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


@WebServlet("/view_3")
@MultipartConfig(maxFileSize = 16177215)    // upload file's size up to 16MB
public class view_3 extends HttpServlet {

    // database connection settings
    private String dbURL = "jdbc:mysql://localhost:3306/image_authentication";
    private String dbUser = "root";
    private String dbPass = "admin";

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        // gets values of text fields
        HttpSession session=request.getSession(true);

        PrintWriter out = response.getWriter();
        
        
       String fid=request.getParameter("fi_id"); 
       System.out.print(fid);
       String file_name = request.getParameter("fi_name");
       System.out.print(file_name);
       String secrete = request.getParameter("secrete_key");
       System.out.print(secrete);
        InputStream inputStream = null; // input stream of the upload file

        // obtains the upload file part in this multipart request
        Part filePart = request.getPart("file");
        System.out.print(filePart);
        if (filePart != null) {
            // prints out some information for debugging
            System.out.println(filePart.getName());
            //System.out.println(filePart.getSize());
            System.out.println(filePart.getContentType());
            // obtains input stream of the upload file
            inputStream = filePart.getInputStream();
        }

        Connection conn = null; // connection to the database
        String message = null;  // message will be sent back to client


        try {
            // connects to the database
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

            // constructs SQL statement
            String sql = "insert into secrete_file(file_id, filename, encrypt, secrete) values (?,?,?,?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1,fid);
            //statement.setString(2, file);
            statement.setString(2, file_name);
            statement.setString(4, secrete);
            if (inputStream != null) {
                // fetches input stream of the upload file for the blob column
                statement.setBlob(3, inputStream);
                System.out.print(inputStream);
            }

            // sends the statement to the database server
            int row = statement.executeUpdate();
            if (row > 0)
            {
                session.setAttribute("fileid",fid);
                session.setAttribute("fi_name",file_name);
                session.setAttribute("secre",secrete);

             session.setAttribute("msg", "File Uploaded Successfully");
             response.sendRedirect("accept_1.jsp");
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