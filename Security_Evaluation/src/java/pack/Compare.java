package pack;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author IBN33
 */
import java.awt.Image;
import java.awt.Toolkit;
import java.awt.image.PixelGrabber;
 
public class Compare {
 
public boolean processImage(String file1,String file2) {
 boolean status=false;
//String file1 = "C:\\Users\\IBN33\\Desktop\\temp\\images\\icon1.png";
//String file2 = "C:\\Users\\IBN33\\Desktop\\temp\\images\\icon1.png";
 
Image image1 = Toolkit.getDefaultToolkit().getImage(file1);
Image image2 = Toolkit.getDefaultToolkit().getImage(file2);
 
try {
 
PixelGrabber grab1 =new PixelGrabber(image1, 0, 0, -1, -1, false);
PixelGrabber grab2 =new PixelGrabber(image2, 0, 0, -1, -1, false);
 
int[] data1 = null;
 
if (grab1.grabPixels()) {
int width = grab1.getWidth();
int height = grab1.getHeight();
data1 = new int[width * height];
data1 = (int[]) grab1.getPixels();
}
 
int[] data2 = null;
 
if (grab2.grabPixels()) {
int width = grab2.getWidth();
int height = grab2.getHeight();
data2 = new int[width * height];
data2 = (int[]) grab2.getPixels();
}
 
//System.out.println("Pixels equal: " + java.util.Arrays.equals(data1, data2));
 status=java.util.Arrays.equals(data1, data2);
 
} catch (InterruptedException e1) {
e1.printStackTrace();
}
        return status;
}
 
//public static void main(String args[]) {
//    String file1 = "C:\\Users\\IBN33\\Desktop\\temp\\images\\icon1.png";
//    String file2 = "C:\\Users\\IBN33\\Desktop\\temp\\images\\icon2.png";
//    boolean s=new Compare().processImage(file1,file2);
//    if(s){
//        System.out.println("true");
//    }
//    else{
//        System.out.println("false");
//    }
//}
}
