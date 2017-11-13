<%@ page language ="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../dbLogin.jspf"%>
<!DOCTYPE html>
<html lang="ko">
<style type="text/css">
</style>
<%
    int idx = Integer.parseInt(request.getParameter("idx"));
    int count = 0;
    Statement stmt_backup = null;

    ResultSet rs_backup = null;

    String sql_backup = null;
    sql_backup = "SELECT idx, date, time, worker, equipment FROM back_up_plan WHERE back_up_plan.change_idx=" + idx;

    try{
        stmt_backup = conn.createStatement();
        rs_backup = stmt_backup.executeQuery(sql_backup);

%>

<head>
    <title>백업관리</title>
    <%@include file="/common_header.jsp"%>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
        google.charts.load('current', {'packages':['timeline']});
        google.charts.setOnLoadCallback(drawChart1);
        function drawChart1() {
            var container = document.getElementById('gantt1');
            var chart = new google.visualization.Timeline(container);
            var dataTable = new google.visualization.DataTable();

            dataTable.addColumn({ type: 'string', id: 'item' });
            dataTable.addColumn({ type: 'date', id: 'start' });
            dataTable.addColumn({ type: 'date', id: 'end' });

            <%
            while(rs_backup.next()){
                //index, date, time, worker, equipment WHERE back_up_plan.change_idx=
                int index = rs_backup.getInt(1);
                String date = rs_backup.getString(2);
                String time = rs_backup.getString(3);
                String worker = rs_backup.getString(4);
                String equip = rs_backup.getString(5);
            %>
            dataTable.addRows([
                ['<%=index%>',
                    new Date(<%=date.substring(0,4)%>, <%=date.substring(5,7)%>, <%=date.substring(8,10)%>),
                    new Date(<%=date.substring(0,4)%>, <%=date.substring(5,7)%>, <%=date.substring(8,10)%> + 1)]
            ]);
            <%
            }
            rs_backup.first();
            rs_backup.previous();
            %>
            chart.draw(dataTable);
        }
    </script>
</head>
<body>
<!-- 백업 계획-->
<form class="form-horizontal">
    <div class="form-group">
        <label class="col-sm-1 control-label">백업 계획</label>
        <div class="col-sm-7"></div>
        <div class="col-sm-1">
            <a class="btn btn-default"
               onclick="window.open('../worker_popup/worker_backup_add.jsp?idx=<%=idx%>', '백업계획 추가',''); return false;" target="_blank">추가</a>
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-1"></div>
        <div class="col-sm-8">
            <table class="table table-striped">
                <thead>
                <th>번호</th>
                <th>대상</th>
                <th>일자</th>
                <th>시간</th>
                <th>작업자</th>
                <th>장비</th>
                </thead>
                <tbody>
                <%
                    while(rs_backup.next()){
                        //index, date, time, worker, equipment WHERE back_up_plan.change_idx=
                        int index = rs_backup.getInt(1);
                        String date = rs_backup.getString(2);
                        String time = rs_backup.getString(3);
                        String worker = rs_backup.getString(4);
                        String equip = rs_backup.getString(5);
                %>
                <tr>
                    <th><%=index%></th>
                    <td>target</td>
                    <td><%=date%></td>
                    <td><%=time%></td>
                    <td><%=worker%></td>
                    <td><%=equip%></td>
                </tr>
                <%
                            count++;
                        }

                        rs_backup.close();
                        stmt_backup.close();
                    }catch (Exception e2){
                        e2.toString();
                    }
                %>
                </tbody>
            </table>
        </div>
    </div>
    <div class="col-sm-1"></div>
    <div class="col-sm-8" id="gantt1"></div>
    <div class="col-sm-3"></div>
    <div class="col-sm-12"></div>
</form>
<%
    for (int i = 0; i < count ; i++){
%><br><br><br><%
    }
%>
<%@include file="/common_footer.jsp"%>
</body>
</html>