<%@ page language ="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../dbLogin.jspf"%>
<!DOCTYPE html>
<html lang="ko">
<style type="text/css">
</style>
<%
    int idx = Integer.parseInt(request.getParameter("idx"));
    int count = 0;
    Statement stmt_recovery = null;

    ResultSet rs_recovery = null;

    String sql_recovery = null;

    try{
        sql_recovery = "SELECT idx, target, time, worker, remark, date FROM recovery_plan WHERE recovery_plan.change_idx="+idx;

        stmt_recovery = conn.createStatement();
        rs_recovery = stmt_recovery.executeQuery(sql_recovery);
%>

<head>
    <title>복구계획</title>
    <%@include file="/common_header.jsp"%>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
        google.charts.load('current', {'packages':['timeline']});
        google.charts.setOnLoadCallback(drawChart4);
        function drawChart4() {
            var container = document.getElementById('gantt4');
            var chart = new google.visualization.Timeline(container);
            var dataTable = new google.visualization.DataTable();

            dataTable.addColumn({ type: 'string', id: 'item' });
            dataTable.addColumn({ type: 'date', id: 'start' });
            dataTable.addColumn({ type: 'date', id: 'end' });

            <%
            while(rs_recovery.next()){
                        //index, target, time, worker, remark, date
                int index = rs_recovery.getInt(1);
                String target = rs_recovery.getString(2);
                String time = rs_recovery.getString(3);
                String worker = rs_recovery.getString(4);
                String remark = rs_recovery.getString(5);
                String date = rs_recovery.getString(6);
            %>
            dataTable.addRows([
                ['<%=index%>',
                    new Date(<%=date.substring(0,4)%>, <%=Integer.parseInt(date.substring(5,7)) - 1%>, <%=date.substring(8,10)%>,
                        <%=Integer.parseInt(date.substring(11,13))%>, <%=date.substring(14,16)%>, <%=date.substring(17,19)%>),
                    new Date(<%=date.substring(0,4)%>, <%=Integer.parseInt(date.substring(5,7)) - 1%>, <%=date.substring(8,10)%>,
                        <%=Integer.parseInt(date.substring(11,13)) + Integer.parseInt(time)%>, <%=date.substring(14,16)%>, <%=date.substring(17,19)%>)]
            ]);
            <%
            }
            rs_recovery.first();
            rs_recovery.previous();
            %>
            chart.draw(dataTable);
        }
    </script>
</head>
<body>
<form class="form-horizontal">
    <div class="form-group">
        <label class="col-sm-1 control-label">복구 계획</label>
        <div class="col-sm-7"></div>
        <div class="col-sm-1">
            <a class="btn btn-default"
               onclick="window.open('../worker_popup/worker_recovery_add.jsp?idx=<%=idx%>', '복구 계획 추가',''); return false;" target="_blank">추가</a>
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-1"></div>
        <div class="col-sm-8">
            <table class="table table-striped">
                <thead>
                <tr>
                    <th>번호</th>
                    <th>복구대상</th>
                    <th>복구시간</th>
                    <th>작업자</th>
                    <th>비고</th>
                </tr>
                </thead>
                <tbody>
                <%
                    while(rs_recovery.next()){
                        //index, target, time, worker, remark
                %>
                <tr>
                    <td><%=rs_recovery.getInt(1)%></td>
                    <td><%=rs_recovery.getString(2)%></td>
                    <td><%=rs_recovery.getString(3)%></td>
                    <td><%=rs_recovery.getString(4)%></td>
                    <td><%=rs_recovery.getString(5)%></td>
                </tr>
                <%
                            count++;
                        }
                        rs_recovery.close();
                        stmt_recovery.close();
                    }catch (Exception e5){
                        e5.toString();
                    }
                %>
                </tbody>
            </table>
        </div>
    </div>
</form>
<div class="col-sm-1"></div>
<div class="col-sm-8" id="gantt4"></div>
<div class="col-sm-3"></div>
<div class="col-sm-12"></div>
<%
    for(int i = 0; i < count; i++){
%><br><br><br><%
    }
%>
<%@include file="/common_footer.jsp"%>
</body>
</html>