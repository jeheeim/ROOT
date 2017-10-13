<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/dbLogin.jspf"%>

<%
request.setCharacterEncoding("UTF-8");

String title				= request.getParameter("inputTitle");
String inputDetail			= request.getParameter("inputDetail");

String user_id = "user1";

Connection conn = null;
String sql = "";
PreparedStatement pstmt = null;
try
{
	Class.forName("com.mysql.jdbc.Driver").newInstance();

	conn = DriverManager.getConnection(dburl,dbuser,dbpw);;
	sql = "INSERT INTO notice (title, account_id, content) values (?, SELECT id FROM,?)";
	
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, title);
	pstmt.setInt(2, 1);
	pstmt.setString(3, inputDetail);

	pstmt.executeUpdate();

}
catch(ClassNotFoundException e)
{
	out.println(e.toString());
}
catch(SQLException sqle)
{
	out.println(sqle.toString());
}
finally
{
	if(pstmt != null)
	{
		try
		{
			pstmt.close();
		}
		catch(SQLException sqle){}
	}

	if(conn != null)
	{
		try
		{
			conn.close();
		}
		catch(SQLException sqle){}
	}
}
%>