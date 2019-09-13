<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CRIME-PRISONER UPDATE</title>
<style>
body {
	margin: 0;
	padding: 0;
	background-image: url("cp.jpg");
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
 border: 2px solid red;
cursor:pointer;
  transition-duration: 0.4s;
}

input[type=submit]:hover{

background-color:red;
color:white;
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
       3px 3px 0 black,
     -1px -1px 0 black,  
      1px -1px 0 black,
      -1px 1px 0 black,
       1px 1px 0 black;
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
     
	String vnum=request.getParameter("crime_id");
	String queryString ="select * from crime c,prisoner p  where c.crime_id=? and p.crime_id=?" ;
	PreparedStatement ps=connection.prepareStatement(queryString);
	ps.setString(1,vnum);
	ps.setString(2,vnum);


	 HttpSession s = request.getSession();
	 
     rs= ps.executeQuery();
   
 
	
   
   while(rs.next())
   {
	%>    
	
	
	<%=rs.getString(1) %>
	<body background="cp.jpg">


<form action=crimeprisoner_update.jsp method=post>


<h1 style="color:red"><U>CRIME DETAILS UPDATE</U></h1><BR>
<center><h3> CRIME ID        :<br><input type="text" name="d" value=<%=rs.getString(1) %> > </h3> <br>

<h3>CRIME TYPE  :        <br><input type="text" name="n"  value=<%=rs.getString(2) %>> </h3> <br>



<h3>CRIME DESC         :<br><input type="text" name="L"  value=<%=rs.getString(3) %>> </h3> <br>

<h3>CRIME PLACE        :<br><input type="text" name="O"  value=<%=rs.getString(4) %>> </h3> <br>

<h3>VICTIM ID        :<br><input type="text" name="V"  value=<%=rs.getString(5) %>> </h3> <br>

<h3>ACCUSED ID         :<br><input type="text" name="E"  value=<%=rs.getString(6) %>> </h3> <br>

<h1 style="color:red"><U>PRISONER DETAILS UPDATE</U></h1><BR>

<h3> PRISONER ID        :<br><input type="text" name="I" value=<%=rs.getString(7) %> > </h3> <br>

<h3>PRISONER NAME  :        <br><input type="text" name="S"  value=<%=rs.getString(8) %>> </h3> <br>



<h3>CRIME ID        :<br><input type="text" name="W"  value=<%=rs.getString(9) %>> </h3> <br>

<h3>COURT ID       :<br><input type="text" name="A"  value=<%=rs.getString(10) %>> </h3> <br>

<h3>LAW ENFORCED        :<br><input type="text" name="S"  value=<%=rs.getString(11) %>> </h3> <br>

<h3>JAIL ID         :<br><input type="text" name="T"  value=<%=rs.getString(12) %>> </h3> <br>



<p><input type="submit" value="UPDATE"/>  </p>

<a  href="crimeprisoner_update.html"  align="center"><font style=color:white> Back </font> </a>
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
String cname1=request.getParameter("O");
String cname2=request.getParameter("V");
String cname3=request.getParameter("E");
String cname4=request.getParameter("I");
String cname5=request.getParameter("S");
String cname6=request.getParameter("W");
String cname7=request.getParameter("A");
String cname8=request.getParameter("S");
String cname9=request.getParameter("T");

int i=0;
if(vname!=null &&vcatg!=null &&cname!=null &&cname1!=null&&cname2!=null&&cname3!=null&&cname4!=null&&cname5!=null&&cname6!=null&&cname7!=null&&cname8!=null&&cname9!=null ){
	if(vname!="" &&vcatg!="" &&cname!=""&&cname1!=""&&cname2!=""&&cname3!=""&&cname4!=""&&cname5!=""&&cname6!=""&&cname7!=""&&cname8!=""&&cname9!="" ){


try
 {
   Class.forName("com.mysql.jdbc.Driver");
   Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","root");
   

   
   
   PreparedStatement st=con.prepareStatement("update crime c , prisoner p set crime_type=?,crime_desc=?,crime_place=?,victim_id=?,accused_id=?,prisoner_id=?,prisoner_name=?,court_id=?,law_enforced=?,jail_id=? where c.crime_id=? and p.crime_id=? ");
   st.setString(1,vcatg);
   st.setString(2,cname);
   st.setString(3,cname1);
   st.setString(4,cname2);
   st.setString(5,cname3);
   st.setString(6,cname4);
   st.setString(7,cname5);
   st.setString(8,cname7);
   st.setString(9,cname8);
   st.setString(10,cname9);
   st.setString(11,vname);
   st.setString(12,vname);


   
   
;
   
   
   
   
   i=st.executeUpdate();
	
	if(i!=0)
	{
		
    	 out.println("<script>alert('Updated Sucessfully');window.location='crimeprisoner_update.html';</script>");

		
	
	
	}
	
 }
	
	
	
	catch(Exception e1)
	{
		 out.println(e1);
		 
			out.println("<script>alert(' Not Updated Sucessfully');window.location='crimeprisoner_update.jsp';</script>");
	}
		}
}

%>

</div>
</form>

</body>

</html>