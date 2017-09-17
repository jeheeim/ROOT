<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%@ page import="java.sql.*" %>
<%@ page import="java.lang.*" %>

<%@ include file="dbLogin.jspf" %>

<%
	request.setCharacterEncoding("UTF-8");
	// form 태그의 post방식으로 건너온 값들
	String user_id	= request.getParameter("user_id");
	String password	= request.getParameter("password");
	/*
	세션 생성을 위해 사용될 정보들
	user_name: 사용자 이름
	user_category: 사용자 소속
	user_rank: 직책
	idtype: 0=고객사 / 1=작업자 아이디
	*/
	String user_name	 = "";
	String user_category = "";
	String user_rank	 = "";
	boolean	   idtype;
	String rs_password="";
	// 비밀번호화 아이디 타입을 묻는 쿼리문과 데이터베이스 연결
	                                       
	// null로 초기화 한다.
	PreparedStatement pstmt = null;
	try{
		conn=DriverManager.getConnection(dburl,dbuser,dbpw);              
		sql = "SELECT * FROM account WHERE account.id = \'" + user_id+"\'";       
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		if(rs.next()){	}
		
		if(!password.equals(rs.getString("password")))
		{
			out.println("암호 틀림");
			out.println("<a href =\"login.jsp\">로그인 페이지로</a>");
		}
		else{
			out.println(user_id+"님 로그인 성공하셨습니다.");
			out.println("<a href =\"mainPage.jsp\">회원 페이지로</a>");
		}
	}
	catch(Exception e){
		out.println("오류");
	}
%>