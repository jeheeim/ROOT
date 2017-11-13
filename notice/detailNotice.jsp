<%@ page language ="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="/dbLogin.jspf"%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<%@ include file="/common_header.jsp"%>
    <title>공지사항</title>
</head>

<body>
<%
try
{
	int idx = Integer.parseInt(request.getParameter("idx"));
	
	String title = "";
	String account = "";
	String content = "";

	stmt = conn.createStatement();
	
	sql = "SELECT title, account_id, content FROM notice WHERE num=" + idx;
	rs = stmt.executeQuery(sql);

	if(rs.next())
	{
		title = rs.getString(1);
		account = rs.getString(2);
		content = rs.getString(3);
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
	else { out.print("오류 뿜뿜"); }

	rs.close();
	stmt.close();
	conn.close();

}
catch(SQLException sqle) { out.println( sqle.toString()); }
catch(Exception e) { out.println(e.toString()); }
%>
	<%@ include file="/common_footer.jsp"%>
</body>
</html>