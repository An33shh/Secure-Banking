
import connection.email;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.MessagingException;
import javax.mail.internet.AddressException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.servlet.http.HttpSession;

@WebServlet("/upload")
    // upload file's size up to 16MB
public class upload extends HttpServlet {

    // database connection settings
    private String dbURL = "jdbc:mysql://localhost:3306/image_authentication";
    private String dbUser = "root";
    private String dbPass = "admin";

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        // gets values of text fields
        HttpSession session = request.getSession(true);

        PrintWriter out = response.getWriter();


        String fid = request.getParameter("file_id");
        System.out.print(fid);
        String name = request.getParameter("uname");
        System.out.print(name);
        String email = request.getParameter("email");
        System.out.print(email);
        String bank = request.getParameter("banksel");
        System.out.print(bank);
        String sub1 = request.getParameter("sub");
        System.out.print(sub1);
        String address1 = request.getParameter("address");
        System.out.print(address1);
        String blod_group1 = request.getParameter("key");
        System.out.print(blod_group1);
        String sex1 = request.getParameter("sex");
        System.out.print(sex1);
        
        String mob = request.getParameter("phone_no");
        System.out.print(mob);

        Random ran = new Random();
        int rannum = ran.nextInt(123456);
        
       
        Connection conn = null; // connection to the database
        String message = null;  // message will be sent back to client


        try {
            // connects to the database
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

            // constructs SQL statement sno, id_no, name, email, file, subject, address, blood, sex, vehicle, mobile, sts, bank, acct
            String sql = "insert into upload(id_no, name, email,subject, address, blood, sex, mobile,sts,bank,acct,vehicle) values (?,?,?,?,?,?,?,?,'Request',?,?,'EMP1000')";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, fid);
            //statement.setString(2, file);
            statement.setString(2, name);
            statement.setString(3, email);
            statement.setString(4, sub1);
            statement.setString(5, address1);
            statement.setString(6, blod_group1);
            statement.setString(7, sex1);
            
            statement.setString(8, mob);
            statement.setString(9, bank);
            statement.setString(10, bank + "2020" +rannum);

            email e=new email();
            try { 
                boolean k=e.email(email, blod_group1);
                if(k) System.out.println("EMail Sent Successfully");
            } catch (AddressException ex) {
                Logger.getLogger(upload.class.getName()).log(Level.SEVERE, null, ex);
            } catch (MessagingException ex) {
                Logger.getLogger(upload.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            // sends the statement to the database server
            int row = statement.executeUpdate();
            if (row > 0) {
                session.setAttribute("fileid", fid);
                session.setAttribute("msg", "File Uploaded Successfully");
                response.sendRedirect("doc_upload.jsp");
            }

            // sends the statement to the database server

        } catch (SQLException ex) {
            message = "ERROR: " + ex.getMessage();
            System.out.println(message);
            //out.println(ex);

           // response.sendRedirect("already.jsp");
        }
    }
}