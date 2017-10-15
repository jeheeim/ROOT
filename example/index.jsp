<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%@ page import="java.sql.*" %>

<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	Statement stmt = null;
	ResultSet rs = null;

	String dburl = "jdbc:mysql://localhost:3306/teamp";
	// 사용하려는 데이터베이스명을 포함한 URL 기술
	String dbuser = "root";
	// 사용자 계정
	String dbpw = "dlawpgml90";
	// 사용자 계정의 패스워드

	String param_idx = request.getParameter("idx");

	String param_category = request.getParameter("category");

	String param_writerid = request.getParameter("writerid");

	int numrow=0;
%>

<!DOCTYPE html>

<html>
	<head>
		<title>team project</title>
	
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
    	<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<!-- twitter bootstrap에서 필수적으로 요구하는 사항.-->

		<link rel="stylesheet" type="text/css" href="http://localhost:8080/style.css">
		<!-- 우리가 만든 css 스타일 파일 -->
    	<link rel="stylesheet" href="http://localhost:8080/bootstrap-3.3.4-dist/css/bootstrap.min.css">
		<!-- 부트스트랩-->
	</head>

	<body id="target">
		<div class="container">
			<header class="jumbotron text-center">		<!-- 회색 박스-->

				<img src="image.png" alt="로고" class="img-circle" id="logo">
				<!-- 로고. 어째선지 잘 출력이 안된다. -->
				<h2><a href="http://localhost:8080/index.jsp">TEAM PROJECT 지식인</a></h2>

			</header>

			<div class="row">	<!-- 화면을 12개로 나눠 전체적인 크기를 맞추기 위한 div. 2-8-2로 나누었다. -->
				<nav class="col-md-2">	<!-- 여기에 광고 -->

				</nav>

				<div class="col-md-8">		<!-- 본문 -->

					<article>
						<table class="table">
							<tr><th>번호</th><th>카테고리</th><th>제목</th><th>작성자</th><th>작성일</th><th>조회수</th></tr>
							<!--| 번호	| 카테고리	 | 제목 | 작성자 | 작성일 | 조회수 | -->

							<tr>
						<%
							try
							{
								Class.forName("com.mysql.jdbc.Driver");
								// 데이터베이스와 연동하기 위해 DriverManager에 등록한다.

								conn=DriverManager.getConnection(dburl,dbuser,dbpw);
								// DriverManager 객체로부터 Connection 객체를 얻어온다.

								String sql = null;

								if(param_category!=null)
								{
									sql = "SELECT (?,?,?,?,?,?,?) FROM articles LEFT JOIN user ON writer_id = user.id WHERE categories.id = " + param_category + " ORDER BY id DESC";
								}

								else if(param_writerid!=null)
								{
									sql = "SELECT (?,?,?,?,?,?,?) FROM articles LEFT JOIN user ON writer_id = user.id WHERE user.id = " + Integer.parseInt(param_writerid) + " ORDER BY id DESC";
								}

								else if(param_idx!=null)
								{
									sql = "SELECT (?,?,?,?,?,?,?,?) FROM articles LEFT JOIN user ON writer_id = user.id WHERE articles.id = " + Integer.parseInt(param_idx);
								}

								else
								{
									sql = "SELECT (?,?,?,?,?,?,?) FROM articles LEFT JOIN user ON writer_id = user.id ORDER BY id DESC";
								}

								pstmt = conn.prepareStatement(sql);
								pstmt.setString(1,"articles.id");
								pstmt.setString(2, "category");
								pstmt.setString(3, "title");
								pstmt.setString(4, "writer_id");
								pstmt.setString(5, "user_id");
								pstmt.setString(6, "created");
								pstmt.setString(7, "view");

								if(param_idx != null)
								{
									pstmt.setString(8, "content");
								}

						// id, category, title, writer_id, user_id, created, view를 컬럼으로 만든다
						// param_idx값이 존재할 경우 content 도 불러온다.
						// id, category, title, writer_id, created, view, content는 articles 테이블에서 가져온다.
						// user 테이블에서 id는 articles테이블의 writer_id과 같이 놓아 writer_id부분에 맞는 user_id를 넣는다.

						//	| articles.id 	| category 	| title |  writer_id | user_id | created | view |(content)

								rs = pstmt.executeQuery();
								// conn에 입력된 db에 sql에 입력된 대로 데이터를 요구한다.
							}
							catch(Exception e)
							{
								e.printStackTrace();
								out.println("테이블 호출에 실패했습니다." + e.getMessage());
							}

							while(rs.next())// rs값에 null이 될때까지 반복한다.
							{
								int idx = rs.getInt("articles.id");
								String category = rs.getString("category");
								String title = rs.getString("title");
								int writer_id = rs.getInt("writer_id");
								String user_id = rs.getString("user_id");
								Timestamp created = rs.getTimestamp("created");
								String view = rs.getString("view");
						%>

								<td><%=idx%></td>
								<td><a href=index.jsp?category=<%=category%>><%=category%></a></td>
								<td><a href=index.jsp?idx=<%=idx%>></a><%=title%></td>
								<td><a href=index.jsp?writerid=<%=writer_id%>><%=user_id%></a></td>
								<td><%=created%></td>
								<td><%=view%></td>

						<%
							}

							rs.close();
							pstmt.close();
							conn.close();
						%>
							</tr>
						</table>

					</article>

					<hr>
					
					<div id="control">
						<%
							if(param_idx != null)
							{
								out.println("<div class=\"btn-group\" role=\"group\" aria-label=\"...\">");

								out.println("<a href=\"http://localhost:8080/write.jsp?id=" + Integer.parseInt(param_idx) + "\" class=\"btn btn-warning bnt-lg\">수정</a>");
								out.println("<a href=\"http://localhost:8080/delete.jsp\" class=\"btn btn-danger bnt-lg\">삭제</a>");
								out.println("<a href=\"http://localhost:8080/index.jsp\" class=\"btn btn-default bnt-lg\">목록</a>");

							}
						%>
						<a href="http://localhost:8080/write.jsp" class="btn btn-success bnt-lg">쓰기</a>
						<%
							if(param_idx != null)
							{
								out.println("</div>");
							}
						%>
					</div>
				</div>

				<div class="col-md-2"></div>
			</div>
		</div>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	   	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<!-- Include all compiled plugins (below), or include individual files as needed -->
    	<script src="http://localhost:8080/bootstrap-3.3.4-dist/js/bootstrap.min.js"></script>
	</body>
</html>