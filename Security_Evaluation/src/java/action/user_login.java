/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package action;

import com.oreilly.servlet.MultipartRequest;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import pack.Compare;
import pack.Dbconnection;

/**
 *
 * @author IBN33
 */
public class user_login extends HttpServlet {
final String path2="D:/";
Blob image = null;
Connection con = null;
byte[] imgData = null ;
String type=null;

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
        try {
            String ip=request.getQueryString();
            out.println(ip);
           MultipartRequest m=new MultipartRequest(request,path2);
//           
//           out.println(m.getFile("image").getAbsolutePath());
           File img2=m.getFile("image");
//           if(img2.getAbsolutePath()){
//               out.println("true...");
//           }
//           else{
//               out.println("false...");
//           }
           
           String uname=m.getParameter("username");
           String pass=m.getParameter("password");
           
           Connection con=Dbconnection.getConn();
           Statement st=con.createStatement();
           Statement st1=con.createStatement();
           ResultSet rt=st.executeQuery("select * from user_reg where username='"+uname+"'");
           if(rt.next()){
               int count=0;
                count = Integer.parseInt(rt.getString("count"));
               String name=rt.getString("name");
               if(count<3){
                   
               if(pass.equals(rt.getString("password"))){
                   image=rt.getBlob("image_");
                   imgData=image.getBytes(1, (int)image.length());
                   InputStream is=image.getBinaryStream();
                   File img1=new File(path2+"image1.jpg");
                   FileOutputStream fos=new FileOutputStream(img1);
                   fos.write(imgData);
                  boolean s= new Compare().processImage(img1.getAbsolutePath(), img2.getAbsolutePath());
                  if(s){
                      //out.println("successs");
                        //activating user session
                      
                    HttpSession user=request.getSession(true);
                    user.setAttribute("username",uname);
                    user.setAttribute("name",name);
                      response.sendRedirect("user_page.jsp");
                      
                      ++count;
                   st1.executeUpdate("update user_reg set count='0'  where username='"+uname+"'");
                      
                      
                  }
                  else{
                      ++count;
                   st1.executeUpdate("update user_reg set count='"+count+"'  where username='"+uname+"'");
                      //out.println("failed.."+count);
                      response.sendRedirect("user_login.jsp?image='no'");
                  }
                  // out.println("success..");
                   
                   
                   
               }           
             
               else{
                   ++count;
                   System.out.println(count+" :   asdfsadf");
                   st1.executeUpdate("update user_reg set count='"+count+"' where username='"+uname+"'");
                   
                   out.println("Invalid password...");
               }
               
           }
                 else{
                    st1.executeUpdate("insert into attacker (ip, time)values('"+ip+"',now())");
                   out.println("<p style='text-align: center;font-size: 30px;position: relative;top: 200px;'>Oops ! Your account blocked due to invalid authendication.<br> Mail to administrator to recover account...</p>");
                   
               }
           }
           else{
               out.println("username not exist...");
           }
           
        } 
        catch(Exception e){

            out.println(e);
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
