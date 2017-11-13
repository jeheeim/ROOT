<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../dbLogin.jspf"%>
<%
    request.setCharacterEncoding("UTF-8");
    int idx = Integer.parseInt(request.getParameter("idx"));
    String review = request.getParameter("inputReview");
    %><%=review%><%
    sql = "UPDATE change_management SET review = '" + review + "' WHERE idx=" + idx;
    
    try {
        stmt = conn.createStatement();
        stmt.executeUpdate(sql);
        stmt.close();
%><script>
    alert("검토사항 저장 완료");
    opener.parent.location.reload();
    self.close();
</script><%

}catch (Exception e){
%><%=e.toString()%><%
    }
%>