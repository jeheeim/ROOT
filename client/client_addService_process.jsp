<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%@ page import="java.lang.*" %>
<%@ page session="true"%>
<%@ include file="../dbLogin.jspf" %>

<%
request.setCharacterEncoding("UTF-8");

String id = "";
id = (String)session.getAttribute("user_id");

int idx = 0;

int route = 5; // 5는 시스템을 통한 접근
int range = Integer.parseInt(request.getParameter("range"));
int emergency = Integer.parseInt(request.getParameter("emergency"));
int priority = (range + emergency) / 2;

String title = (String)request.getParameter("title");
String content = (String)request.getParameter("detail");
String deadline = (String)request.getParameter("deadline");

java.util.Date nowDate = new java.util.Date();
SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd");

out.println(id);
out.println(title);
out.println(idx);
out.println(range);
out.println(emergency);
out.println(content);
out.println(fm.format(nowDate).toString());
out.println(deadline);


try
{
	conn=DriverManager.getConnection(dburl,dbuser,dbpw);
	conn.setAutoCommit(false);
	
	sql = "SELECT idx FROM account WHERE id=\'" + id + "\'";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();

	if(rs.next())
	{
		idx = rs.getInt(1);
	}

	rs.close();

	sql = "INSERT INTO incident_management (title, customer, reception_path, problem_scope, urgency, priority, content, registration_date, deadline) "
		+ "VALUES (?,?,?,?,?,?,?,?,?)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, title);
	pstmt.setInt(2, idx);
	pstmt.setInt(3, 5);
	pstmt.setInt(4, range);
	pstmt.setInt(5, emergency);
	pstmt.setInt(6, priority);
	pstmt.setString(7, content);
	pstmt.setString(8, fm.format(nowDate).toString());
	pstmt.setString(9, deadline);

	pstmt.executeUpdate();

	sql = "INSERT INTO kms (incident_index, workerIdx) VALUES (LAST_INSERT_ID(), 0)";
	pstmt = conn.prepareStatement(sql);
	pstmt.executeUpdate(sql);
	
	conn.commit();

	pstmt.close();
	conn.close();

	response.sendRedirect("../mainPage.jsp");
}
catch(SQLException sqle)
{
	out.println(sqle.toString());
}

%>