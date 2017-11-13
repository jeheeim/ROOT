<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.lang.*" %>
<%@ page session="true"%>
<%@ include file="../dbLogin.jspf" %>

<%
request.setCharacterEncoding("UTF-8");
String target				= request.getParameter("inputTarget");
int time					= Integer.parseInt(request.getParameter("inputHour"));
String worker				= request.getParameter("inputWorker");
String method				= request.getParameter("method");
String note					= request.getParameter("note");
int change_idx				= Integer.parseInt(request.getParameter("change_idx"));
String date_1				= request.getParameter("inputTime_1");
String date_2				= request.getParameter("inputTime_2");
date_1 += " " + date_2;
try
{
	sql = "INSERT INTO recovery_plan(target, time, worker, method, remark, change_idx, date)VALUES(?,?,?,?,?,?,?)";
	pstmt = conn.prepareStatement(sql);

	pstmt.setString(1, target);					//복구대상
	pstmt.setInt(2, time);						//시간
	pstmt.setString(3, worker);					//작업자
	pstmt.setString(4, method);					//복구방법
	pstmt.setString(5, note);					//비고
	pstmt.setInt(6, change_idx);				//change index
	pstmt.setString(7, date_1);					//복구 시각
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