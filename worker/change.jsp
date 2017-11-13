<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../dbLogin.jspf"%>
<%
// 입력받은 인시던트 인덱스
int idx = 0;

// 백업계획, 작업계획, 테스트 계획, 복구계획 페이지
String backup_page = "";
String work_page = "";
String test_page = "";
String recovery_page = "";

// 변경 테이블의 review
String review = null;

// 인시던트 테이블에서 상태 값을 불러오는 쿼리문
sql = "SELECT incident_management.status FROM kms "
	+ "LEFT JOIN incident_management ON incident_management.idx = kms.incident_index "
	+ "WHERE kms.change_index="+idx;

// 변경 테이블에서 review 값을 불러오는 쿼리문
String sql_review = "SELECT review FROM change_management WHERE change_management.idx="+idx;

try
{
	idx = Integer.parseInt(request.getParameter("param"));
	
	backup_page = "backup_plan.jsp?idx="+idx;
	work_page = "work_plan.jsp?idx="+idx;
	test_page = "test_plan.jsp?idx="+idx;
	recovery_page = "recovery_plan.jsp?idx="+idx;
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <%@include file="../common_header.jsp"%>
    <title>Change.jsp</title>
</head>
<body>
	<!--백업 계획-->
	<div id="BackUpFrame"><jsp:include page="<%=backup_page%>" flush="true"/></div>
	
	<!--작업 계획-->
	<div id="WorkFrame"><jsp:include page="<%=work_page%>" flush="true"/></div>

	<!--테스트 계획-->
	<div id="TestFrame"><jsp:include page="<%=test_page%>" flush="true"/></div>

	<!--복구 계획-->
	<div id="RecoveryFrame"><jsp:include page="<%=recovery_page%>" flush="true"/></div>

	<!--검토사항 시작-->
	<form class="form-horizontal">
    	<div class="form-group">
	        <label class="col-sm-1 control-label">검토사항</label>
<%
	stmt = conn.createStatement();
	rs = stmt.executeQuery(sql_review);

	if(rs.next()) { review = rs.getString(1); }
%>
			<div class="col-sm-8"><div class="well well-sm"><%=review%></div>
		</div>
	</div>
	<div class="form-group">
		<div class="col-sm-1"></div>
<%
	rs.close();
	rs = stmt.executeQuery(sql);

	if(rs.next())
	{
		int status = rs.getInt(1);
		switch (status)
		{
		case 0:
		case 1:
%><%=status%><%
			break;
		case 2:
%>
		<a class="btn btn-default"
			onclick="window.open('/worker/change_review.jsp?idx=<%=idx%>', '검토사항 수정',''); return false;" target="_blank">검토사항 수정</a>
		<a class="btn btn-default"
			onclick="window.open('/worker/changeToRelease.jsp?idx=<%=idx%>', '릴리즈로 변경',''); return false;" target="_blank">릴리즈로 변경</a><%
			break;
		case 3:
%>
		<a class="btn btn-default"
			onclick="window.open('/worker/releaseToComplete.jsp?idx=<%=idx%>', '완료로 변경',''); return false;" target="_blank">완료로 변경</a><%
			break;
		case 4:
%><div class="btn btn-default">완료입니다</div><%
			break;
		}
	}
}
catch(SQLException sqle) { out.println(sqle.toString()); }
catch (Exception e) { out.println(e.toString()); }
finally
{
	stmt.close();
	conn.close();
}
%>
    </div>
</form>
<!--검토사항 끝-->

<%@include file="/common_footer.jsp"%>
</body>
</html>