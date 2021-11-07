<%-- 
    Document   : codeVerify
    Created on : 23-Jul-2020, 8:36:19 pm
    Author     : Monisha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>OTP Sent</title>
        <style>
            body{
                padding-top: 30px;
            }
            .border1 {
                
              
                width: 500px;
                border: 5px solid green;
                padding: 50px;
                margin: auto;
                
            }
        </style>
    </head>
    <body>
        <div class="border1">
         <span>We already send a verification  code to your email.</span>
         <br>
         <br>
        <form action="verifyCode" method="post">
            <input type="text" name="authcode" >
            
            <input type="submit" value="verify">
        </form>
        </div>
    </body>
</html>
