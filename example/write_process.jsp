<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%@ page import="java.sql.*" %>
<%@ page import="java.lang.*" %>
<%@ page import="java.text" %>

<%
	String dburl = "jdbc:mysql://localhost:3306/teamp";
	// 사용하려는 데이터베이스명을 포함한 URL 기술
	String dbuser = "root";
	// 사용자 계정
	String dbpw = "dlawpgml90";
	// 사용자 계정의 패스워드

	Class.forName("com.mysql.jdbc.Driver");

	Connection conn = DriverManager.getConnection(dburl,dbuser,dbpw);;


	Statement stmt = null;
	Statement stmt_insert = null;
	
	ResultSet rs = null;
	ResultSet rs_insert = null;

	String sql = null;
	String sql_insert = null;


	String param_idx = request.getParameter("idx");
	String param_category = request.getParameter("category");
	String param_writerid = request.getParameter("writerid");

	request.setCharacterEncoding("utf-8");

	String param_idx = request.getParameter("idx");

	String title = getParameter("title");
	String category = getParameter("category");
	String writer = getParameter("writer");
	String password = getParameter("password");
	String email = getParameter("email");
	String content = getParameter("content");
	Date now = new Date();


	// 수정하는 경우. idx값이 넘어오는 경우는 수정할때 뿐이다.
	if(param_idx == null)
	{
		// 데이터베이스와 연동하기 위해 DriverManager에 등록한다.

		// DriverManager 객체로부터 Connection 객체를 얻어온다.


		sql = "SELECT * FROM articles LEFT JOIN user ON writer_id = user.id WHERE articles.id = " + Integer.parseInt(param_idx);

		stmt = conn.createStatement();

		rs = stmt.executeQuery(sql);

		if(rs.getString("user_id") != writer && rs.getString("password") != password)
		{
			alert("아이디 혹은 비밀번호를 잘못 입력하셨습니다.");

			rs.close();
			stmt.close();
			conn.close();

			history.back();
		}

		else
		{
			sql_insert = "UPDATE articles SET (category, title, created, content) = (\"" + category + "\", \"" + title + "\", \"" + now + "\", \"" + content + "\")";

			stmt_insert = conn.createStatement();

			rs_insert = stmt_insert.executeQuery(sql_insert);

			stmt_insert.close();
			rs_insert.close();
		}

		rs.close();
		stmt.close();
		conn.close();

		response.sendRedirect("index.jsp");
	}

	else
	{
		sql = "SELECT * FROM user WHERE user_id = " + writer;

		stmt = conn.createStatement();

		rs = stmt.executeQuery(sql);

		if(rs.getString("user_id") == null)
		{
			sql_insert = "INSERT INTO user VALUES (\"" + writer + "\", \"" + password + "\", \""  + email + "\")";
			stmt_insert = conn.createStatement();
			rs_insert = stmt_insert.executeQuery(sql);

			int user_inx = rs_insert("id");

			rs_insert.close();
			stmt_insert.close();

			sql_insert = "INSERT INTO articles VALUES (\"" + title + "\", \"" + user_idx + "\", \""  + category + "\", \"" + now + 0 + content + "\")";
			stmt_insert = conn.createStatement();
			rs_insert = stmt_insert.executeQuery(sql);

			rs_insert.close();
			stmt_insert.close();
		}
	}

%>