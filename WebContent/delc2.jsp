<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
    <%@ page import="java.sql.*" %>

<%@ page import="java.io.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


</head>
<body>

<center>


<%	try{
	
	Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","root");
	String crime_id = request.getParameter("crime_id");
    String query="select * from crime where crime_id='"+crime_id+"'";
	PreparedStatement ps=con.prepareStatement(query);
	ResultSet rs=ps.executeQuery();
	if(rs.next()){
	
	//out.println(n);
	         String q="delete  from crime where crime_id='"+crime_id+"'";
	     	 PreparedStatement statement=con.prepareStatement(q);
             int i=statement.executeUpdate();
             if(i>0){
            	 out.println("<script>alert('deleted sucessfully');window.location='delc1.jsp';</script>");
             }
	}
	else
	{
   	 out.println("<script>alert('NO RECORDS FOUND TO DELETE');window.location='delc1.jsp';</script>");

	}

     }catch(Exception e){
    	 
    	 out.println("Unable to connect to database.");

     }
	%>
  </form>
    </div>
</center>

</body>
</html>