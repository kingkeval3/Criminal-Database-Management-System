
<%-- 


--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Crime Delete</title>
<link rel="icon"  href="logo.jpg" type="image/jpg"/>
<style>

body {
   
    padding: 25px;
    background: url(del2.jpg);
    background-repeat: no-repeat;
    background-size: cover;
}


input[type=text] {
    width: 20%;
    padding: 12px 20px;
    margin: 8px 0;
    box-sizing: border-box;
    border: 1px solid #555;
    outline: none;
    color:white;
}

input[type=text]:focus {
    background-color: green;
}

label {
    text-align: center;
    text-transform: uppercase;
   
    color:red;
}

input[type=submit] {
    background-color: red; /* Green */
    border: none;
    color: white;
    padding: 6px 22px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    -webkit-transition-duration: 0.4s; /* Safari */
    transition-duration: 0.4s;
    cursor: pointer;
}

input[type=submit] {
    background-color:red; 
    color: black; 
    border: 2px solid red;
}

input[type=submit]:hover {
    background-color: black;
    color: white;
}

a {
    background-color: blue; /* Green */
    border: none;
    color: white;
    padding: 6px 22px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    -webkit-transition-duration: 0.4s; /* Safari */
    transition-duration: 0.4s;
    cursor: pointer;
}

a {
    background-color: white; 
    color: black; 
    border: 2px solid green;
}


a:hover {
    background-color: green;
    color: white;
}



</style>

               
    </head>
    <body background="del2.jpg">
    <center>
  <div class="simple-form">
      <form id="registration" action="delc2.jsp" method="post">
    
                  <label style="font-size:30px"><b>ENTER CRIME ID:&nbsp;
                 </b></label>
                 <br>
         <input type="text" name="crime_id" id="button" placeholder="Enter Crime ID to be deleted..." required><br><br>
                <input type="submit" name="submit" value="delete" id="butt"/>&nbsp;&nbsp;
                <a href="modify.html"> BACK </a>
  </form>
  
  </div>
  <br><br>
  <h1 style="color:white">After Deletion:</h1>
  <a href="a_modify.html"> VIEW</a>
  </center>
    </body>
    
</html>
