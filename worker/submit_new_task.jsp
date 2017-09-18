<%@ page language ="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("UTF-8");
String title				= request.getParameter("inputTitle");
String inputGetBy			= request.getParameter("intputGetBy"); // 1: 전화 2:회의 3:이메일 4: 기타
String inputClient_company	= request.getParameter("inputClient_company");
String inputClient_depart	= request.getParameter("inputClient_depart");
String inputClient			= request.getParameter("inputClient");
String inputRange			= request.getParameter("inputRange"); // 1: 전체 회사 2:부서 3: 팀 4: 개인
String inputEmergency		= request.getParameter("inputEmergency");
String inputDetail			= request.getParameter("inputDetail");
String inputComment			= request.getParameter("inputComment");

out.println(title + inputDetail);
/*	1. 한글 입력되게 해야함
	2. db연동 기초작업
*/
%>