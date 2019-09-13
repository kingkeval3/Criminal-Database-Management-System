<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Victim Update</title>
<style>

body {
	margin: 0;
	padding: 0;
	background-image: url("vu.jpg");
	font-family: sans-serif;
	
  background-size: cover;
	
}

.ab
{
top:250%;
left:50%;
width:60%;
position:absolute;
background:rgba(0,0,0,0.4);
   color:#fff;
transform: translate(-50%,-50%)	;
box-sizing: border-box;
padding:60px 80px;

	
}

input[type=text],select{
align:center;
width:20%;
padding:12px 20px;
margin:8px 0;
display:inline-block;
border:1px solid #ccc;
border-radius:4px;
box-sizing:border-box;

}

input[type=text]:focus {
    background-color: red;
    color: white;
}

input[type=file],select{
align:center;
width:20%;
padding:12px 20px;
margin:8px 0;
display:inline-block;
border:1px solid #ccc;
border-radius:4px;
box-sizing:border-box;
background-color:white;
}

input[type=date],select{
align:center;
width:20%;
padding:12px 20px;
margin:8px 0;
display:inline-block;
border:1px solid #ccc;
border-radius:4px;
box-sizing:border-box;
background-color:white;
}


input[type=submit] {
align:center;
width:20%;
background-color:black;
color:white;
padding:14px 20px;
margin:8px 0;
border:none;
border-radius:4px;
cursor:pointer;
}

input[type=submit]:hover{

background-color:red;
}

div{
border-radius:5px;
background-color:#f2f2f2;
padding:20px;

}

h1 {
    text-align: center;
    text-transform: uppercase;
   
    font-size:30px;
      text-shadow:
       3px 3px 0 #000,
     -1px -1px 0 #000,  
      1px -1px 0 #000,
      -1px 1px 0 #000,
       1px 1px 0 #000;
}

h3 {

color:red;
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
    background-color: red; 
    color: white; 
    border: 2px solid red;
}


a:hover {
    background-color: black;
    color: white;
}

</style>

</head>

<% 
String connectionURL ="jdbc:mysql://localhost:3306/project";

Connection connection = null;



ResultSet rs=null;

try {

	Class.forName("com.mysql.jdbc.Driver").newInstance();

	connection = DriverManager.getConnection(connectionURL,"root","root");
     
	String vnum=request.getParameter("victim_id");
	String queryString ="select * from victim  where victim_id=? " ;
	PreparedStatement ps=connection.prepareStatement(queryString);
	ps.setString(1,vnum);

	 HttpSession s = request.getSession();
	 
     rs= ps.executeQuery();
   
 
	
   
   while(rs.next())
   {
	%>    
	
	
	
	<body background="vu.jpg">


<form action=victim_update.jsp method=post>


<h1 style="color:red"><U>VICTIM DETAILS UPDATE</U></h1><BR>
<center><h3> VICTIM ID:<br><input type="text" name="d" value=<%=rs.getString(1) %> > </h3> <br><br>

<h3>VICTIM NAME:<br><input type="text" name="n"  value=<%=rs.getString(2) %>> </h3> <br><br>


<h3>VICTIM ADDRESS:<br><input type="text" name="nb"  value=<%=rs.getString(3) %>> </h3> 

<p><input type="submit" value="UPDATE"/>  </p>

<a  href="victim_update.html"  align="center"><font style=color:white> Back </font> </a>
</center>




 
   <%  
   }

   
}
catch(Exception e)
{
	 out.println(e);
}



	%>












<%

String vname=request.getParameter("d");
String vcatg=request.getParameter("n");
String cname=request.getParameter("nb");



int i=0;
if(vname!=null &&vcatg!=null &&cname!=null ){
	if(vname!="" &&vcatg!="" &&cname!="" ){


try
 {
   Class.forName("com.mysql.jdbc.Driver");
   Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","root");
   

   
   
   PreparedStatement st=con.prepareStatement("update victim  set victim_name=?,victim_address=? where victim_id=? ");
   st.setString(1,vcatg);
   st.setString(2,cname);
   st.setString(3,vname);
   
   
   
   
   i=st.executeUpdate();
	
	if(i!=0)
	{
		
    	 out.println("<script>alert('Updated Sucessfully');window.location='victim_update.html';</script>");

		
	
	
	}
	
 }
	
	
	
	catch(Exception e1)
	{
		 out.println(e1);
		 
			out.println("<script>alert(' Not Updated Sucessfully');window.location='victim_update.jsp';</script>");
	}
		}
}

%>

</div>
</form>

</body>

</html>