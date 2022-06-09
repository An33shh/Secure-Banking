package connection;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.imageio.ImageIO;
import javax.swing.JOptionPane;

/**
 *
 * @author mvinoth
 */
 public class Vino_Encryption {
   // private JFileChooser fileChooser = new JFileChooser();
	private BufferedImage imgKey = null;
	private BufferedImage imgEnc = null;
	File fSrcFile = null;
		
 public Vino_Encryption(String name,String path,String opath) throws IOException {
     
       // URL location = Vino_Encryption.class.getProtectionDomain().getCodeSource().getLocation();
        //System.out.println(location.getFile());
     
     //String path = request.getSession().getServletContext().getRealPath("/");
              // String patt=path.replace("\\build", "");
               
             //  String strPath = path+"\\serverImage\\"+names+".png";
 //name=   this.getClass().getResource(name).toString();
 System.out.println("entered"+path);
    fSrcFile  = new File(path);
    
System.out.println("D::://"+name);
		    	//tfImage.setText(fSrcFile.toString());
       if (fSrcFile == null || !fSrcFile.exists()) {
				System.out.println( "File not found ERROR");
				
			}
			BufferedImage imgSrc = Crypting.loadAndCheckSource(fSrcFile, 0, 0, false);
			if (imgSrc == null) {
				System.out.println( fSrcFile.getName() + " is not fit for encryption");
				
			}
			
			imgKey = Crypting.generateKey(imgSrc.getWidth(), imgSrc.getHeight());
			imgEnc = Crypting.encryptImage(imgKey, imgSrc);
			
			if (imgKey == null || imgEnc == null) {
				System.out.println( "Error while encrypting ");
				
			}
                        if (imgKey == null) return;
                        File f = new File(opath+"\\k"+name);
                        System.out.println(opath+"\\k"+name);
		    	if (!f.toString().endsWith(".png")) {
		    		f = new File(f.toString() + ".png");
		    	}
		    	try {
					ImageIO.write(imgKey, "png", f);
				} catch (IOException e1) {
				System.out.println( "Could not Save file because: " + e1.getLocalizedMessage());
				}
                        File f1 = new File(opath+"\\s"+name);
		    	   System.out.println(opath+"\\s"+name);
		    	try {
					ImageIO.write(imgEnc, "png", f1);
                                       System.out.println( "Successfully Save");
                                    
                                        
				} catch (IOException e1) {
					System.out.println( "Could not Save file because: " + e1.getLocalizedMessage());
				}
          
    }
    
  
    
}
