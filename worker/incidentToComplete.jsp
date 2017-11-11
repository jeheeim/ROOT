<%@ page language ="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../dbLogin.jspf"%>
<!DOCTYPE html>
<html lang="ko">
<style type="text/css"></style>
<head><title>Change To Release</title>
    <%@include file="/common_header.jsp"%>
</head>
<%
    int idx = Integer.parseInt(request.getParameter("idx"));
    try {
        stmt = conn.createStatement();
        sql = "UPDATE incident_management SET status = '4' WHERE idx=" + idx;
        stmt.executeUpdate(sql);

    }catch (Exception e){
%><%=e.toString()%><%
    }
%>
<body>
<%@include file="/common_footer.jsp"%>
</body>
</html>