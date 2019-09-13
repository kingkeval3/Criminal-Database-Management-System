import java.io.*;
import java.util.*;
import javax.servlet.*;
import java.sql.*;
public class login extends GenericServlet
{
	Connection con;
	
	public void init() throws ServletException
	{
		try{
	      Class.forName("com.mysql.jdbc.Driver");
		  con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","root");
			
		}catch(Exception e)
		{
			
			
		}
	}
	public void service(ServletRequest request,ServletResponse response) throws ServletException,IOException
	{
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
		
		String name=request.getParameter("username");
		String password=request.getParameter("password1");
		try{
		String query = "select username,password1 from login where username=? and password1=?";		
		PreparedStatement ps=con.prepareStatement(query);
		ps.setString(1,name);
		ps.setString(2,password);
		
		ResultSet rs=ps.executeQuery();
		
		if(rs.next())
		{
		
			
			
          RequestDispatcher rd=request.getRequestDispatcher("index.html");
          rd.forward(request,response);
		}
		else
		{
			 RequestDispatcher rd=request.getRequestDispatcher("login.html");
	         rd.forward(request,response);
		}
		}catch(Exception e)
		{
			pw.println(e);
		}
	}
			
	
}