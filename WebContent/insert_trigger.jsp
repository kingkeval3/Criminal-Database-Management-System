<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Triggers</title>
</head>
<style>
body {
   background-image: url("t.jpg");
  
}
table {
  border-collapse: collapse;
  width: 100%;
}

th, td {
  padding: 8px;
  text-align: left;
  border-bottom: 1px solid #ddd;
}

tr:hover {background-color:red}

h1 {
    text-align: center;
    text-transform: uppercase;
   
    font-size:70px;
      text-shadow:
       3px 3px 0 #000,
     -1px -1px 0 #000,  
      1px -1px 0 #000,
      -1px 1px 0 #000,
       1px 1px 0 #000;
}

a {
    text-decoration: none;
    display: inline-block;
    padding: 8px 16px;
}

a:hover {
    background-color: red;
    color: white;
}

</style>

<body background="t.jpg">
<center><h1><font color="red" size="5">Triggers Generated</font></h1></center><br/><br/>

<table align="center">
<tr bgcolor="red">
<th>Prisoner Id</th>
<th>Prisoner name</th>
<th>Action Performed</th>
<th>Execution Time</th>
</tr>

<%
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","root");
PreparedStatement ps=con.prepareStatement("select * from logs");
ResultSet rs=ps.executeQuery();
while(rs.next())
{
%>
<tr bgcolor="green">
<td><%=rs.getString(1)%></td>
<td><%=rs.getString(2)%></td>
<td><%=rs.getString(3)%></td>
<td><%=rs.getString(4)%></td>

</tr>
<%}%>
</table><br><br><br>
<center><a href="ts.html">Back</a></center>
	


</body>
</html>