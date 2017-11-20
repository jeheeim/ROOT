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
    String sql_email = "SELECT account.email, incident_management.title, account.name FROM incident_management "
            + "LEFT JOIN account ON incident_management.customer = account.idx "
            + "WHERE incident_management.idx="+idx;
    int target = -1;
    String sql_update = "UPDATE incident_management SET status = '4' WHERE idx=";
    try {
        stmt = conn.createStatement();
        sql = "SELECT incident_management.idx FROM kms LEFT JOIN incident_management ON incident_management.idx = kms.incident_index WHERE kms.change_index="+idx;
        rs = stmt.executeQuery(sql);
        if(rs.next())
            target = rs.getInt(1);
        rs.close();

        sql_update = sql_update + Integer.toString(target);
        stmt.executeUpdate(sql_update);
        rs = stmt.executeQuery(sql_email);
        if(rs.next()){
%>
<script>
    function sendMail()
    {
        document.location.href = "mailto:"
            + '<%=rs.getString(1)%>'
            + "?subject=" + '<%=rs.getString(2)%>'
            + "&body=" + '<%=rs.getString(2)%>' + encodeURIComponent(" is completed.");
    }
</script>
<%
        }
        stmt.close();
%>
<script>
    alert("완료 변경완료");
    opener.parent.location.reload();
</script>
<%

}catch (Exception e){
%><%=e.toString()%><%
    }
%>
<body>
<form class="form-group">

    <a class="btn btn-default"
       onclick="sendMail()">메일전송</a>

</form>
<%@include file="/common_footer.jsp"%>
</body>
</html>