<%@page import="pack.Dbconnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html> 
<html>

<head>
  <title>Security Evaluation</title>
  <meta name="description" content="website description" />
  <meta name="keywords" content="website keywords, website keywords" />
  <meta http-equiv="content-type" content="text/html; charset=windows-1252" />
  <link rel="stylesheet" type="text/css" href="css/style.css" />
  <!-- modernizr enables HTML5 elements and feature detects -->
  <script type="text/javascript" src="js/modernizr-1.5.min.js"></script>
    <link rel="shortcut icon" type="x-icon" href="images/ic.png"/>
                  <style>
    #id{
        width: 200px;
        height: 25px;
        background-color: #D3F2F7;
    }
    #but{
        width: 70px;
        height: 25px;
    }
    table{
        width: 750px;              
    }
    td{
        text-align: center;
    }
    table,td,tr{
        border-style: solid;
        border-collapse: collapse;
    }
    tr{
        height: 30px;
    }
</style>
</head>

<body>
  <div id="main">
    <header>
	  <div id="banner">
	    <div id="welcome">
	      <h3>Security <span>Evaluation</span></h3>
	    </div><!--close welcome-->
	    <div id="welcome_slogan">
	      <h3>Pattern Classifiers under Attack</h3>
	    </div><!--close welcome_slogan-->			
	  </div><!--close banner-->
    </header>

	<nav>
	  <div id="menubar">
        <ul id="nav">
            <li ><a href="activities.jsp">Uploads</a></li>
            <li><a href="downloads.jsp">Downloads</a></li>            
            <li><a href="admin_page.jsp">Home</a></li>
<!--          <li><a href="projects.html">Projects</a></li>
          <li><a href="contact.html">Contact Us</a></li>-->
        </ul>
      </div><!--close menubar-->	
    </nav>	
    
	<div id="site_content">	

<!--      <div class="slideshow">
	    <ul class="slideshow">
          <li class="show"><img width="900" height="250" src="images/b1.png" alt="&quot;face detection&quot;"/></li>
          <li><img width="900" height="250" src="images/b2.png" alt="&quot;face detection&quot;" /></li>
          <li><img width="900" height="250" src="images/home_1.jpg" alt="&quot;Enter your caption here&quot;" /></li>
        </ul> 
	  </div>	-->
	
	  <div id="content">
        <div class="content_item">
            <table>
                 <caption> <h1>Downloads</h1></caption>
                      <tr style="background-color: #ffcccc">
                          <td>FILENAME</td><td>USER</td><td>TIME</td>
                      </tr>
                      <%
Connection con=Dbconnection.getConn();
Statement st=con.createStatement();
ResultSet rt=st.executeQuery("select * from downloads");
              
while(rt.next()){    

%>
<tr>
    <td><%=rt.getString("filename")%></td>
    <td><%=rt.getString("username")%></td>
    <td><%=rt.getString("time_")%></td>
   
</tr>
<%
}
%>
            
            </table>
         		

		  
		</div><!--close content_item-->
      </div><!--close content-->   
	</div><!--close site_content-->  	
  </div><!--close main-->
  
<!--    <footer>
	  <a href="index.html">Home</a> | <a href="ourwork.html">Our Work</a> | <a href="testimonials.html">Testimonials</a> | <a href="projects.html">Projects</a> | <a href="contact.html">Contact</a><br/><br/>
	  website template by <a href="http://www.freehtml5templates.co.uk">Free HTML5 Templates</a>
    </footer>-->

  <!-- javascript at the bottom for fast page loading -->
  <script type="text/javascript" src="js/jquery.js"></script>
  <script type="text/javascript" src="js/image_slide.js"></script>
  
</body>
</html>
