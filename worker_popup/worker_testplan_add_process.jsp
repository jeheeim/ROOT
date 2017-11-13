<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.lang.*" %>
<%@ page session="true"%>
<%@ include file="../dbLogin.jspf" %>

<%
request.setCharacterEncoding("UTF-8");
String date_1				= request.getParameter("inputDate");
String date_2				= request.getParameter("inputDate_2");
String worker				= request.getParameter("inputWorker");
String test_case			= request.getParameter("testcase");
String expected_result		= request.getParameter("result");
String note					= request.getParameter("note");
int change_idx				= Integer.parseInt(request.getParameter("change_idx"));

date_1 += " " + date_2;
try
{
	sql = "INSERT INTO test_plan(date, manager, test_case, expected_result, remark, change_idx)VALUES(?,?,?,?,?,?)";
	pstmt = conn.prepareStatement(sql);

	pstmt.setString(1, date_1);					//일자
	pstmt.setString(2, worker);					//작업자
	pstmt.setString(3, test_case);				//test_case
	pstmt.setString(4, expected_result);		//결과
	pstmt.setString(5, note);					//비고
	pstmt.setInt(6, change_idx);				//change index

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