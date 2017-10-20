<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
request.setCharacterEncoding("UTF-8");

String title				= request.getParameter("inputTitle");
String inputDetail			= request.getParameter("inputDetail");

	String user_id = (String)session.getAttribute("user_id");

	String dburl = "jdbc:mysql://localhost:3306/itsmdb";
	// 사용하려는 데이터베이스명을 포함한 URL 기술
	String dbuser = "root";
	// 사용자 계정
	String dbpw = "1234";
	// 사용자 계정의 패스워드
	Connection conn = null;
	PreparedStatement pstmt = null;

	int total = 0;
	String sql = "INSERT INTO notice(title, account_id, content, num) values (?, ?, ?, ?)";
	try {
		Class.forName("com.mysql.jdbc.Driver").newInstance();


		conn = DriverManager.getConnection(dburl, dbuser, dbpw);

		Statement stmt = conn.createStatement();

		String sqlCount = "SELECT COUNT(*) FROM notice";
		ResultSet rs = stmt.executeQuery(sqlCount);

		if(rs.next()){
			total = rs.getInt(1);
		}
		rs.close();
		total++;
		pstmt = conn.prepareStatement(sql);

		pstmt.setString(1, title);
		pstmt.setString(2, user_id);
		pstmt.setString(3, inputDetail);
		pstmt.setInt(4, total);
		pstmt.executeUpdate();

	}
	catch(SQLException e) {
	out.println(e.toString());
	}
	response.sendRedirect("/mainPage.jsp?mod=201");
%>