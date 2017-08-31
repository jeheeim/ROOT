<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%@ page import="java.sql.*" %>
<%@ page import="java.lang.*" %>
<%@ page import="java.text" %>

<%
	request.setCharacterEncoding("UTF-8");

	// form 태그의 post방식으로 건너온 값들
	String user_id = request.getParameter("user_id");
	String password = request.getParameter("password");
	
	// 세션 생성을 위해 사용될 정보들
	String user_name	 = "";
	String user_category = "";
	String user_rank	 = "";
	String idtype		 = "";

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
	
	// 비밀번호화 아이디 타입을 묻는 쿼리문
	sql = "SELECT * FROM account WHERE account.userid = " + user_id;
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

	// 세션에 입력될 정보를 가져옴. idtype은 그 자료형에 따라 바뀔 수 있다.
	user_name = rs.getString("name");
	user_category = rs.getString("category");
	user_rank = rs.getString("rank");
	idtype = rs.getString("idtype");

	rs.close();
	stmt.close();
	conn.close();

	// user_id, user_name, user_rank, user_category, user_idtype 등을 값으로 갖는 세션 생성
	session.setAttribute("userid", user_id);
	session.setAttribute("user_name", user_name);
	session.setAttribute("user_category", user_category);
	session.setAttribute("user_rank", user_rank);
	session.setAttribute("user_idtype", idtype);
	
	response.sendRedirect("mainPage.jsp");
%>