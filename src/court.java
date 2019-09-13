import java.io.*;
import javax.servlet.*;
import java.sql.*;
public class court extends GenericServlet
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
	String court_type=request.getParameter("court_type");
	String court_id=request.getParameter("court_id");
	String victim_id=request.getParameter("victim_id");
	String accused_id=request.getParameter("accused_id");
	String fir_id=request.getParameter("fir_id");
	String law_enf=request.getParameter("law_enf");
	try
	{
		String query="insert into court values(?,?,?,?,?,?)";
		PreparedStatement ps=con.prepareStatement(query);
		ps.setString(2,court_type);
		ps.setString(1,court_id);
		ps.setString(3,victim_id);
		ps.setString(4,accused_id);
		ps.setString(5,fir_id);
		ps.setString(6,law_enf);
		int i=ps.executeUpdate();
		if(i>0)
		{
			pw.println("<body background='C:\\Eclipse\\project\\WebContent\\images\\success1.jpg'>");
			pw.println("<center>");
			pw.println("<h1 style='color:white'>JUDGEMENT REPORTED SUCCESSFULLY!!!</h1>");
			pw.println("</center>");
			pw.println("</body>");
			
		}
		else
		{
			pw.println("<body background='C:\\Eclipse\\project\\WebContent\\images\\rsz_fail.jpg'>");
			pw.println("<center>");
			pw.println("<h1 style='color:RED'>JUDGEMENT REPORT FAILED!!!</h1>");
			pw.println("</center>");
			pw.println("</body>");
		}
	}
	catch(Exception e)
	{
		pw.println("ERROR"+e);
	}
	pw.print("<center><a href='court_report.html'>BACK</a>");
	pw.close();
}
}