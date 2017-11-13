<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.lang.*" %>
<%@ page session="true"%>
<%@ include file="../dbLogin.jspf" %>

<%
request.setCharacterEncoding("UTF-8");
String date_1				= request.getParameter("inputDate_1");
String date_2				= request.getParameter("inputDate_2");
String detail				= request.getParameter("inputworkDetail");
String worker				= request.getParameter("inputWorker");
String note					= request.getParameter("note");
String summary				= request.getParameter("inputTarget");
int change_idx				= Integer.parseInt(request.getParameter("change_idx"));
//String temp_change_idx	= "5";//일시적으로 popup창으로 값 가져오기 성공 아직 못함

date_1 += " " + date_2;
try
{
	sql = "INSERT INTO work_plan(summary, date, worker, detail, remark, change_idx)VALUES(?,?,?,?,?,?)";
	pstmt = conn.prepareStatement(sql);

	pstmt.setString(1, summary);				//구분
	pstmt.setString(2, date_1);					//일자
	pstmt.setString(3, worker);					//작업자
	pstmt.setString(4, detail);					//세부사항
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