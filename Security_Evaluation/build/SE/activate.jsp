


<%@page import="pack.Dbconnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="pack.MailUtil"%>
<%
       try {
            String id=request.getQueryString();
            Connection con=Dbconnection.getConn();
            Statement st=con.createStatement();
            int i=st.executeUpdate("update user_reg set activate='yes',count='0' where iduser_reg='"+id+"'");
            if(i!=0){
                ResultSet rt=st.executeQuery("select * from user_reg where iduser_reg='"+id+"'");
                if(rt.next()){
                    String name=rt.getString("name");
                    String uname=rt.getString("username");
                    
                    String[] mail=new String[]{rt.getString("mail")};
                    String sub="Account";
                    String msg="Admin activated your account. you can login ";
                    //sending mail
                   new MailUtil().sendMail(mail, mail, sub, msg);
                    response.sendRedirect("attacker.jsp");
                  
                }
                else{
                    out.println("internal error occured...");
                }
               
            }
            else{
                out.println("internal error occured...");
            }
            
        }
        catch(Exception e){
            out.println(e);
        }

%>