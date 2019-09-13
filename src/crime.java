import java.io.*;
import javax.servlet.*;
import java.sql.*;
public class crime extends GenericServlet
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
	String crime_id=request.getParameter("crime_id");
	String crime_type=request.getParameter("crime_type");
	String crime_desc=request.getParameter("crime_desc");
	String crime_place=request.getParameter("crime_place");
	String victim_id=request.getParameter("victim_id");
	String accused_id=request.getParameter("accused_id");
	try
	{
		String query="insert into crime values(?,?,?,?,?,?)";
		PreparedStatement ps=con.prepareStatement(query);
		ps.setString(1,crime_id);
		ps.setString(2,crime_type);
		ps.setString(3,crime_desc);
		ps.setString(4,crime_place);
		ps.setString(5,victim_id);
		ps.setString(6,accused_id);
		int i=ps.executeUpdate();
		if(i>0)
		{
			pw.println("<body background='C:\\Eclipse\\project\\WebContent\\images\\success1.jpg'>");
			pw.println("<center>");
			pw.println("<h1 style='color:white'>CRIME REPORTED SUCCESSFULLY!!!</h1>");
			pw.println("</center>");
			pw.println("</body>");
			
		}
		else
		{
			pw.println("<body background='C:\\Eclipse\\project\\WebContent\\images\\rsz_fail.jpg'>");
			pw.println("<center>");
			pw.println("<h1 style='color:RED'>CRIME REPORT FAILED!!!</h1>");
			pw.println("</center>");
			pw.println("</body>");
		}
	}
	catch(Exception e)
	{
		pw.println("ERROR"+e);
	}
	pw.print("<center><a href='accussed.html'>BACK</a>");
	pw.close();
}
}