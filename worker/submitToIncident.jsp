<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../dbLogin.jspf"%>

<%
int idx = 0;
int user_idx = 0;
String user_id = "";

try
{
	user_id = (String)session.getAttribute("user_id");
	idx = Integer.parseInt(request.getParameter("idx"));

	stmt = conn.createStatement();

	conn.setAutoCommit(false);

	sql = "SELECT idx FROM account WHERE id=\'" + user_id + "\'";
	rs = stmt.executeQuery(sql);

	if(rs.next())
	{
		user_idx = rs.getInt(1);
	}
	
	sql = "UPDATE incident_management SET status = '1' WHERE idx=" + idx;
	stmt.executeUpdate(sql);

	sql = "UPDATE kms SET workerIdx=" + user_idx + " WHERE incident_index=" + idx;
	stmt.executeUpdate(sql);

	conn.commit();
}
catch (SQLException sqle) { out.println(sqle.toString()); }
catch (Exception e) { out.println(e.toString()); }
finally
{
	conn.setAutoCommit(true);

	stmt.close();
	conn.close();
	
	response.sendRedirect("../mainPage.jsp?mod=102&param=0");
}
%>