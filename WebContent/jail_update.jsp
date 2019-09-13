<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>PRISON UPDATE</title>
<style>
body {
	margin: 0;
	padding: 0;
	background-image: url("ju.jpg");
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
    background-color: grey;
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
 border: 2px solid grey;
cursor:pointer;
}

input[type=submit]:hover{

background-color:grey;
transition-duration: 0.4s;
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

color:white;
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
    background-color: grey;
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
     
	String vnum=request.getParameter("jail_id");
	String queryString ="select * from jail  where jail_id=? " ;
	PreparedStatement ps=connection.prepareStatement(queryString);
	ps.setString(1,vnum);

	 HttpSession s = request.getSession();
	 
     rs= ps.executeQuery();
   
 
	
   
   while(rs.next())
   {
	%>    
	
	
	
	<body background="ju.jpg">


<form action=jail_update.jsp method=post>


<h1 style="color:red"><U>PRISON DETAILS UPDATE</U></h1><BR>
<center><h3> JAIL TYPE        :<br><input type="text" name="d" value=<%=rs.getString(1) %> > </h3> <br>

<h3>JAIL ID  :        <br><input type="text" name="n"  value=<%=rs.getString(2) %>> </h3> <br>


<h3>JAIL NAME        :<br><input type="text" name="nb"  value=<%=rs.getString(3) %>> </h3> <br>

<h3>JAIL LOC        :<br><input type="text" name="ns"  value=<%=rs.getString(4) %>> </h3> 






<p><input type="submit" value="UPDATE"/>  </p>

<a  href="jail_update.html"  align="center"><font style=color:white> Back </font> </a>
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
String cname1=request.getParameter("ns");



int i=0;
if(vname!=null &&vcatg!=null &&cname!=null &&cname1!=null ){
	if(vname!="" &&vcatg!="" &&cname!=""&&cname1!="" ){


try
 {
   Class.forName("com.mysql.jdbc.Driver");
   Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","root");
   

   
   
   PreparedStatement st=con.prepareStatement("update jail set jail_type=?,jail_name=? ,jail_loc=? where jail_id=? ");
   st.setString(1,vname);
   st.setString(2,cname);
   st.setString(3,cname1);
   st.setString(4,vcatg);
  
   
   
   i=st.executeUpdate();
	
	if(i!=0)
	{
		
    	 out.println("<script>alert('Updated Sucessfully');window.location='jail_update.html';</script>");

		
	
	
	}
	
 }
	
	
	
	catch(Exception e)
	{
		 out.println(e);
		 
			out.println("<script>alert(' Not Updated Sucessfully');window.location='jail_update.jsp';</script>");
	}
		}
}

%>

</div>
</form>

</body>

</html>