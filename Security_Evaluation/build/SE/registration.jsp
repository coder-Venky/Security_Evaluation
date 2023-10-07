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
             <script>
    function validation(){
        var uname=document.ureg.username.value;
        var pass=document.ureg.password.value;
        var cpass=document.ureg.cpassword.value;
        var mail=document.ureg.mail.value;
        var name=document.ureg.name.value;
        var ph=document.ureg.mobile.value;
        
        if(name==0){
            alert("Enter name");
            document.ureg.name.focus();
            return false;
        }
        if(uname==0){
            alert("Enter username");
            document.ureg.username.focus();
            return false;
        }
        if(pass==0){
            alert("Enter password");
            document.ureg.password.focus();
            return false;
        }
        if(cpass!=pass){
            alert("Incorrect password");
            document.ureg.cpassword.focus();
            return false;
        }
        
        
        if(mail==0){
            alert("Enter mailid");
            document.ureg.mail.focus();
            return false;
        }
        if(ph==0){
            alert("Enter your mobile no");
            document.ureg.mobile.focus();
            return false;
        }
         if(isNaN(ph)){
                 alert("Invalid phoneno");
                 document.ureg.mobile.focus();
                 return  false;
            }
    }
</script>
<style>
    input{
        width: 200px;
        height: 25px;
        background-color: #D5D5D5;
    }
    #but{
        width: 75px;
        height: 25px;
    }
</style>
</head>

<body>
    <%
if(request.getParameter("yes")!=null){
    out.println("<script>alert('registered ! you can login after the indimation of admin...  ')</script>");
}    
if(request.getParameter("exist")!=null){
    out.println("<script>alert('username already exist...')</script>");
} 
%>
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
          <li ><a href="index.html">Home</a></li>
          <li><a href="user_login.jsp">User Login</a></li>
          <li><a href="admin_login.jsp">Admin</a></li>
<!--          <li><a href="projects.html">Projects</a></li>
          <li><a href="contact.html">Contact Us</a></li>-->
        </ul>
      </div><!--close menubar-->	
    </nav>	
    
	<div id="site_content">	

      <div class="slideshow">
	    <ul class="slideshow">
          <li class="show"><img width="900" height="250" src="images/r1.png" alt="&quot;face detection&quot;"/></li>
          <li><img width="900" height="250" src="images/up.png" alt="&quot;face detection&quot;" /></li>
<!--          <li><img width="900" height="250" src="images/home_1.jpg" alt="&quot;Enter your caption here&quot;" /></li>-->
        </ul> 
	  </div>	
	
	  <div id="content">
        <div class="content_item">
		               <fieldset style="background-color: #70D4E6;">
              <center>
                  <h2 class="title"style="color: coral">USER &nbsp;REGISTRATION </h2><br>
              </center>
                        
                                   <form action="user_reg_action.jsp" name="ureg" style="position: relative;left: 350px;" method="post" enctype="multipart/form-data" onsubmit="return validation()"> 
<!--                  USERNAME:<br>-->

ENTER NAME:<BR>
<input type="text" name="name" placeholder="Enter your name" ><br></br>
ENTER USERNAME:<BR>
<input type="text" name="username" placeholder="Enter username"><br></br>
<!--                  PASSWORD:<br>-->
ENTER PASSWORD:<BR>
<input type="password" name="password" placeholder="Enter password"><br></br>
ENTER CONFIRM PASSWORD:<BR>
<input type="password" name="cpassword" placeholder="confirm your password"><br></br>
UPLOAD IMAGE:<BR>
<input type="file" name="image" ><br></br>
ENTER MAIL:<BR>
<input type="email" id="" name="mail" placeholder="Enter your email"><br></br>
ENTER PHONE NO:<BR>
<input type="text" name="mobile" placeholder="Enter your mobile no" maxlength="10"><br></br>
&nbsp;<input type="submit" id="but" value="Login"style="background-color: yellowgreen;color: #ffffff"/>
&nbsp;&nbsp;   <input type="reset"id="but" value="Reset" style="background-color: #AA3300;color: #ffffff"></input><br></br>
                                                         
                
            
		</form>
                       
                   
          </fieldset>
		  
		</div><!--close content_item-->
      </div><!--close content-->   
	</div><!--close site_content-->  	
  </div><!--close main-->
  
    <footer>
<!--	  <a href="index.html">Home</a> | <a href="ourwork.html">Our Work</a> | <a href="testimonials.html">Testimonials</a> | <a href="projects.html">Projects</a> | <a href="contact.html">Contact</a><br/><br/>
	  website template by <a href="http://www.freehtml5templates.co.uk">Free HTML5 Templates</a>-->
    </footer>

  <!-- javascript at the bottom for fast page loading -->
  <script type="text/javascript" src="js/jquery.js"></script>
  <script type="text/javascript" src="js/image_slide.js"></script>
  
</body>
</html>
