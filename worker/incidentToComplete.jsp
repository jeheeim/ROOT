<%@ page language ="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../dbLogin.jspf"%>
<%
int idx = Integer.parseInt(request.getParameter("idx"));

try
{
	stmt = conn.createStatement();
	sql = "UPDATE incident_management SET status = '4' WHERE idx=" + idx;
	stmt.executeUpdate(sql);
}
catch(SQLException sqle) { out.println(sqle.toString()); }
catch (Exception e){ out.println(e.toString());}
finally
{
	stmt.close();
	conn.close();
}
%>