/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package action;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import pack.Dbconnection;

/**
 *
 * @author IBN33
 */
public class spam_filter extends HttpServlet {

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
          String id=request.getQueryString();
          
          Connection con=Dbconnection.getConn();
          Statement st=con.createStatement();
          ResultSet rt=st.executeQuery("select * from files where id='"+id+"'");
          if(rt.next()){
              InputStream is=rt.getAsciiStream("file_");
              BufferedReader br=new BufferedReader(new InputStreamReader(is));
              String temp=null;
              
              Statement st1=con.createStatement();
              ResultSet rt1=st.executeQuery("select word from spam_words");
              StringBuffer op=new StringBuffer();
              
              while((temp=br.readLine())!=null){
                  String[] s=temp.split(" ");
                  
                  for(String tem:s){
                      while(rt1.next()){
                          if(tem.equalsIgnoreCase(rt1.getString("word"))){
                              op.append("******");
                          }
                          else{
                              op.append(tem);
                          }
                      }
                          
                  }
                  op.append("\n");
              }
             out.println(op.toString());
          }
          else{
              out.println("<p>Oops ! your requested file not found...</p>");
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
