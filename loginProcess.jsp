<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%@ page import="java.sql.*" %>
<%@ page import="java.lang.*" %>
<%@ page import="java.text" %>

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
	int	   idtype;
	
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

	// 세션에 입력될 정보를 가져옴. idtype은 그 자료의 형식에 따라 바뀔 수 있다.
	user_name	  = rs.getString("name");
	user_category = rs.getString("category");
	user_rank	  = rs.getString("rank");
	idtype		  = Integer.parseInt(rs.getString("idtype"));

	rs.close();
	stmt.close();
	conn.close();

	/*
	session 설정
	session 값			변수
	user_id				user_id
	user_name			user_name
	user_category		user_category
	user_rank			user_rank
	user_idtype			idtype
	*/
	session.setAttribute("user_id",			user_id);
	session.setAttribute("user_name",		user_name);
	session.setAttribute("user_category",	user_category);
	session.setAttribute("user_rank",		user_rank);
	session.setAttribute("user_idtype",		idtype);
	
	response.sendRedirect("mainPage.jsp");
%>