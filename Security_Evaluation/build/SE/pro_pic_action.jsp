

<%@page import="java.sql.PreparedStatement"%>
<%@page import="pack.Dbconnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%
HttpSession user=request.getSession();
String uname=user.getAttribute("username").toString();   

 File file;
    final String filepath="D:/";

     MultipartRequest m=new MultipartRequest(request,filepath);     
     file=m.getFile("pic");
     InputStream is=new FileInputStream(file);
       Connection con= Dbconnection.getConn();
       PreparedStatement ps=con.prepareStatement("update user_reg set profile_picture=?,picture_name=? where username='"+uname+"'");
       ps.setAsciiStream(1, is,(int)file.length());
       ps.setString(2, file.getName());
       ps.execute();
       out.println("success..");
       response.sendRedirect("profile_picture.jsp?up='yes'");
    
%>