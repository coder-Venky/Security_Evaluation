<%@page import="java.sql.Statement"%>
<%@page import="pack.Dbconnection"%>
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
        <script type="text/javascript">
window.history.forward(1);
function noBack(){
window.history.forward();
}
</script>
</head>

<body onload="noBack();" onpageshow="if (event.persisted) noBack();" onunload="">
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
         
            <li><a href="files.jsp">Files</a></li>
            <li><a href="spam_filter.jsp">Spam Filter</a></li>
            <li><a href="profile_picture.jsp">Change Profile Picture</a></li>
          <li><a href="index.html">Logout</a></li>
<!--          <li><a href="projects.html">Projects</a></li>
          <li><a href="contact.html">Contact Us</a></li>-->
        </ul>
      </div><!--close menubar-->	
    </nav>	
    
	<div id="site_content">	
<%
 Connection con= Dbconnection.getConn();
 Statement st=con.createStatement();
 
       
%>
      <div >
	    <ul >
                <li ><img width="200" height="250" src="disp_image.jsp" alt="&quot;face detection&quot;"/></li>
<!--          <li><img width="900" height="250" src="images/b2.png" alt="&quot;face detection&quot;" /></li>-->
<!--          <li><img width="900" height="250" src="images/home_1.jpg" alt="&quot;Enter your caption here&quot;" /></li>-->
        </ul> 
	  </div>	
	
	  <div id="content">
        <div class="content_item">
            <%
HttpSession user=request.getSession();
String name=user.getAttribute("name").toString();           
%>
		  <h1>Welcome ! <%=name%></h1> 
          

		  
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
