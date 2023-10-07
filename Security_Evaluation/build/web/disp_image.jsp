<%-- 
    Document   : disp_image
    Created on : Dec 9, 2014, 2:58:52 PM
    Author     : IBN33
--%>

<%@page import="pack.Dbconnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"  
    pageEncoding="ISO-8859-1"%>  
<%@ page import="java.sql.*"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">  
<%@ page import="java.sql.*"%>

<%@ page import="java.io.*"%>
<html>
    <body>
<% 
Blob image = null;
Connection con = null;
byte[ ] imgData = null ;
Statement stmt = null;
ResultSet rs = null;
String type=null;

try {
    HttpSession user=request.getSession();
String uname=user.getAttribute("username").toString();
    
 con= Dbconnection.getConn();
stmt = con.createStatement();
rs = stmt.executeQuery("select * from user_reg where username='"+uname+"' ");
if (rs.next()) {
image = rs.getBlob("profile_picture");
String[] s=rs.getString("picture_name").split("\\.");
type=s[1];
imgData = image.getBytes(1,(int)image.length());

} else {
    
out.println("Display Blob Example");
out.println("image not found for given id");
return;
}

// display the image
response.setContentType(type);
OutputStream o = response.getOutputStream();
%>
<img src="<%o.write(imgData);%>" width="200" height="200">


 <%
o.flush();
o.close();  

} catch (Exception e) {

out.println("Unable To Display image");
out.println("Image Display Error=" + e.getMessage());
return;

} finally {

try {

rs.close();
stmt.close();
con.close();
} catch (SQLException e) {
    
e.printStackTrace();

}

}

%>
    </body>
</html>