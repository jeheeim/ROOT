<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%@ page import="java.sql.*" %>
<%@ page import="java.lang.*" %>
<%@ page import="java.text" %>

<%
	request.setCharacterEncoding("UTF-8");
	String user_id = request.getParameter("user_id");
	String password = request.getParameter("password");

	String dburl = "jdbc:mysql://localhost:3306/itsmdb";
	// 사용하려는 데이터베이스명을 포함한 URL 기술
	String dbuser = "root";
	// 사용자 계정
	String dbpw = "1234";
	// 사용자 계정의 패스워드

	Class.forName("com.mysql.jdbc.Driver");

	Connection conn = DriverManager.getConnection(dburl,dbuser,dbpw);;
	Statement stmt = null;
	ResultSet rs = null;
	String sql = null;

	sql = "SELECT password FROM account WHERE account.userid = " + user_id;
	stmt = conn.createStatement();
	rs = stmt.executeQuery(sql);

	if(rs = null)
	{
		alert("그런아이디 없음");
		
		rs.close();
		stmt.close();
		conn.close();

		history.back();
	}
	else if(rs.getString("password") != password)
	{
		alert("아이디 혹은 비밀번호를 잘못 입력하셨습니다.");

		rs.close();
		stmt.close();
		conn.close();

		history.back();
	}
	else
	{
		rs.close();
		stmt.close();
		conn.close();

		response.sendRedirect("mainPage.jsp/?idtype=client");
	}
%>