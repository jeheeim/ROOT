<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%@ page import="java.sql.*" %>
<%@ page import="java.lang.*" %>
<%@page session="true"%>
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
	String idtype	= "";
	                
	// null로 초기화 한다.
	PreparedStatement pstmt = null;
	try{
		conn=DriverManager.getConnection(dburl,dbuser,dbpw);              
		sql = "SELECT * FROM account WHERE account.id = \'" + user_id+"\'";       
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		if(rs.next()){
			user_name = rs.getString("name");
			user_category = rs.getString("department");
			user_rank = rs.getString("rank");
			idtype = rs.getString("ismanage");
		}
		if(!password.equals(rs.getString("password")))
		{
			%> <script> alert("비밀번호 틀림"); history.go(-1); </script> <%
		}
		else{
			//out.println(user_id+"님 로그인 성공하셨습니다.");
			//out.println("<a href =\"mainPage.jsp\">회원 페이지로</a>");
			/*
			session 설정
			session 값         변수
   			user_id            user_id
  			user_name         user_name
  			user_category      user_category
  			user_rank         user_rank
  			user_idtype         idtype
  			*/
  			session.setAttribute("user_id",         user_id);
  			session.setAttribute("user_name",      user_name);
  			session.setAttribute("user_category",   user_category);
  			session.setAttribute("user_rank",      user_rank);
  			session.setAttribute("user_idtype",      idtype);
   
  			response.sendRedirect("mainPage.jsp");
		}
	}
	catch(Exception e){
		%> <script> alert("로그인 실패"); history.go(-1); </script> <%
	}
%>