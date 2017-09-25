<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("UTF-8");

String title				= request.getParameter("inputTitle");
String inputDetail			= request.getParameter("inputDetail");

out.println(title + " " + inputDetail);
// 작성자 db와 링크해야(db상의 작성자 id값을 적도록 해야한다.)

%>