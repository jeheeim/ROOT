<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.lang.*" %>
<%@ page session="true"%>
<%@ include file="../dbLogin.jspf" %>

<%
request.setCharacterEncoding("UTF-8");

String title				= request.getParameter("inputTitle");
String inputGetBy			= request.getParameter("inputGetBy"); // 1: 전화 2:회의 3:이메일 4: 기타
String inputClient_company	= request.getParameter("inputClient_company"); // 리퀘스트 요청한 고객이 속한 회사
String inputClient_depart	= request.getParameter("inputClient_depart");// 고객의 부서
String inputClient			= request.getParameter("inputClient"); // 고객 이름
String inputPhone			= request.getParameter("inputPhone"); // 고객 전화번호
String inputRange			= request.getParameter("inputRange"); // 1: 전체 회사 2:부서 3: 팀 4: 개인
String inputEmergency		= request.getParameter("inputEmergency");//1.긴급 2.중요 3.경미
String inputDetail			= request.getParameter("inputDetail"); // 문제 상세 설명
String inputComment			= request.getParameter("inputComment"); // 접수자 의견
String inputDate_submit		= request.getParameter("inputDate_submit"); // 접수일자
String inputdate_Deadline	= request.getParameter("inputdate_Deadline"); // 목표일자
String customerName			= request.getParameter("SUB11"); // 접수자

// 키워드
String keyword_1 = request.getParameter("keyword1");
String keyword_2 = request.getParameter("keyword2");
String keyword_3 = request.getParameter("keyword3");

// 고객 이름
String sub11 = request.getParameter("SUB11");
String sub12 = request.getParameter("SUB12");
String sub13 = request.getParameter("SUB13");
String sub14 = request.getParameter("SUB14");
String sub15 = request.getParameter("SUB15");
String sub16 = request.getParameter("SUB16");
String sub17 = request.getParameter("SUB17");
String sub18 = request.getParameter("SUB18");
String sub19 = request.getParameter("SUB19");
String sub20 = request.getParameter("SUB20");

if(!sub11.equals("0")) customerName = sub11;
if(!sub12.equals("0")) customerName = sub12;
if(!sub13.equals("0")) customerName = sub13;
if(!sub14.equals("0")) customerName = sub14;
if(!sub15.equals("0")) customerName = sub15;
if(!sub16.equals("0")) customerName = sub16;
if(!sub17.equals("0")) customerName = sub17;
if(!sub18.equals("0")) customerName = sub18;
if(!sub19.equals("0")) customerName = sub19;
if(!sub20.equals("0")) customerName = sub20;

int priority = 0;

String id = "";
int user_index = 0;
String incident_index = "";
int customer_idx=0;
try
{
	id = (String)session.getAttribute("user_id");
	//접수자 - session에서 받아온 아이디를 Idx로
	sql = "SELECT * FROM account WHERE account.id = \'" + id +"\'";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	if(rs.next())
		user_index = Integer.parseInt(rs.getString("idx"));

	//고객 - 고객 이름을 고객 IDX로
	sql = "SELECT * FROM account WHERE account.name = \'" + customerName +"\'";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	if(rs.next())
		customer_idx = Integer.parseInt(rs.getString("idx"));

	priority = ( Integer.parseInt(inputRange) + Integer.parseInt(inputEmergency) ) / 2;

	// 입력받은 내용을 테이블에 입력
	sql = "INSERT INTO incident_management(title, reception_path, problem_scope, urgency, receptionist_opion, content, registration_date, deadline, customer, priority, receptionist)VALUES(?,?,?,?,?,?,?,?,?,?,?)";
	pstmt = conn.prepareStatement(sql);

	pstmt.setString(1, title);					//제목
	pstmt.setString(2, inputGetBy);				//접수경로
	pstmt.setString(3, inputRange);				//문제범위
	pstmt.setString(4, inputEmergency);			//긴급도
	pstmt.setString(5, inputDetail);			//접수자의견
	pstmt.setString(6, inputComment);			//내용
	pstmt.setString(7, inputDate_submit);		//요청일시
	pstmt.setString(8, inputdate_Deadline);		//목표기한
	pstmt.setInt(9, customer_idx);				//고객 번호
	pstmt.setString(10, String.valueOf(priority));//우선순위
	pstmt.setInt(11, user_index);			//접수자이름
	//입력: 부서, 우선순위,//출력: 연락처, 이름

	pstmt.executeUpdate();
	
	sql = "SELECT MAX(incident_management.idx) FROM incident_management";       
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	if(rs.next())
		incident_index = rs.getString("MAX(incident_management.idx)");

	sql = "INSERT INTO kms(incident_index, change_index, is_delete, keyword_1, keyword_2, keyword_3) VALUES(?,?,?,?,?,?)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, incident_index);			//incident index
	pstmt.setInt(2, 0);							//change index
	pstmt.setInt(3, 0);							//is delete
	pstmt.setString(4, keyword_1);				//keyword_1
	pstmt.setString(5, keyword_2);				//keyword_2
	pstmt.setString(6, keyword_3);				//keyword_3
	pstmt.executeUpdate();
	
	%> <script> alert("등록 성공!"); history.go(-1); </script> <%
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