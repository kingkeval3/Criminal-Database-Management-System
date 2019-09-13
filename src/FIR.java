import java.io.*;
import javax.servlet.*;
import java.sql.*;
public class FIR extends GenericServlet
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
	String fir_id=request.getParameter("fir_id");
	String fir_desc=request.getParameter("fir_desc");
	String crime_id=request.getParameter("crime_id");
	String victim_id=request.getParameter("victim_id");
	String accused_id=request.getParameter("accused_id");
	
	try
	{
		String query="insert into FIR values(?,?,?,?,?)";
		PreparedStatement ps=con.prepareStatement(query);
		ps.setString(1,fir_id);
		ps.setString(2,fir_desc);
		ps.setString(3,crime_id);
		ps.setString(4,victim_id);
		ps.setString(5,accused_id);
		int i=ps.executeUpdate();
		if(i>0)
		{
			pw.println("<body background='C:\\Eclipse\\project\\WebContent\\images\\success1.jpg'>");
			pw.println("<center>");
			pw.println("<h1 style='color:white'>FIRST INVESTIGATION REPORT REGISTERED!!!</h1>");
			pw.println("</center>");
			pw.println("</body>");
			
			
		}
		else
		{
			pw.println("<body background='C:\\Eclipse\\project\\WebContent\\images\\rsz_fail.jpg'>");
			pw.println("<center>");
			pw.println("<h1 style='color:RED'>FIRST INVESTIGATION REPORT FAILED!!!</h1>");
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