import java.io.*;
import javax.servlet.*;
import java.sql.*;
public class court_analysis extends GenericServlet
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
	PreparedStatement st=con.prepareStatement("select * from court");
   
   
	ResultSet rs=st.executeQuery();
	pw.print("<link rel=\"stylesheet\" href=\"assets/css/table2.css\" />");
	pw.print("<body background='C:/Eclipse/project/WebContent/images/justice.jpg'>");
	pw.print("<div class=\"w3-container\">");
		pw.print("<center><table   width='50%'  height='50%'    border='1' >");
		pw.print("<tr class=\"w3-light-grey w3-hover-brown\">");
	pw.print("<th>"+"COURT ID"+"</th>");
	pw.print("<th>"+"COURT TYPE"+"</th>");
	pw.print("<th>"+"VICTIM ID"+"</th>");
	pw.print("<th>"+"ACCUSED ID"+"</th>");
	pw.print("<th>"+"FIR ID"+"</th>");
	pw.print("<th>"+"LAW ENFORCED"+"</th>");
	pw.print("</tr>");
     while(rs.next())  
	{
    	 pw.print("<tr class=\"w3-hover-green\">");
	String court_id=rs.getString("court_id");	
	String court_type=rs.getString("court_type");
	
	String victim_id=rs.getString("victim_id");
	String accused_id=rs.getString("accused_id");
	String fir_id=rs.getString("fir_id");
	String law_enforced=rs.getString("law_enforced");
	
	pw.print("<td>"+court_id+"</td>");
	pw.print("<td>"+court_type+"</td>");
	pw.print("<td>"+victim_id+"</td>");
	pw.print("<td>"+accused_id+"</td>");
	pw.print("<td>"+fir_id+"</td>");
	pw.print("<td>"+law_enforced+"</td>");
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
