<%-- 
    Document   : login
    Created on : 08-Mar-2021, 7:57:07 pm
    Author     : Monisha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <title>SignUp/Login</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel = "icon" href =  
"S.png" 
        type = "image/x-icon"> 
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style>
    
body, html {
  height: 100%;
  font-family: Arial, Helvetica, sans-serif;
}
input{
    display: block;
}
* {
  box-sizing: border-box;
}
p{
    font-size: 15px;
}
.bg-img {
  /* The image used */
  background-image: url("college.jpg");

  height: 100%;
  overflow: auto;
  /* Center and scale the image nicely */
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
  position: fixed;
  top:0px;
  left:0px;
  width:100%;
  
}

/* Add styles to the form container */
.container {
  position: absolute;
  right: 0;
  margin: 80px;
  max-width: 350px;
  padding: 10px 25px;
  background-color: white;
  border-radius: 10px;
}

/* Full-width input fields */
input[type=text], input[type=password] {
  width: 100%;
  padding: 15px;
  margin: 15px 0 15px 0;
  border: none;
  background: #f1f1f1;
}

input[type=text]:focus, input[type=password]:focus {
  background-color: #ddd;
  outline: none;
}

/* Set a style for the submit button */
.btn {
  background-color: #4CAF50;
  color: white;
  padding: 16px 20px;
  border: none;
  cursor: pointer;
  width: 100%;
  opacity: 0.9;
}

.btn:hover {
  opacity: 1;
}
span{
    text-align: left;
    padding-left: 50px;
    color: aquamarine;
    padding-top: 50px;
}
</style>
</head>
<body>
     <script>
$(document).ready(function() {
	$('a.login').on('click', function() {
		$("#login-form").show();
		$("#register-form").hide();
	});
	
        });
        function onChange()
        {
            var email = document.getElementById('email').value;
            if(email!=="")
            {
                atpos = email.indexOf("@");
                dotpos = email.lastIndexOf(".");
         
         if (atpos < 1 || ( dotpos - atpos < 2 )) {
            
            document.getElementById('error').style.color = "red";
            error.innerHTML="<pre>   invalid email<pre>";
            
            document.register-form.email.focus() ;
            }
            else
               
                error.innerHTML="";
           }
           
        }
        function check()
        {
            var p = document.getElementById('pwd');
            var rp = document.getElementById('repeat_pwd');
         if (document.getElementById('pwd').value ===
            document.getElementById('repeat_pwd').value) {
           
            pwd.style.border = "2px solid #6ea045";
            repeat_pwd.style.border = "2px solid #6ea045";
            
            document.getElementById('pwd_error').style.color = 'green';
            document.getElementById('pwd_error').innerHTML = "<pre>  Matching</pre>";
            
            p.style.backgroundColor="#c6ed64";
            rp.style.backgroundColor="#c6ed64";
               
          } else {
            document.getElementById('pwd_error').style.color = 'red';
            document.getElementById('pwd_error').innerHTML = "<pre> Not matching</pre>";
          }
        }
        
        </script>
        
<div class="bg-img">
    
    
  <form id="register-form" action="registerUserVerification" method="post" class="container">
    <h2>Register</h2>
   
    <hr>
    <input type="text" placeholder="enter roll" name="roll" id="roll" required >
    
    <input type="text" placeholder="Enter Email" name="email" id="email" required onblur="onChange()">
    <div id="error"></div>
    
    <div id="pwd_div">
    <input type="password" placeholder="Enter Password" name="pwd" id="pwd" required >
    </div>
    
    <div id="repeat_pwd_div">
    <input type="password" placeholder="Re-Enter Password" name="repeat_pwd" id="repeat_pwd" required onkeyup="check()">
    <div id="pwd_error"></div>
    </div>
    
    <button type="submit" class="btn" >Register</button>
    <hr>
    <p>Already have an account?<a class="login" href="#"><b>SignIn</b></a></p>
  
  
    </form>
    
    
    <form id="login-form" action="loginServlet" class="container" style="display:none" method="post">
        <h2>Login</h2>
   
    <hr>
    <label for="email"><b>Email</b></label>
    <input type="text" placeholder="Enter Email" name="email" required>

    <label for="pwd"><b>Password</b></label>
    <input type="password" placeholder="Enter Password" name="pwd" required>
    
    <input type="submit" class="btn" value="Login">
    <hr>
    <p><a style="cursor: pointer" onclick="forgotPassword.jsp">forgot password?</a></p>
    </form>
</div>
   
    </body>
</html>
