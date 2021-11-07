<%-- 
    Document   : adminDashboard
    Created on : 13-Aug-2020, 12:26:51 pm
    Author     : Monisha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,monisha.Mysql"%>
<%
response.setHeader("Cache-Control", "no-cache");

//Forces caches to obtain a new copy of the page from the origin server
response.setHeader("Cache-Control", "no-store");

//Directs caches not to store the page under any circumstance
response.setDateHeader("Expires", 0);

//Causes the proxy cache to see the page as "stale"
response.setHeader("Pragma", "no-cache");
//HTTP 1.0 backward enter code here
%>
<!DOCTYPE html>
<html>
    <head>
        <title>adminDashboard</title>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <style>
      html, body {
    margin: 0;
    height: 100%;
    }
     .nav-pills>li.active>a, .nav-pills>li.active>a:focus, .nav-pills>li.active>a:hover {
    color: #fff;
    background-color: black;
     }
     a{
         color: black;
     }
     .bg-custom-1 {
           background-color: #85144b;
       }

      .bg-custom-2 {
        background-image: linear-gradient(15deg, #13547a 0%, #80d0c7 100%);
        }
    /* Remove the navbar's default margin-bottom and rounded borders */ 
        .navbar {
          margin-bottom: 0;
          border-radius: 0;
          background-color: black;
        }
    
        /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
        .row.content {height: 100%}

        /* Set gray background color and 100% height */
        .sidenav {
          padding-top: 20px;
          background-color: #f1f1f1;
          height: 100%;
        }
    
    

        /* On small screens, set height to 'auto' for sidenav and grid */
        @media screen and (max-width: 767px) {
          .sidenav {
            height: 100%;
            padding: 15px;
          }
          .row.content {height:auto;} 
        }
        .container-fluid {
        height: 100%;
    }
        * {
      box-sizing: border-box;
          }
    
      /*.container {
        position: relative;
        border-radius: 5px;
        background-color: #f2f2f2;
        padding: 5px;
      }  */
      
        input[type=date]{
          box-sizing: border-box;
          
        }
        input[type=submit] {
          background-color: #4CAF50;
          color: white;
          padding: 12px 20px;
          border: none;
          border-radius: 4px;
          cursor: pointer;
        }

        input[type=submit]:hover {
          background-color: #45a049;
        }
         .container{
            width:100%;
            padding-top: 40px;
        }
        .fa{
            color: whitesmoke;
        }
      
        table {
            width: 100%;
          }

        th {
          height: 50px;
          fo
        }
        
  </style>
  <script>
      $(document).ready(function() {
	$('a.loanrequest').on('click', function() {
                console.log("success");
		$("#tablecontent").show();
                $("#homecontent").hide();
		
	});
	$('a.home').on('click', function() {
                console.log("success");
		$("#homecontent").show();
                $("#tablecontent").hide();
               
		
	});
        });
        function accept(x){
            var id = x.id;
            sanction(id,true);
            document.getElementById("current").innerHTML= "Approved";
            document.getElementById("current").style.color = "limegreen";
            document.getElementById("current").style.fontSize = "25px";
        }
        function decline(x){
             var id = x.id;
             sanction(id,false);
             document.getElementById("current").innerHTML = "Declined";
             document.getElementById("current").style.color = "red";
             document.getElementById("current").style.fontSize = "25px";
        }
    
         function sanction(id,accept){
                 var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function() {
                  if (this.readyState === 4 && this.status === 200) {
                     
                    
                  }
                  };
                xhttp.open("POST", "http://localhost:8080/Star_Banking_Finance/SanctionProcessServlet?RID="+id+"&accept="+accept, true);
                xhttp.send(); 
            } 
  </script>
        
    </head>
    <body>
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
              <div class="navbar-header">
                <i style="font-size:45px" class="fa" >&#xf006;</i>
                 <a class="navbar-brand" href="#" style="color:white; font-size:12px">STAR</a>
               </div>
               <div class="collapse navbar-collapse" id="myNavbar">
                 <ul class="nav navbar-nav navbar-right">
                   <li><a href="logout" style="color:white"><span class="glyphicon glyphicon-log-out" ></span> Logout</a></li>
                 </ul>        
                </div>
              
            </div>
        </nav>
        <div class="container-fluid ">    
            <div class="row content">
              <div class="col-sm-2 sidenav ">
                 <ul class="nav nav-pills nav-stacked">
                  
                     <li class="active"><a href="#" class="home">Home</a></li>
                  <li><a href="#" class="loanrequest">Loan Request</a></li>
                  
                </ul>


              </div>
            <div class="container" id="tablecontent" style="display:none">
            <div class="col-sm-8"  >
             <table border=1 align=center style="text-align:center">
              <thead>
                  <tr>
                     <th>RID</th>
                     
                     <th>KN</th>
                     <th>GOLD</th>
                     <th>WEIGHT</th>
                     <th>PLACE</th>
                     <th>JEWELLER</th>
                     <th>VALIDATE</th>
                  </tr>
              </thead>
              <tbody>
            <%
            try
            {
                Connection con1 = Mysql.getconnection();
                Statement st=con1.createStatement();
                ResultSet rs=st.executeQuery("select * from userloanrequestdetails;");
                
                while(rs.next())
                {
                    int status = rs.getInt("loanSanctionStatus");
                    if(status==-1){
                    %>
                    <tr >
                        <td><%=rs.getInt("RID") %></td>
                        <td><%=rs.getInt("kn") %></td>
                        <td><%=rs.getString("goldtype") %></td>
                        <td><%=rs.getString("weight") %></td>
                        <td><%=rs.getString("place") %></td>
                        <td><%=rs.getString("jewellerNameAddress") %></td>
                   
                        
                         <td id="current">
                            <button class="btn btn-success" id="<%=rs.getInt("RID") %>" onclick="accept(this)">Accept</button>
                            <button class="btn btn-danger" id="<%=rs.getInt("RID") %>" onclick="decline(this)" >Reject</button>
                        </td >
                        <%}%>
                    </tr>
                    <%}%>
                   </tbody>
                </table><br>
            <%}
            catch(Exception e){
                out.print(e.getMessage());%><br><%
            }

            %>
                 
             </div>
         </div>
            <div class="container" id="homecontent">
            <div class="col-sm-8" >
             <table border=1 align=center style="text-align:center">
              <thead>
                  <tr>
                     <th>RID</th>
                     
                     <th>KN</th>
                     <th>GOLD</th>
                     <th>WEIGHT</th>
                     <th>PLACE</th>
                     <th>JEWELLER</th>
                     <th>STATUS</th>
                  </tr>
              </thead>
              <tbody>
            <%
            try
            {
                Connection con1 = Mysql.getconnection();
                Statement st=con1.createStatement();
                ResultSet rs=st.executeQuery("select * from userloanrequestdetails;");
                
                while(rs.next())
                {
                    int status = rs.getInt("loanSanctionStatus");
                    
                    %>
                    <tr >
                        <td><%=rs.getInt("RID") %></td>
                        <td><%=rs.getInt("kn") %></td>
                        <td><%=rs.getString("goldtype") %></td>
                        <td><%=rs.getString("weight") %></td>
                        <td><%=rs.getString("place") %></td>
                        <td><%=rs.getString("jewellerNameAddress") %></td>
                        <% if(status == 1)
                        {%>
                        <td style="color:limegreen;font-size:25px">Approved</td>
                        <% }else if(status == 0)
                        {%>
                        <td style="color:red;font-size:25px">Declined</td>
                        <%}
                        else{%>
                        <td style="color:red;font-size:25px">Pending</td>
                        <%}%>
                    </tr>
                    <%}%>
                   </tbody>
                </table><br>
            <%}
            catch(Exception e){
                out.print(e.getMessage());%><br><%
            }

            %>
                 
             </div>
         </div>
        </div>
        </div>
    </body>
</html>
