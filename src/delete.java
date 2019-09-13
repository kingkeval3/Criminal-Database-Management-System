import java.io.*;
import javax.servlet.*;
import java.sql.*;
public class delete extends GenericServlet
{
	Connection con;
	public void init() throws ServletException
	{
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","root");
		}
		catch(Exception e)
		{
			System.out.print(e);
		}
	}
public void service(ServletRequest request,
ServletResponse response) throws ServletException,IOException
{
	response.setContentType("text/html");
	PrintWriter pw=response.getWriter();
	String crime_id=request.getParameter("crime_id");
	try
	{
	PreparedStatement st=con.prepareStatement("delete from crime where crime_id='?'");
	st.setString(1, crime_id);
   
	st.executeUpdate();
	pw.println("Rows Deleted");
		
}catch(Exception e)
{
	
	pw.println(e);
}

pw.print("<center><a href='index.html'>BACK</a>");
pw.close();
}

}
