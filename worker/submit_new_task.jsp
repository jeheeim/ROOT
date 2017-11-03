<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.lang.*" %>
<%@ page session="true"%>
<%@ include file="../dbLogin.jspf" %>

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
String inputDate_submit		= request.getParameter("inputDate_submit");
String inputdate_Deadline	= request.getParameter("inputdate_Deadline");
String receptionist	= request.getParameter("inputClient");
int priority = 0;
PreparedStatement pstmt = null;
/*	1. 한글 입력되게 해야함
	2. db연동 기초작업
*/
String id="";
String user_index = "";

try
{
	conn=DriverManager.getConnection(dburl,dbuser,dbpw);
	id = (String)session.getAttribute("user_id");
	sql = "SELECT * FROM account WHERE account.id = \'" + id+"\'";       
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	if(rs.next())
		user_index = rs.getString("Idx");

	priority = ( Integer.parseInt(inputRange) + Integer.parseInt(inputEmergency) ) / 2;
	sql = "INSERT INTO incident_management(title, reception_path, problem_scope, urgency, receptionist_opion, content, registration_date, deadline, status, customer, priority,receptionist)VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";
	pstmt = conn.prepareStatement(sql);

	pstmt.setString(1, title);					//제목
	pstmt.setString(2, inputGetBy);				//접수경로
	pstmt.setString(3, inputRange);				//문제범위
	pstmt.setString(4, inputEmergency);			//긴급도
	pstmt.setString(5, inputDetail);			//접수자의견
	pstmt.setString(6, inputComment);			//내용
	pstmt.setString(7, inputDate_submit);		//요청일시
	pstmt.setString(8, inputdate_Deadline);		//목표기한
	pstmt.setString(9, "0");		//상태
	pstmt.setString(10, user_index);	//id
	pstmt.setString(11, String.valueOf(priority));		//우선순위
	pstmt.setString(12, String.valueOf(receptionist));		//우선순위
	//입력: 부서, 우선순위,//출력: 연락처, 이름

	
	pstmt.executeUpdate();
	out.println("성공");
}
catch(Exception e)
{
	out.println(e.toString());
	
}
// 쿼리가 성공 또는 실패에 상관없이 사용한 자원을 해제 한다. (순서중요)
finally
{                                                            
	if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){} // PreparedStatement 객체 해제
	if(conn != null) try{conn.close();}catch(SQLException sqle){}	// Connection 해제
}
%>