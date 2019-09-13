import java.io.*;
import javax.servlet.*;
import java.sql.*;
public class crime_analysis extends GenericServlet
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
	PreparedStatement st=con.prepareStatement("select * from crime");
   
   
	ResultSet rs=st.executeQuery();
	pw.print("<link rel=\"stylesheet\" href=\"assets/css/table2.css\" />");
	pw.print("<body background='C:/Eclipse/project/WebContent/images/caw.png'>");
	pw.print("<div class=\"w3-container\">");
		pw.print("<center><table   width='50%'  height='50%'    border='1' >");
		pw.print("<tr class=\"w3-light-grey w3-hover-red\">");
	pw.print("<th>"+"CRIME ID"+"</th>");
	pw.print("<th>"+"CRIME TYPE"+"</th>");
	pw.print("<th>"+"CRIME DESC"+"</th>");
	pw.print("<th>"+"CRIME PLACE"+"</th>");
	pw.print("<th>"+"VICTIM ID"+"</th>");
	pw.print("<th>"+"ACCUSED ID"+"</th>");
	pw.print("</tr>");
     while(rs.next())  
	{
    	 pw.print("<tr class=\"w3-hover-blue\">");
	String crime_id=rs.getString("crime_id");	
	String crime_type=rs.getString("crime_type");
	String crime_desc=rs.getString("crime_desc");
	String crime_place=rs.getString("crime_place");
	String victim_id=rs.getString("victim_id");
	String accused_id=rs.getString("accused_id");

	
	pw.print("<td>"+crime_id+"</td>");
	pw.print("<td>"+crime_type+"</td>");
	pw.print("<td>"+crime_desc+"</td>");
	pw.print("<td>"+crime_place+"</td>");
	pw.print("<td>"+victim_id+"</td>");
	pw.print("<td>"+accused_id+"</td>");
	
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
