<%-- 
    Document   : forgotpassword
    Created on : 18-Aug-2020, 11:23:18 pm
    Author     : Monisha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body{
                padding-top: 30px;
            }
            .border1 {
                
              
                width: 500px;
                border: 5px solid grey;
                padding: 50px;
                margin: auto;
                
            }
        </style> 
    </head>
    <body>
        <div class="border1">
         <span>Enter your mail id to change password</span>
         <br>
         <br>
        <form action="forgotPassword" method="post">
            <input type="text" name="email" >
            
            <input type="submit" value="Send">
        </form>
        </div>
    </body>
</html>
