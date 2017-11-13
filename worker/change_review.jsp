<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../dbLogin.jspf"%>
<%
    int idx = Integer.parseInt(request.getParameter("idx"));
    String sql_review = "SELECT review FROM change_management WHERE change_management.idx="+idx;
    String review = null;
    try{
        stmt = conn.createStatement();
        rs = stmt.executeQuery(sql_review);
        if(rs.next()){
            review = rs.getString(1);
        }
    }catch (Exception e){
        e.toString();
    }
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <%@include file="../common_header.jsp"%>
    <title>Change review</title>
</head>
<body>

<!--검토사항 시작-->
<form class="form-horizontal" action="/worker/change_review_process.jsp?idx=<%=idx%>" method="post" accept-charset="UTF-8">
    <div class="form-group">
        <label class="col-sm-1 control-label" for="inputReview">검토사항</label>
            <div class="col-sm-8">
                <textarea class="form-control" rows="3" name="inputReview"><%=review%></textarea>
            </div>
        <div class="col-sm-3">&nbsp;</div>
            <div class="col-sm-1">
                <button href="/worker/change_review_process.jsp?idx=<%=idx%>" type="submit" class="btn btn-default">등록</button>
            </div>
            <div class="col-sm-1">
                <a class="btn btn-default" onclick="self.close()">취소</a>
            </div>
    </div>
</form>
<%@include file="/common_footer.jsp"%>
</body>
</html>