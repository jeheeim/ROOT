<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../dbLogin.jspf"%>

<%
int idx = Integer.parseInt(request.getParameter("idx"));

try
{
	stmt = conn.createStatement();

	conn.setAutoCommit(false);

	sql = "UPDATE incident_management SET status = '2' WHERE idx=" + idx;
	stmt.executeUpdate(sql);

	sql = "";

	sql = "INSERT change_management (incident_index) VALUES (" + idx + ")";
	stmt.executeQuery(sql);

	sql = "";

	sql = "UPDATE kms SET change_index=LAST_INSERT_ID() WHERE incident_index=" + idx;
	stmt.executeUpdate(sql);

	conn.commit();
}
catch (SQLException sqle) { out.println(sqle.toString());}
catch (Exception e) { out.println(e.toString()); }
finally
{
	conn.setAutoCommit(true);

	stmt.close();
	conn.close();

	response.sendRedirect("../mainPage.jsp?mod=102&param=0");
}
%>