<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%@ page import="java.sql.*" %>
<%@ page import="java.lang.*" %>
<%@ page session="true"%>
<%@ include file="../dbLogin.jspf" %>

<%
request.setCharacterEncoding("UTF-8");

// form 태그의 post방식으로 건너온 값들
String user_id	= request.getParameter("user_id");
String password	= request.getParameter("password");

/*
세션 생성을 위해 사용될 정보들
user_name: 사용자 이름
user_department: 사용자 소속
user_rank: 직책
idtype: 0=고객사 / 1=작업자 아이디
*/
String user_name		= "";
String user_company		= "";
String user_department	= "";
String user_rank		= "";
int idtype = 0;
	
try
{
	
	sql = "SELECT account.name, company.companyName, company_department.department, account.rank, account.isWorker, account.password FROM account, company, company_department WHERE account.id = \'" + user_id+
	"\' AND account.company_name = company.idx AND account.department = company_department.idx";
		
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
		
	if(rs.next())
	{
		user_name = rs.getString("name");
		user_company = rs.getString("companyName");
		user_department = rs.getString("department");
		user_rank = rs.getString("rank");
		idtype = rs.getInt("isWorker");

		out.println(idtype);
	}

	if(!password.equals(rs.getString("password")))
	{
		%> <script> alert("비밀번호 틀림"); history.go(-1); </script> <%
	}
	else
	{
		/*
		session 설정
		session 값         변수
		user_id				user_id
		user_name			user_name
		user_department		user_department
		user_rank			user_rank
		user_idtype			idtype
		*/

		session.setAttribute("user_id",			user_id);
		session.setAttribute("user_name",		user_name);
		session.setAttribute("user_department",	user_department);
		session.setAttribute("user_rank",		user_rank);
		session.setAttribute("user_idtype",		idtype);
   
		response.sendRedirect("mainPage.jsp");
	}
}
catch(SQLException e)
{
	out.println(e.toString());
}
// 쿼리가 성공 또는 실패에 상관없이 사용한 자원을 해제 한다. (순서중요)
finally
{
	// PreparedStatement 객체 해제
	if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}

	// Connection 해제
	if(conn != null) try{conn.close();}catch(SQLException sqle){}
}
%>