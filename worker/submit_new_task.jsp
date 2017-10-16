<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.lang.*" %>
<%@ page session="true"%>
<%@ include file="/dbLogin.jspf" %>

<%
request.setCharacterEncoding("UTF-8");
String title				= request.getParameter("inputTitle");
String inputGetBy			= request.getParameter("inputGetBy"); // 1: 전화 2:회의 3:이메일 4: 기타
String inputClient_company	= request.getParameter("inputClient_company"); //1.삼성SDI 2.LINE 3.LG CNS 4.돈 많이 주는 곳
String inputClient_depart	= request.getParameter("inputClient_depart");//1.작전과 2.정보과 3.인사과 4. 군수과
String inputClient			= request.getParameter("inputClient");//1.대위 김호룡 2.소령 서상인 3.소위 김나도 4.중위 김김김
String inputRange			= request.getParameter("inputRange"); // 1: 전체 회사 2:부서 3: 팀 4: 개인
String inputEmergency		= request.getParameter("inputEmergency");//1.긴급 2.중요 3.경미
String inputDetail			= request.getParameter("inputDetail");
String inputComment			= request.getParameter("inputComment");

PreparedStatement pstmt = null;
/*	1. 한글 입력되게 해야함
	2. db연동 기초작업
*/

try
{
	conn=DriverManager.getConnection(dburl,dbuser,dbpw);

	sql = "INSERT INTO incident_management(title, reception_path, problem_scope, urgency, action_details, content) VALUES(?,?,?,?,?,?)";
	pstmt = conn.prepareStatement(sql);

	pstmt.setString(1, title);
	pstmt.setString(2, inputGetBy);
	pstmt.setString(3, inputRange);
	pstmt.setString(4, inputEmergency);
	pstmt.setString(5, inputDetail);
	pstmt.setString(6, inputComment);
	pstmt.executeUpdate();
	out.println("성공");
}
catch(Exception e)
{
	//out.println(e.toString());
	%> <script> alert("입력 실패"); history.go(-1); </script> <%
		
}
// 쿼리가 성공 또는 실패에 상관없이 사용한 자원을 해제 한다. (순서중요)
finally
{                                                            
	if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){} // PreparedStatement 객체 해제
	if(conn != null) try{conn.close();}catch(SQLException sqle){}	// Connection 해제
}
%>