


<%
  try {
             String uname=request.getParameter("username");
           String pass=request.getParameter("password");
           
           if(uname.equalsIgnoreCase("admin")&&pass.equalsIgnoreCase("admin")){
               //out.println("success... ");
               response.sendRedirect("admin_page.jsp");
           }
           else{
               out.println("incorrect username or password ");
           }
        } 
        catch(Exception e){
            out.println(e);
        }
%>