<%@ page language ="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <title>공지사항</title>
	<%@ include file="/common_header.jsp"%>
  </head>
<body>
	<%
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
				<textarea type="text" class="form-control" id="inputTitle" rows="1" readonly onfocus="this.blur()"><%=title%></textarea>
    		</div>
  		</div>
  		<div class="form-group">
    		<label for="inputClient" class="col-sm-2 control-label">등록자</label>
    		<div class="col-sm-10">
				<textarea type="text" class="form-control" id="inputClient" rows="1" readonly onfocus="this.blur()"><%=account%></textarea>
    		</div>
  		</div>
		  <div class="form-group">
    		<label for="inputDetail" class="col-sm-2 control-label">내용</label>
    		<div class="col-sm-10">
				<textarea class="form-control" rows="8" id="inputDetail" readonly onfocus="this.blur()"><%=content%></textarea>
    		</div>
  		</div>
  		<div class="form-group">
    		<div class="col-sm-offset-2 col-sm-1">
				<a class="btn btn-default" href="/mainPage.jsp?mod=201" role="button" type="submit">목록</a>
    		</div>
			<div class="col-sm-1" id="control">
				<div class="btn-group" role="group" aria-label="...">
					<a href="/mainPage.jsp?mod=202" class="btn btn-default" type="button" role="button">글쓰기</a>
				</div>
			</div>
			<div class="col-sm-offset-4 col-sm-1">
				<div class="btn-group" role="group" aria-label="...">
					<a href="/notice/deleteNoticeProcess.jsp?idx=<%=idx%>" class="btn btn-default" >삭제</a>
				</div>
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