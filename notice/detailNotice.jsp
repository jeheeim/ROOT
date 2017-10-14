<%@ page language ="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="/common_header.jsp"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <title>공지사항</title>
  </head>
<body>
    <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    <script src="/bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>

	<%
		out.print("여기다 여기");
		String dburl = "jdbc:mysql://localhost:3306/itsmdb";
		// 사용하려는 데이터베이스명을 포함한 URL 기술
		String dbuser = "root";
		// 사용자 계정
		String dbpw = "1234";
		// 사용자 계정의 패스워드
		int idx = Integer.parseInt(request.getParameter("idx"));
		try
		{
			Class.forName("com.mysql.jdbc.Driver").newInstance();

			Connection conn = DriverManager.getConnection(dburl,dbuser,dbpw);;
			Statement stmt = conn.createStatement();

			String sql = "SELECT title, account_id, content FROM notice WHERE num=" + idx;
			ResultSet rs = stmt.executeQuery(sql);

			if(rs.next()){

				String title = rs.getString(1);

				String account = rs.getString(2);

				String content = rs.getString(3);
	%>

	<form class="form-horizontal">
  		<div class="form-group">
    		<label for="inputTitle" class="col-sm-2 control-label">제목</label>
    		<div class="col-sm-10">
				<textarea type="text" class="form-control" id="inputTitle" rows="1" readonly><%=title%></textarea>
    		</div>
  		</div>
  		<div class="form-group">
    		<label for="inputClient" class="col-sm-2 control-label">등록자</label>
    		<div class="col-sm-10">
				<textarea type="text" class="form-control" id="inputClient" rows="1" readonly><%=account%></textarea>
    		</div>
  		</div>
		  <div class="form-group">
    		<label for="inputDetail" class="col-sm-2 control-label">내용</label>
    		<div class="col-sm-10">
				<textarea class="form-control" rows="8" id="inputDetail" readonly><%=content%></textarea>
    		</div>
  		</div>
  		<div class="form-group">
    		<div class="col-sm-offset-2 col-sm-1">
    			<button class="btn btn-default" type="submit" href="/mainPage.jsp?mod=201">목록</button>
    		</div>
				<div class="col-sm-1">
    			<button class="btn btn-default" type="submit">글쓰기</button>
    		</div>
  		</div>
</form>
<%
			}
			else{
			    out.print("오류 뿜뿜");
			}
		rs.close();
		stmt.close();
		conn.close();
		}catch(SQLException e){
				out.println( e.toString() );
		}
%>
</body>
</html>