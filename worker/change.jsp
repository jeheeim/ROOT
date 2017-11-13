<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../dbLogin.jspf"%>
<%
        int idx = Integer.parseInt(request.getParameter("param"));
        String backup_page = "backup_plan.jsp?idx="+idx;
        String work_page = "work_plan.jsp?idx="+idx;
        String test_page = "test_plan.jsp?idx="+idx;
        String recovery_page = "recovery_plan.jsp?idx="+idx;

        sql = "SELECT incident_management.status FROM kms LEFT JOIN incident_management ON"
            + " incident_management.idx = kms.incident_index WHERE kms.change_index="+idx;
        String sql_review = "SELECT review FROM change_management WHERE change_management.idx="+idx;
        try{
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <%@include file="../common_header.jsp"%>
    <title>Change.jsp</title>
</head>
<body>
<div id="BackUpFrame">
    <jsp:include page="<%=backup_page%>" flush="true"/>
</div>

<div id="WorkFrame">
    <jsp:include page="<%=work_page%>" flush="true"/>
</div>

<div id="TestFrame">
    <jsp:include page="<%=test_page%>" flush="true"/>
</div>

<div id="RecoveryFrame">
    <jsp:include page="<%=recovery_page%>" flush="true"/>
</div>
<!--검토사항 시작-->
<form class="form-horizontal">
    <div class="form-group">
        <label class="col-sm-1 control-label">검토사항</label>
<%
        stmt = conn.createStatement();
        rs = stmt.executeQuery(sql_review);
        String review = null;
        if(rs.next()){
            review = rs.getString(1);
        }
%>
        <div class="col-sm-8">
            <div class="well well-sm"><%=review%></div>
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-1"></div>
<%
        rs.close();
    rs = stmt.executeQuery(sql);
    if(rs.next()){
        int status = rs.getInt(1);
        switch (status){
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

    }catch (Exception e){
    e.toString();
    }
%>
    </div>
</form>
<!--검토사항 끝-->
<%@include file="/common_footer.jsp"%>

</body>
</html>