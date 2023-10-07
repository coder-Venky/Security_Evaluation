



<%@page import="pack.MailUtil"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="pack.Dbconnection"%>
<%
try {
    File file;
    final String filepath="D:/";

     MultipartRequest m=new MultipartRequest(request,filepath);     
     file=m.getFile("image");
     InputStream is=new FileInputStream(file);
    
            String name=m.getParameter("name");
            String uname=m.getParameter("username");
            String pass=m.getParameter("password");
            String mail=m.getParameter("mail");
            String ph=m.getParameter("mobile");
           
            //out.println("name:"+name);
          Connection con= Dbconnection.getConn();
          Statement st=con.createStatement();
          ResultSet rt=st.executeQuery("select * from user_reg where username='"+uname+"'");
         
          if(rt.next()){
        // out.println("username already exist...");
         response.sendRedirect("registration.jsp?exist='username'");
        }else{            
                 PreparedStatement ps=con.prepareStatement("insert into user_reg (username,name,password,mail,phoneno,activate,image_name,image_,count,profile_picture,picture_name)values(?,?,?,?,?,?,?,?,?,?,?)");
          ps.setString(1, uname);
          ps.setString(2,name);
          ps.setString(3,pass);
          ps.setString(4, mail);
          ps.setString(5, ph);
          ps.setString(6, "no");
          ps.setString(7, file.getName());
          ps.setAsciiStream(8,is,(int)file.length());
          ps.setString(9, "0");
          ps.setAsciiStream(10,is,(int)file.length());
          ps.setString(11, file.getName());
         
          
          boolean s=ps.execute();
           String[] mm=new String[]{mail};
          new MailUtil().sendMail(mm, mm, "Registration","your account registered .Use this mailid for any future references...");
          if(s){
              out.println("internal error...try again later");
          }
          else{
              response.sendRedirect("registration.jsp?yes='registered'");
          }
         
        }          
}

        catch(Exception e){
            out.println(e);
        }
%>
