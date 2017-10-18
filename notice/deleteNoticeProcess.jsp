<%@ page language ="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="/common_header.jsp"%>

<!DOCTYPE html>
<html lang="ko">
<head>
</head>
<body>
<%

    request.setCharacterEncoding("UTF-8");
    int idx = Integer.parseInt(request.getParameter("idx"));
    String sql = "UPDATE notice SET delete=1 WHERE NUM=" + idx;
    try
    {
        Class.forName("com.mysql.jdbc.Driver").newInstance();

        String dburl = "jdbc:mysql://localhost:3306/itsmdb";
        // 사용하려는 데이터베이스명을 포함한 URL 기술
        String dbuser = "root";
        // 사용자 계정
        String dbpw = "1234";
        // 사용자 계정의 패스워드

        Connection conn = DriverManager.getConnection(dburl,dbuser,dbpw);;
        Statement stmt = conn.createStatement();

        ResultSet rs = stmt.executeQuery(sql);
%>
<script>self.window.alert("글이삭제되었습니다.")</script>
<%
    rs.close();
    stmt.close();
    conn.close();
    }
    catch (SQLException e){
        out.println(e.toString());
    }
%>
</body>
</html>