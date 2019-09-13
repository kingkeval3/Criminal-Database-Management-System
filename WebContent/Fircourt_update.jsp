<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>FIR-COURT UPDATE</title>
<style>
body {
	margin: 0;
	padding: 0;
	background-image: url("puc6.jpg");
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
       3px 3px 0 grey,
     -1px -1px 0 grey,  
      1px -1px 0 grey,
      -1px 1px 0 grey,
       1px 1px 0 grey;
}

h3 {

color:brown;
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
     
	String vnum=request.getParameter("fir_id");
	String queryString ="select * from FIR f,court s  where f.fir_id=? and s.fir_id=?" ;
	PreparedStatement ps=connection.prepareStatement(queryString);
	ps.setString(1,vnum);
	ps.setString(2,vnum);


	 HttpSession s = request.getSession();
	 
     rs= ps.executeQuery();
   
 
	
   
   while(rs.next())
   {
	%>    
	
	
	<%=rs.getString(1) %>
	<body background="puc6.jpg">

<center>
<form action=Fircourt_update.jsp method=post>


<h1 style="color:brown"><U>FIR DETAILS UPDATE</U></h1><BR>
<h3> FIR ID        :<br><input type="text" name="d" value=<%=rs.getString(1) %> > </h3> <br>

<h3>FIR DESC  :        <br><input type="text" name="n"  value=<%=rs.getString(2) %>> </h3> <br>



<h3>CRIME ID         :<br><input type="text" name="L"  value=<%=rs.getString(3) %>> </h3> <br>

<h3>VICTIM ID        :<br><input type="text" name="V"  value=<%=rs.getString(4) %>> </h3> <br>

<h3>ACCUSED ID         :<br><input type="text" name="E"  value=<%=rs.getString(5) %>> </h3> <br>

<h1 style="color:brown"><U>COURT DETAILS UPDATE</U></h1><BR>

<h3> COURT SESSION ID        :<br><input type="text" name="I" value=<%=rs.getString(6) %> > </h3> <br>

<h3>COURT TYPE  :        <br><input type="text" name="S"  value=<%=rs.getString(7) %>> </h3> <br>



<h3>VICTIM ID        :<br><input type="text" name="W"  value=<%=rs.getString(8) %>> </h3> <br>

<h3>ACCUSED ID       :<br><input type="text" name="A"  value=<%=rs.getString(9) %>> </h3> <br>

<h3>FIR ID       :<br><input type="text" name="S"  value=<%=rs.getString(10) %>> </h3> <br>

<h3>LAW ENFORCED         :<br><input type="text" name="T"  value=<%=rs.getString(11) %>> </h3> <br>



<p><input type="submit" value="UPDATE"/>  </p></center>
<center>
<a  href="Fircourt_update.html"  align="center"><font style=color:white> Back </font> </a>
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
String cname=request.getParameter("L");
String cname2=request.getParameter("V");
String cname3=request.getParameter("E");
String cname4=request.getParameter("I");
String cname5=request.getParameter("S");
String cname6=request.getParameter("W");
String cname7=request.getParameter("A");
String cname8=request.getParameter("S");
String cname9=request.getParameter("T");

int i=0;
if(vname!=null &&vcatg!=null &&cname!=null &&cname2!=null&&cname3!=null&&cname4!=null&&cname5!=null&&cname6!=null&&cname7!=null&&cname8!=null&&cname9!=null ){
	if(vname!="" &&vcatg!="" &&cname!=""&&cname2!=""&&cname3!=""&&cname4!=""&&cname5!=""&&cname6!=""&&cname7!=""&&cname8!=""&&cname9!="" ){


try
 {
   Class.forName("com.mysql.jdbc.Driver");
   Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","root");
   

   
   
   PreparedStatement st=con.prepareStatement("update FIR f , court c set f.fir_desc=?,f.crime_id=?,f.victim_id=?,f.accused_id=?,c.court_id=?,c.court_type=?,c.victim_id=?,c.accused_id=?,c.law_enforced=? where f.fir_id=? and c.fir_id=? ");
   st.setString(1,vcatg);
   st.setString(2,cname);
   st.setString(3,cname2);
   st.setString(4,cname3);
   
   st.setString(5,cname4);
   st.setString(6,cname5);
   st.setString(7,cname6);
   st.setString(8,cname7);
   st.setString(9,cname9);
   
   st.setString(10,vname);
   st.setString(11,vname);
   
   
   
;
   
   
   
   
   i=st.executeUpdate();
	
	if(i!=0)
	{
		
    	 out.println("<script>alert('Updated Sucessfully');window.location='Fircourt_update.html';</script>");

		
	
	
	}
	
 }
	
	
	
	catch(Exception e1)
	{
		 out.println(e1);
		 
			out.println("<script>alert(' Not Updated Sucessfully');window.location='Fircourt_update.jsp';</script>");
	}
		}
}

%>

</div>
</form>

</body>

</html>