<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.lang.*" %>
<%@ page session="true"%>
<%@ include file="../dbLogin.jspf" %>

<%
request.setCharacterEncoding("UTF-8");

String id = "";
int idx = 0;

int route = Integer.parseInt(request.getParameter("route"));
int range = Integer.parseInt(request.getParameter("range"));
int emergency = Integer.parseInt(request.getParameter("emergency"));

String title = (String)request.getParameter("title");
String content = (String)request.getParameter("detail");
String deadline = (String)request.getParameter("deadline");

out.println(route);
out.println(range);
out.println(emergency);
out.println(title);
out.println(content);
out.println(deadline);

try
{
	conn=DriverManager.getConnection(dburl,dbuser,dbpw);
	id = (String)session.getAttribute("user_id");
	sql = "SELECT * FROM account WHERE account.id = \'" + id+"\'";       
	rs = stmt.executeQuery(sql);

	if(rs.next())
	{
		idx = rs.getInt(1);
	}
}
%>