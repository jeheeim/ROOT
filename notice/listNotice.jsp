<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>게시판</title>
	<%@ include file="/common_header.jsp"%>
</head>
<body>
<%
	int total = 0;

	String dburl = "jdbc:mysql://localhost:3306/itsmdb";
	// 사용하려는 데이터베이스명을 포함한 URL 기술
	String dbuser = "root";
	// 사용자 계정
	String dbpw = "1234";
	// 사용자 계정의 패스워드
	int total = 0;

	/*		db login	*/
	try
	{
		Class.forName("com.mysql.jdbc.Driver").newInstance();

		Connection conn = DriverManager.getConnection(dburl,dbuser,dbpw);;
		Statement stmt = conn.createStatement();

		String sqlCount = "SELECT COUNT(*) FROM notice";
		ResultSet rs = stmt.executeQuery(sqlCount);

		if(rs.next())
		{
			total = rs.getInt(1);
		}
	}
	catch(Exception e)
	{
		out.println(e.toString());
	}
	finally
	{
		rs.close();
	}

	/*		paging		*/

	final int ROWSIZE = 15;	// 한페이지에 보일 게시물 수
	final int BLOCK = 5;	// 아래에 보일 페이지 최대개수 1~5 / 6~10 / 11~15 식으로 5개로 고정

	// page 번호
	int page;

	if(request.getParameter("page") !== null)
	{
		page = Integer.parseInt(request.getParameter("page"));
	}
	else
	{
		page = 1;
	}

	int start	= (page*ROWSIZE) - (ROWSIZE-1); // 해당페이지에서 시작번호(step2)
	int end		= (page*ROWSIZE); // 해당페이지에서 끝번호(step2)
	int allPage = 0; // 전체 페이지수
	int startPage = ((page-1)/BLOCK*BLOCK)+1; // 시작블럭숫자 (1~5페이지일경우 1, 6~10일경우 6)
	int endPage = ((page-1)/BLOCK*BLOCK)+BLOCK; // 끝 블럭 숫자 (1~5일 경우 5, 6~10일경우 10)

	allPage = (int)Math.ceil(total/(double)ROWSIZE);
		
	if(endPage > allPage)
	{
		endPage = allPage;
	}

	/*		db		*/

	try
	{
		//String sqlList = "SELECT NUM, USERNAME, TITLE, TIME, HIT, INDENT from board1 where STEP2 >="+start + " and STEP2 <= "+ end +" order by step2 asc";
		String sqlList = "SELECT num, created, title, account_id, isdeleted from notice order by NUM DESC WHERE idx >=" + start + "and idx" + end;
		rs = stmt.executeQuery(sqlList);
%>

<table class="table table-striped">

	<thead><tr> <th>번호</th> <th>제목</th> <th>일시</th> <th>작성자</th> <th>부서명</th> </tr></thead>

	<tbody>
	<%
		if(total == 0)
		{
	%>
		<tr>
			<td colspan="5">등록된 글이 없습니다.</td>
		</tr>

	<%
		}
		
		else
		{
			while(rs.next())
			{
				int idx = rs.getInt(1);
				String created = rs.getString(2);
				created = created.substring(0,10);
				String title = rs.getString(3);
				String account_id = rs.getString(4);
				int isDeleted = rs.getInt(5);

				if(isDeleted == 1){ continue; }

	%>

		<tr>
			<th><%=idx %></th>
			<td><a href="/mainPage.jsp?mod=203&idx=<%=idx%>"><%=title%></a></td>
			<td><%=created%></td>
			<td><%=account_id%></td>
			<td>Sample Department</td>
		</tr>

	<%
			}
		}
	
		rs.close();
		stmt.close();
		conn.close();
	}
		
	catch(SQLException e)
	{
		out.println( e.toString() );
	}
	%>

	</tbody>
</table>

<%
String urlPaing = "../mainPage.jsp?mod=201&page=";
String url_start_page = urlPaging + 1;
String url_end_page = urlPaging + endPage;
%>

<nav>
	<ul class="pagination">
		<li>
			<a href="<%=url_start_page%>" aria-label="Previous">
				<span aria-hidden="true">&laquo;</span>
			</a>
		</li>
		<%

		for(int i = 1; i <= endPage; i++)
		{
			urlPaing += i;
		%>
			<li><a href="<%=urlPaging%>"><%=i%></a></li>
		<%
		}
		%>
		<li>
		<a href="<%=url_end_page%>" aria-label="Next">
			<span aria-hidden="true">&raquo;</span>
		</a>
		</li>
	</ul>
</nav>

<div class="col-sm-1" id="control">
	<div class="btn-group" role="group" aria-label="...">
		<a href="/mainPage.jsp?mod=202" class="btn btn-default" type="button" role="button">글쓰기</a>
	</div>
</div>
</body>
</html>