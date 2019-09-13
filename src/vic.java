import java.io.*;
import javax.servlet.*;
import java.sql.*;
public class vic extends GenericServlet
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
			
		}
	}
public void service(ServletRequest request,
ServletResponse response) throws ServletException,IOException
{
	response.setContentType("text/html");
	PrintWriter pw=response.getWriter();
	String victim_id=request.getParameter("victim_id");
	String victim_name=request.getParameter("victim_name");
	String victim_address=request.getParameter("victim_address");
	
	try
	{
		String query="insert into victim values(?,?,?)";
		PreparedStatement ps=con.prepareStatement(query);
		ps.setString(1,victim_id);
		ps.setString(2,victim_name);
		ps.setString(3,victim_address);
		int i=ps.executeUpdate();
		if(i>0)
		{
			pw.println("<body background='C:\\Eclipse\\project\\WebContent\\images\\success1.jpg'>");
			pw.println("<center>");
			pw.println("<h1 style='color:white'>VIICTIM DETAILS REPORTED!!!</h1>");
			pw.println("</center>");
			pw.println("</body>");
		
			
		}
		else
		{
			pw.println("<body background='C:\\Eclipse\\project\\WebContent\\images\\rsz_fail.jpg'>");
			pw.println("<center>");
			pw.println("<h1 style='color:RED'>VICTIM DETAILS REPORT FAILED!!!</h1>");
			pw.println("</center>");
			pw.println("</body>");
			
		}
	}
	catch(Exception e)
	{
		pw.println("ERROR"+e);
	}
	pw.print("<center><a href='crime_report.html'>BACK</a>");
	pw.close();
}
}