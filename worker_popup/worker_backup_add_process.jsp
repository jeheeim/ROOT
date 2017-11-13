<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.lang.*" %>
<%@ page session="true"%>
<%@ include file="../dbLogin.jspf" %>

<%
request.setCharacterEncoding("UTF-8");
String date				= request.getParameter("inputDate");
String equipment		= request.getParameter("inputEquip");
String storage			= request.getParameter("inputCapacity");
String time				= request.getParameter("inputTime");
String worker			= request.getParameter("inputWorker");
String method			= request.getParameter("method");
String temp_time		= request.getParameter("inputHour");
int change_idx			=  Integer.parseInt(request.getParameter("change_idx"));
//String temp_change_idx	= "5";//일시적으로 popup창으로 값 가져오기 성공 아직 못함

date += " " + time;
out.println(date);
try
{
	sql = "INSERT INTO back_up_plan(date, equipment, storage, time, worker, method,change_idx)VALUES(?,?,?,?,?,?,?)";
	pstmt = conn.prepareStatement(sql);

	pstmt.setString(1, date);					//일자
	pstmt.setString(2, equipment);				//장비
	pstmt.setString(3, storage);				//저장공간
	pstmt.setString(4, temp_time);				//작업시간
	pstmt.setString(5, worker);					//작업자
	pstmt.setString(6, method);					//방식
	pstmt.setInt(7, change_idx);				//change index

	pstmt.executeUpdate();
	if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){} // PreparedStatement 객체 해제
	if(conn != null) try{conn.close();}catch(SQLException sqle){}	// Connection 해제
	%> <script> alert("등록 성공!"); history.go(-1);opener.parent.location.reload();self.close(); </script> <%
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