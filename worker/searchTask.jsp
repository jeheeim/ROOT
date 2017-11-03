<%@ page language ="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../dbLogin.jspf"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>업무검색</title>
<%@include file="/common_header.jsp"%>
</head>
<%
    int idx = Integer.parseInt(request.getParameter("idx"));
    try{
        stmt = conn.createStatement();

        sql = "SELECT title, reception_path, customer, registration_date, deadline, "
                + "problem_scope, urgency, priority, content, IFNULL(action_details,'내용없음'), status FROM incident_management WHERE incident_management.index=" + idx;
        rs = stmt.executeQuery(sql);

        if(rs.next()){
            String title = rs.getString(1);
            int reception_path = rs.getInt(2);
            int customer = rs.getInt(3);
            String registration_data = rs.getString(4);
            String deadline = rs.getString(5);
            int problem_scope = rs.getInt(6);
            int urgency = rs.getInt(7);
            int priority = rs.getInt(8);
            String content = rs.getString(9);
            String action_details = rs.getString(10);
            int status = rs.getInt(11);

%>
<body>
<div class="form-group">
    <select class="form-control" name="inputClient_depart" style="width: 100%;">
        <%
            while (rs.next()){
        %><option value="<%%>"><%%></option><%
            }
        %>
    </select>
    <button type="submit" class="btn btn-default">검색</button>
</div>
    <%@include file="/common_footer.jsp"%>
</body>
<%
        }
    }catch (Exception e){
    }
%>
</html>