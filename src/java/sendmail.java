import connection.email;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name="sendmail ",urlPatterns={"/sendmail "})
public class sendmail extends HttpServlet
{
    String uname,email,pu_key,se_key,phone,key1;
    @Override
    protected void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException
    {
        PrintWriter out=response.getWriter();
        response.setContentType("text/html");
        
        email=request.getParameter("Email");
        System.out.println(email);
        String skey=request.getParameter("keyyy");
        System.out.println(skey);
        try{
            email e=new email();
            boolean k= e.email(email, "SecretKey:\t"+skey);
            response.sendRedirect("view_resp.jsp");
            if(k) System.out.println("email sent Successfully");
            out.println("thank you");
        }
        catch(Exception e)
        {
        out.println(e);
        }
            
          
            
        }
        
        
}

