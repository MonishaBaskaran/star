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
<html lang="en">
<head>
  <title>Customer Page</title>
  <meta charset="utf-8">
    
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Bangers">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Caveat">
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
        .bg-custom-2 {
        background-image: linear-gradient(15deg, #13547a 0%, #80d0c7 100%);
        }
    /* Remove the navbar's default margin-bottom and rounded borders */ 
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
      background-color: black;
    }
    .container-fluid {
        height: 100%;
    }
    /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
    .row.content {height: 100%}
    
    /* Set gray background color and 100% height */
    .sidenav {
      padding-top: 20px;
      background-color: #f1f1f1;
      height: 100%;
    }
    
    /* Set black background color, white text and some padding */
    
    
    /* On small screens, set height to 'auto' for sidenav and grid */
    @media screen and (max-width: 767px) {
      .sidenav {
        height: 100%;
        padding: 15px;
      }
      .row.content {height:auto;} 
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
            padding-top: 20px;
        }
        .fa{
            color: whitesmoke;
        }
        .msg{
            padding-top: 40px;
            text-align: center;
            color: greenyellow;
        }
        table {
            width: 100%;
          }

          h3 {
            font-style: italic;
            text-align: center;
            font-family: Bangers;
            font-size: 60px;
          }
          p{
              text-align: center;
              font-family: Caveat;
              font-size: 30px;
          }
          img{
              width: 30%;
              
          }
  </style>
</head>
<body>
    <script>
$(document).ready(function() {
	$('a.kyc').on('click', function() {
		$("#kyc-form").show();
                $("#loan-form").hide();
                $("#success").hide();
                $("#kndetails").hide();
		$("#home").hide();
	});
	$('a.loan').on('click', function() {
		$("#loan-form").show();
		$("#kyc-form").hide();
                $("#success").hide();
                $("#kndetails").hide();
                $("#home").hide();
	});
        
	$('a.home').on('click', function() {
           $("#kyc-form").hide();
           $("#loan-form").hide();
           $("#success").hide();
           $("#kndetails").hide();
           $("#home").show();
        });
        $('a.dashboard').on('click', function() {
            $("#kyc-form").hide();
           $("#loan-form").hide();
           $("#success").hide();
           $("#kndetails").show();
           $("#home").hide();
        });
        });
        function update(){
                 var xhttp = new XMLHttpRequest();
                 var name = document.getElementById("name").value;
                 var aadhaar = document.getElementById("aadhaar").value;
                 var mobile = document.getElementById("mobile").value;
                 var dob = document.getElementById("dob").value;
                xhttp.onreadystatechange = function() {
                  if (this.readyState === 4 && this.status === 200) {
                     $("#kyc-form").hide();
                     $("#success").show();
                  }
                  };
                xhttp.open("POST", "http://localhost:8080/Star_Banking_Finance/KycVerificationServlet?name="+name+"&aadhaar="+aadhaar+"&mobile="+mobile+"&dob="+dob, true);
                xhttp.send(); 
            } 
        </script>

    <nav class="navbar navbar-inverse">
      <div class="container-fluid">
        <div class="navbar-header">
          <i style="font-size:45px" class="fa" >&#xf006;</i>
          <a class="navbar-brand" href="#" style="color:white; font-size:12px">STAR</a>
        </div>
        <div class="collapse navbar-collapse" id="myNavbar">
          <ul class="nav navbar-nav navbar-right">
            <li><a href="logout" style="color:white"><span class="glyphicon glyphicon-log-in" ></span> Logout</a></li>
          </ul>
        </div>
      </div>
    </nav>
  
        <%-- SIDE OPTION DISPLAY --%>
        
    <div class="container-fluid ">    
      <div class="row content">
        <div class="col-sm-2 sidenav">
          <ul class="nav nav-pills nav-stacked">
            <li class="active"><a href="#" class="home">Home</a></li>
            <li><a href="#" class="dashboard">Dashboard</a></li>
            <li><a href="#" class="kyc">KYC</a></li>
            <li><a href="#" class="loan">Loan</a></li>
          </ul>
        </div>
      
          <div class="container" style="text-align:center;" id="home">
              <h3>WELCOME!</h3>
              <br><br>
              <p>Looking for getting Gold Loan ?</p>
              <img src="treasure.png" >
          </div>
      <%-- KYC FORM --%>
     <div class="col-sm-8 "> 
        <form id="kyc-form"  class="container " style="display:none" method="post">
            <div class="form-group">
            <label for="name"><b>Name</b></label>
                <input type="text" class="form-control" placeholder="Enter name as in aadhaar" name="name" required>
            </div>
            <div class="form-group">
            <label for="aadhaar"><b>Aadhaar Number</b></label>
                <input type="text" class="form-control" placeholder="Enter Aadhaar number" name="aadhaar" required>
            </div>
            <div class="form-group">
            <label for="mobile"><b>Mobile Number</b></label>
                <input type="text" class="form-control" placeholder="Enter mobile number" name="mobile" required>
            </div>
            <div class="form-group">
             <label for="dob">Date Of Birth</label>
                  <input type="date" class="form-control" id="dob" name="dob">
            </div>
                  
            <button class="btn btn-success" onclick="update()">Submit</button>
        </form>
        
        <%-- LOAN REQUEST FORM --%>
        
        <div class="container ">
        <form id="loan-form" action="LoanRequestServlet"  style="display:none" method="post">
            <div class="form-group ">
            <label for="kn"><b>KN</b></label>
                <input type="text" class="form-control" placeholder="Enter your kn" name="kn" required>
            </div> 
            <div class="row">
            <div class="form-group col-md-4">
              <label for="goldtype">GOLD TYPE</label>
              <select name="goldtype" class="form-control">
                <option selected>Choose carat</option>
                <option>8</option>
                <option>16</option>
                <option>24</option>
              </select>
            </div> 
            </div>
            
            <div class="form-group">
            <label for="weight"><b>Weight</b></label>
                <input type="text" class="form-control" placeholder="Gold weight(in grams)" name="weight" required>
            </div>
            <div class="form-group">
            <label for="place"><b>Place</b></label>
                <input type="text" class="form-control" placeholder="Enter place bought from" name="place" required>
            </div>
            <div class="form-group">
            <label for="jewellerNameAddress"><b>Jeweller Name & Address</b></label>
                <input type="text" class="form-control" placeholder="Enter Jewellers name & address" name="jewellerNameAddress" required>
            </div>
            <%-- <div class="form-group">
            <label for="goldImage"><b>Photo of Gold Ornament</b></label>
                <input type="file" class="form-control-file" name="goldImage" accept="image/*" >
</div> --%>
            
            <input type="submit" value="Submit">
        </form>
        </div>
        
        
         <%-- MESSAGE AFTER KYC FORM IS SUBMITTED --%>
        <div class="msg" id="success" style="display:none">
            <h2>Submitted Successfully!</h2>
        </div>
        
        <%-- MESSAGE ABOUT YOUR LOAN PROCCESS --%>
        <div class="kndetails" id="kndetails" style="display:none" >
            
             <%
            try
            {
                Connection con1 = Mysql.getconnection();
                Statement stat=con1.createStatement();
                ResultSet r=null;
                int id = 0;
          
                Cookie[] cookies = request.getCookies();
                for(Cookie cookie : cookies){
                   //  System.out.println(cookie.getName());
                    if(cookie.getName().equals("TOKEN")){
                        String cookieVal = cookie.getValue();

                        String q = "select userID from cookiedetails where cookieVal='"+cookieVal+"'";
                        r = stat.executeQuery(q);

                        if(r.next())
                        {

                           id = r.getInt("userID");
                        }
                        

                      }
                }
                ResultSet rs=stat.executeQuery("select kycVerificationStatus from usercredentials where userID='"+id+"'");
            
                if(rs.next())
                {
                    int status = rs.getInt("kycVerificationStatus");
                    
                    if(status == 1)
                    {
                        
                    %>
                    <table border=1 align=center style="text-align:center">
                    <tr>
                        <td style="width:30%"><b>KN:</b></td>
                        <td><%=id%></td>
                        <td style="color: limegreen; width: 30%">KYC DONE</td>
                    </tr>
                    
                   </table>
                    <%
                        }
                    else{ 
                     %>
                     <pre> <p>Your KYC details are wrong.
                           Kindly provide correct details!
                     </p></pre>
                    
                         <%}
               }
            }
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
