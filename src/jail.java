import java.io.*;
import javax.servlet.*;
import java.sql.*;
public class jail extends GenericServlet
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
	String jail_type=request.getParameter("jail_type");
	String jail_id=request.getParameter("jail_id");
	String jail_name=request.getParameter("jail_name");
	String jail_loc=request.getParameter("jail_loc");
	try
	{
		String query="insert into jail values(?,?,?,?)";
		PreparedStatement ps=con.prepareStatement(query);
		ps.setString(1,jail_type);
		ps.setString(2,jail_id);
		ps.setString(3,jail_name);
		ps.setString(4,jail_loc);
	
		int i=ps.executeUpdate();
		if(i>0)
		{
			pw.println("<body background='C:\\Eclipse\\project\\WebContent\\images\\success1.jpg'>");
			pw.println("<center>");
			pw.println("<h1 style='color:white'>PRISON DETAILS SUCCESSFULLY REGISTERED!!!</h1>");
			pw.println("</center>");
			pw.println("</body>");
			
		}
		else
		{
			pw.println("<body background='C:\\Eclipse\\project\\WebContent\\images\\rsz_fail.jpg'>");
			pw.println("<center>");
			pw.println("<h1 style='color:RED'>PRISON REGISTRATION FAILED!!!</h1>");
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