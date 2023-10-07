

<%@page import="java.nio.charset.Charset"%>
<%@page import="java.io.ByteArrayInputStream"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="pack.Dbconnection"%>
<%@page import="java.sql.Connection"%>
<%
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
             
              StringBuffer op=new StringBuffer();
              
              while((temp=br.readLine())!=null){
                  String[] s=temp.split(" ");
                  
                  
                  for(String tem:s){
                    //out.println(tem);
                      ResultSet rt1=st.executeQuery("select word from spam_words");
                      while(rt1.next()){
                          if(tem.equalsIgnoreCase(rt1.getString("word"))){
                              tem="*****";
//                              out.println("/spam word: "+tem+"/");
                          }                                               
                                                                            
                      }
                        op.append(tem);
                        op.append(" ");                          
                  }
                  
                  op.append("\n");
                   
              }
         out.println(op.toString());
            String oop=op.toString();
           InputStream ins=new ByteArrayInputStream(oop.getBytes());
            PreparedStatement ps=con.prepareStatement("update files set file_=?,applied_spam=? where id=?");
            ps.setAsciiStream(1,ins);
              ps.setString(2, "yes");
            ps.setString(3, id);
            ps.execute();
            out.println("success...");
           response.sendRedirect("spam_filter.jsp?yes='applied'");
          }
          else{
              out.println("<p>Oops ! your requested file not found...</p>");
          }
          
        } 
        catch(Exception e){
            out.println(e);
        }

%>