<%@ page language ="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../dbLogin.jspf"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<%@include file="../common_header.jsp"%>
	<title>Change.jsp</title>
</head>
<body>
<%
int idx = Integer.parseInt(request.getParameter("idx"));
String sql_email = "SELECT account.email, incident_management.title, account.name FROM incident_management "
		+ "LEFT JOIN account ON incident_management.customer = account.idx "
		+ "WHERE incident_management.idx="+idx;
try
{
	stmt = conn.createStatement();
	sql = "UPDATE incident_management SET status = '4' WHERE idx=" + idx;
	stmt.executeUpdate(sql);
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

}
catch(SQLException sqle) { out.println(sqle.toString()); }
catch (Exception e){ out.println(e.toString());}
finally
{
	stmt.close();
	conn.close();
}
%>
<%@include file="/common_footer.jsp"%>
<script>
    alert("완료 변경완료");
    opener.parent.location.reload();
</script>
<form class="form-group">
	<a class="btn btn-default"
	   onclick="sendMail()">메일전송</a>
</form>

</body>
</html>