import java.io.*;
import javax.servlet.*;
import java.sql.*;
public class victim_analysis extends GenericServlet
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
	PreparedStatement st=con.prepareStatement("select * from victim");
   
   
	ResultSet rs=st.executeQuery();
pw.print("<link rel=\"stylesheet\" href=\"assets/css/table2.css\" />");
pw.print("<body background='C:/Eclipse/project/WebContent/images/victim.jpeg'>");
pw.print("<div class=\"w3-container\">");
	pw.print("<center><table   width='50%'  height='50%'    border='1' >");
	pw.print("<tr class=\"w3-light-grey w3-hover-green\">");
	pw.print("<th>"+"VICTIM ID"+"</th>");
	pw.print("<th>"+"VICITM  NAME"+"</th>");
	pw.print("<th>"+"VICTIM ADDRESS"+"</th>");
	

	pw.print("</tr>");
     while(rs.next())  
	{
    	 pw.print("<tr class=\"w3-hover-red\">");
	String victim_id=rs.getString("victim_id");	
	String victim_name=rs.getString("victim_name");
	String victim_address=rs.getString("victim_address");
	
	
	
	pw.print("<td>"+victim_id+"</td>");
	pw.print("<td>"+victim_name+"</td>");
	pw.print("<td>"+victim_address+"</td>");
	

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
