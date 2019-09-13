import java.io.*;
import javax.servlet.*;
import java.sql.*;
public class accussed extends GenericServlet
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
	String accused_id=request.getParameter("accused_id");
	String accused_name=request.getParameter("accused_name");
	String accused_address=request.getParameter("accused_address");
	
	try
	{
		String query="insert into accused values(?,?,?)";
		PreparedStatement ps=con.prepareStatement(query);
		ps.setString(1,accused_id);
		ps.setString(2,accused_name);
		ps.setString(3,accused_address);
		int i=ps.executeUpdate();
		if(i>0)
		{
			pw.println("<body background='C:\\Eclipse\\project\\WebContent\\images\\success1.jpg'>");
			pw.println("<center>");
			pw.println("<h1 style='color:white'>ACCUSED DETAILS REPORTED!!!</h1>");
			pw.println("</center>");
			pw.println("</body>");
			
		}
		else
		{
			pw.println("<body background='C:\\Eclipse\\project\\WebContent\\images\\rsz_fail.jpg'>");
			pw.println("<center>");
			pw.println("<h1 style='color:RED'>SUSPECT REPORT ENTRY FAILED!!!</h1>");
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