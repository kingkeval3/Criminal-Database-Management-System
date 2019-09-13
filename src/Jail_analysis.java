import java.io.*;
import javax.servlet.*;
import java.sql.*;
public class Jail_analysis extends GenericServlet
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
	PreparedStatement st=con.prepareStatement("select * from jail");
   
   
	ResultSet rs=st.executeQuery();
	pw.print("<link rel=\"stylesheet\" href=\"assets/css/table2.css\" />");
	pw.print("<body background='C:/Eclipse/project/WebContent/images/jt.png'>");
	pw.print("<div class=\"w3-container\">");
		pw.print("<center><table   width='50%'  height='50%'    border='1' >");
		pw.print("<tr class=\"w3-light-grey w3-hover-black\">");
	pw.print("<th>"+"JAIL TYPE"+"</th>");
	pw.print("<th>"+"JAIL ID"+"</th>");
	pw.print("<th>"+"JAIL LOCATION"+"</th>");
	pw.print("<th>"+"JAIL NAME"+"</th>");
		pw.print("</tr>");
     while(rs.next())  
	{
    	 pw.print("<tr class=\"w3-hover-grey\">");
	String jail_type=rs.getString("jail_type");	
	String jail_id=rs.getString("jail_id");
	
	String jail_loc=rs.getString("jail_loc");
	String jail_name=rs.getString("jail_name");
		
	pw.print("<td>"+jail_type+"</td>");
	pw.print("<td>"+jail_id+"</td>");
	pw.print("<td>"+jail_loc+"</td>");
	pw.print("<td>"+jail_name+"</td>");
	
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
