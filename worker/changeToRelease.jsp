<%@ page language ="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../dbLogin.jspf"%>
<%@ page import="java.IO.*"%>
<!DOCTYPE html>
<html lang="ko">
<style type="text/css"></style>
<head><title>Change To Release</title>
<%@include file="/common_header.jsp"%>
</head>
<%
    int idx = Integer.parseInt(request.getParameter("idx"));

    int target = -1;
    String sql_update = "UPDATE incident_management SET status = '3' WHERE idx=";
    try {
        stmt = conn.createStatement();
        sql = "SELECT incident_management.idx FROM kms LEFT JOIN incident_management ON incident_management.idx = kms.incident_index WHERE kms.change_index="+idx;
        rs = stmt.executeQuery(sql);
        if(rs.next())
            target = rs.getInt(1);
        rs.close();

        sql_update = sql_update + Integer.toString(target);
        stmt.executeUpdate(sql_update);
        stmt.close();
        %><script>
            alert("릴리즈 변경완료");
            opener.parent.location.reload();
            self.close();
        </script><%

    }catch (Exception e){
        %><%=e.toString()%><%
    }
%>
<body>
<%@include file="/common_footer.jsp"%>
</body>
</html>