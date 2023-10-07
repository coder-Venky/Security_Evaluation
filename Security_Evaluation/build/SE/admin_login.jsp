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
        width: 60px;
        height: 25px;
    }
</style>
<script>
    function validation(){
        var uname=document.ulogin.username.value;
        var pass=document.ulogin.password.value;
        
        if(uname==0){
            alert("Enter ADMIN ID");
            document.ulogin.username.focus();
            return false;
        }
        if(pass==0){
            alert("Enter password");
            document.ulogin.password.focus();
            return false;
        }
    }
</script>
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
          <li><a href="index.html">Home</a></li>
          <li><a href="user_login.jsp">User</a></li>
          <li  class="current"><a href="">Admin</a></li>
<!--          <li><a href="projects.html">Projects</a></li>
          <li><a href="contact.html">Contact Us</a></li>-->
        </ul>
      </div><!--close menubar-->	
    </nav>	
    
	<div id="site_content">	

      <div class="slideshow">
	    <ul class="slideshow">
        
          <li><img width="900" height="250" src="images/add2.png" alt="&quot;face detection&quot;" /></li>
           <li><img width="900" height="250" src="images/add1.jpg" alt="&quot;face detection&quot;" /></li>
<!--          <li><img width="900" height="250" src="images/home_1.jpg" alt="&quot;Enter your caption here&quot;" /></li>-->
        </ul> 
	  </div>	
	
	  <div id="content">
        <div class="content_item">
		 <fieldset style="background-color: wheat">
          <center>
        <h1>Admin Login</h1>
        <form action="admin_log_action.jsp" name="ulogin" method="post" onsubmit="return validation()"> 
<!--                  USERNAME:<br>-->
<input type="text" id="id" name="username" placeholder="Enter ADMIN  ID"/><br></br>
<!--                  PASSWORD:<br>-->
<input type="password"  id="id"name="password" placeholder="Enter password"/><br></br>
<input type="submit" id="but" value="Login"style="background-color: yellowgreen;color: #ffffff"/>
&nbsp;&nbsp;
                             <input type="reset"id="but" value="Reset" style="background-color: #AA3300;color: #ffffff"></input><br></br>
                           
                
            
		</form>
                       
          </center>
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
