package connection;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import javax.imageio.ImageIO;
import javax.swing.JOptionPane;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author mvinoth
 */
public class vino_decryption {
    File fKeyFile=null;
    File fEncrFile=null;
    private BufferedImage imgOverlay = null;
    private BufferedImage imgClean = null;
    private final Object request=null;
   public  int vino_decryption1 (String kname,String sname,String names,String path2)
     {
         try
         {
       System.out.println("Key File"+kname);
       fKeyFile=new File(kname);
       System.out.println(kname);
       System.out.println("Source File"+sname);
       fEncrFile=new File(sname);
       System.out.println(sname);
       if (fKeyFile == null || !fKeyFile.exists() || fEncrFile == null || !fEncrFile.exists()) {
				System.out.println( "File not found ERROR");
                                return 1;
				
			}
			
			BufferedImage imgKey = Crypting.loadAndCheckEncrFile(fKeyFile);
			if (imgKey == null) {
				System.out.println( fKeyFile.getName() + " is not a valid key file");
                                return 1;
				
			}
			BufferedImage imgEnc = Crypting.loadAndCheckEncrFile(fEncrFile);
			if (imgEnc == null) {
				System.out.println( fEncrFile.getName() + " is not an encrypted image");
                                return 1;
				
			}
			
			imgOverlay = Crypting.overlayImages(imgKey, imgEnc);
			if (imgOverlay == null) {
				System.out.println("Decryption failed - key and encrypted image not the same size?ERROR");
                                return 1;
				
			}
			imgClean = Crypting.decryptImage(imgOverlay);
			if (imgClean == null) {
			System.out.println("Decryption failed - key and encrypted image not the same size?ERROR");
                        return 1;
				
			}
                        /*String path = request.getSession().getServletContext().getRealPath("/");
              // String patt=path.replace("\\build", "");
               
               String strPath = path+"\\"+saveFile;*/
                        File f = new File(path2+names+"1.png");
                        
                        
		    	if (!f.toString().endsWith(".png")) {
		    		f = new File(f.toString() + ".png");
		    	}
		    	try {
					ImageIO.write(imgOverlay, "png", f);
				} catch (IOException e1) {
					System.out.println( "Could not Save file because: " + e1.getLocalizedMessage());
                                        return 1;
				}
                        File f1 = new File(path2+names+"2.png");
		    	if (!f1.toString().endsWith(".png")) {
		    		f1 = new File(f1.toString() + ".png");
		    	}
		    	try {
					ImageIO.write(imgClean, "png", f1);
				} catch (IOException e1) {
					System.out.println("Could not Save file because: " + e1.getLocalizedMessage());
                                        return 1;
				}
         }
         catch(Exception e)
         {
           System.out.println(e);
            return 1;
         }
         return 0;
       
     }
    /* public  static void main(String args[])
    {
         vino_decryption vv=new  vino_decryption();
  
    }*/
}
