/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


import connection.Vino_Encryption;
import connection.DatabaseConnection;
import java.awt.Color;
import java.awt.Font;
import java.awt.FontMetrics;
import java.awt.Graphics2D;
import java.awt.RenderingHints;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.imageio.ImageIO;
import javax.mail.Message.*;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author admin
 */
@WebServlet("/Check_authen2")
public class Check_authen2 extends HttpServlet {

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
        String c_mail=request.getParameter("mail");
        String c_otp=request.getParameter("otp");
        try 
        {
            
             Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/image_authentication","root","admin");
                       //  String nameq=(String)session.getAttribute("name");
            String names=null;
            // session.setAttribute("name",nameq);
            String sql="select * from ownregister where email='"+c_mail+"' ";
            Statement stt=con.createStatement();
            ResultSet rss=stt.executeQuery(sql);
            if(rss.next())
            {
                names=rss.getString("username");
            }
           //  rString names=(String)session.getAttribute("name");
            // session.setAttribute("name1",names);
            //String en=(String)session.getAttribute("name1");
                System.out.println("name:\t"+names+"\n");
                    final String ALPHA_NUM = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
                    final String nums="1234567890";
                          String text = "";
                   StringBuffer sb = new StringBuffer(5);
                   for (int i = 0; i < 5; i++) {
                   int ndx = (int) (Math.random() * ALPHA_NUM.length());
                   sb.append(ALPHA_NUM.charAt(ndx));
                   }
                   text= sb.toString();
                   String temp=text;
                   StringBuffer sb1 = new StringBuffer(2);
                   for (int i = 0; i < 1; i++) {
                   int ndx = (int) (Math.random() * nums.length());
                   sb1.append(ALPHA_NUM.charAt(ndx));
                   }
                   String name="image"+sb1.toString();
//System.out.println(grs.getAlphaNumeric(20));

        /*
           Because font metrics is based on a graphics context, we need to create
           a small, temporary image so we can ascertain the width and height
           of the final image
         */
        BufferedImage img = new BufferedImage(1, 1, BufferedImage.TYPE_INT_ARGB);
        Graphics2D g2d = img.createGraphics();
        Font font = new Font("Arial", Font.PLAIN, 48);
        g2d.setFont(font);
        FontMetrics fm = g2d.getFontMetrics();
        int width = fm.stringWidth(text);
        int height = fm.getHeight();
        g2d.dispose();

        img = new BufferedImage(width, height, BufferedImage.TYPE_INT_ARGB);
        g2d = img.createGraphics();
        g2d.setRenderingHint(RenderingHints.KEY_ALPHA_INTERPOLATION, RenderingHints.VALUE_ALPHA_INTERPOLATION_QUALITY);
        g2d.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
        g2d.setRenderingHint(RenderingHints.KEY_COLOR_RENDERING, RenderingHints.VALUE_COLOR_RENDER_QUALITY);
        g2d.setRenderingHint(RenderingHints.KEY_DITHERING, RenderingHints.VALUE_DITHER_ENABLE);
        g2d.setRenderingHint(RenderingHints.KEY_FRACTIONALMETRICS, RenderingHints.VALUE_FRACTIONALMETRICS_ON);
        g2d.setRenderingHint(RenderingHints.KEY_INTERPOLATION, RenderingHints.VALUE_INTERPOLATION_BILINEAR);
        g2d.setRenderingHint(RenderingHints.KEY_RENDERING, RenderingHints.VALUE_RENDER_QUALITY);
        g2d.setRenderingHint(RenderingHints.KEY_STROKE_CONTROL, RenderingHints.VALUE_STROKE_PURE);
        g2d.setFont(font);
        fm = g2d.getFontMetrics();
        g2d.setColor(Color.BLACK);
        g2d.drawString(text, 0, fm.getAscent());
        g2d.dispose();
        try {
             DatabaseConnection db1=new DatabaseConnection();
            String query="select * from upload where email='"+c_mail+"' and blood='"+c_otp+"'";
            ResultSet rs=db1.Select(query);
            if(rs.next())
            {
            Statement st=con.createStatement();
            ResultSet Rs;
            Statement st1=con.createStatement();
            ResultSet Rs1;
            String name1=names+".png";
            String timeStamp = new SimpleDateFormat("MM/dd/yyyy").format(Calendar.getInstance().getTime());
            System.out.println(timeStamp);
            
            //Rs=st.executeQuery("Select * from voting where username='"+name1+"'");
            //if(Rs.next()!=true)
            //{
                String path = request.getSession().getServletContext().getRealPath("/");
                // String patt=path.replace("\\build", "");
                String path2=path+"serverImage\\";
                String strPath = path+"serverImage\\"+name1;
                System.out.println("strpath1\t"+strPath);
                File f1=new File(strPath);
                System.out.println(name1+"\t"+strPath+"\t"+path2); 
                boolean k=ImageIO.write(img, "png", new FileOutputStream(f1));
                if(k){ System.out.println("Image Created"); }
                    try{
                        Vino_Encryption nn=new Vino_Encryption(name1,strPath,path2);
                        
                    }
                    catch(Exception e5){ System.out.println("e5:"+e5); }
            System.out.println("names below enc"+names);
            st.executeUpdate("insert into filekey values('"+temp+"','"+name1+"')");
            try
            {
                            
                final String username = "asoftware25@gmail.com";
		final String password = "Admin.123";
                            
                Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.socketFactory.port", "465");
		props.put("mail.smtp.socketFactory.class",
				"javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.port", "465");
                Session session1 = Session.getInstance(props,new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		  });
			Message message = new MimeMessage(session1);
			message.setFrom(new InternetAddress("asoftware25@gmail.com"));
			message.setRecipients(Message.RecipientType.TO,InternetAddress.parse(c_mail));
			message.setSubject("Welcome our company");
			message.setText("Dear"+names+"Your Source file" );
 
                        MimeBodyPart messageBodyPart = new MimeBodyPart();

                        Multipart multipart = new MimeMultipart();

                        messageBodyPart = new MimeBodyPart();
                         String pathh = request.getSession().getServletContext().getRealPath("/");
                              // String patt=path.replace("\\build", "");
                               String pathh2=pathh+"\\serverImage\\";
                               String strPathh = pathh+"\\serverImage\\k"+names+".png";
                        String file = pathh+"\\serverImage\\k"+names+".png";
                        String fileName = "k"+names+".png";
                        System.out.println(file);
                        DataSource source = new FileDataSource(file);
                        messageBodyPart.setDataHandler(new DataHandler(source));
                        messageBodyPart.setFileName(fileName);
                        multipart.addBodyPart(messageBodyPart);

                        message.setContent(multipart);
                                        Transport.send(message);

			System.out.println("Done");
                        //response.sendRedirect("crytoimage.jsp?nam="+names);
                                session.setAttribute("fname",name1);
                                session.setAttribute("keyd", temp);
                            //response.sendRedirect("keymail.jsp?nam="+names);
                            response.sendRedirect("check1.jsp?nam="+names);
		
                        }
                        catch(Exception e)
                        {
                            System.out.println(e);
                        }
            }
            else
            {
                session.setAttribute("msg","OTP wrong");
                 response.sendRedirect("check_authen.jsp");
            }
        }
        catch(Exception ex1)
        {
            out.println(ex1);
        } 
    }   catch (ClassNotFoundException ex) {
            Logger.getLogger(Check_authen2.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Check_authen2.class.getName()).log(Level.SEVERE, null, ex);
        }finally {            
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
