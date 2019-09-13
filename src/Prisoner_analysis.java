import java.io.*;
import javax.servlet.*;
import java.sql.*;
public class Prisoner_analysis extends GenericServlet
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
	
	try
	{
	PreparedStatement st=con.prepareStatement("select * from prisoner");
   
   
	ResultSet rs=st.executeQuery();
	pw.print("<link rel=\"stylesheet\" href=\"assets/css/table2.css\" />");
	pw.print("<body background='C:/Eclipse/project/WebContent/images/pri.jpg'>");
	pw.print("<div class=\"w3-container\">");
		pw.print("<center><table   width='5%'  height='5%'    border='1' >");
		pw.print("<tr class=\"w3-light-grey w3-hover-red\">");
	pw.print("<th>"+"PRISONER ID"+"</th>");
	pw.print("<th>"+"PRISONER NAME"+"</th>");
	pw.print("<th>"+"CRIME TYPE"+"</th>");
	pw.print("<th>"+"COURT ID"+"</th>");
	pw.print("<th>"+"LAW ENFORCED"+"</th>");
	pw.print("<th>"+"JAIL ID"+"</th>");

		pw.print("</tr>");
     while(rs.next())  
	{
    	 pw.print("<tr class=\"w3-hover-orange\">");
	String prisoner_id=rs.getString("prisoner_id");	
	String prisoner_name=rs.getString("prisoner_name");
	
	String crime_type=rs.getString("crime_id");
	String court_id=rs.getString("court_id");
	String law_enforced=rs.getString("law_enforced");
	String jail_id=rs.getString("jail_id");

		
	pw.print("<td>"+prisoner_id+"</td>");
	pw.print("<td>"+prisoner_name+"</td>");
	pw.print("<td>"+crime_type+"</td>");
	pw.print("<td>"+court_id+"</td>");
	pw.print("<td>"+law_enforced+"</td>");
	pw.print("<td>"+jail_id+"</td>");
	
	pw.print("</tr>");
	   
	}
     
     
     pw.print("</table></center>");
		pw.print("</div>");
		pw.print("</body>");
}catch(Exception e)
{
	
	pw.println(e);
}

pw.print("<center><a href='crime_analysis.html'>BACK</a>");
pw.close();
}

}
