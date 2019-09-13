import java.io.*;
import javax.servlet.*;
import java.sql.*;
public class prisoner extends GenericServlet
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
	String prisoner_id=request.getParameter("prisoner_id");
	String prisoner_name=request.getParameter("prisoner_name");
	String crime_id=request.getParameter("crime_id");
	String court_id=request.getParameter("court_id");
	String law_enf=request.getParameter("law_enf");
	String jail_id=request.getParameter("jail_id");
	try
	{
		String query="insert into prisoner values(?,?,?,?,?,?)";
		PreparedStatement ps=con.prepareStatement(query);
		ps.setString(1,prisoner_id);
		ps.setString(2,prisoner_name);
		ps.setString(3,crime_id);
		ps.setString(4,court_id);
		ps.setString(5,law_enf);
		ps.setString(6,jail_id);
		int i=ps.executeUpdate();
		if(i>0)
		{
			pw.println("<body background='C:\\Eclipse\\project\\WebContent\\images\\success1.jpg'>");
			pw.println("<center>");
			pw.println("<h1 style='color:white'>PRISONER DETAILS SUCCESSFULLY REGISTERED!!!</h1>");
			pw.println("</center>");
			pw.println("</body>");
			
			
		}
		else
		{
			pw.println("<body background='C:\\Eclipse\\project\\WebContent\\images\\rsz_fail.jpg'>");
			pw.println("<center>");
			pw.println("<h1 style='color:RED'>PRISONER REGISTRATION FAILED!!!</h1>");
			pw.println("</center>");
			pw.println("</body>");
		}
	}
	catch(Exception e)
	{
		pw.println("ERROR"+e);
	}
	pw.print("<center><a href='jail_report.html'>BACK</a>");
	pw.close();
}
}