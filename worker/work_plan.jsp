<%@ page language ="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../dbLogin.jspf"%>
<!DOCTYPE html>
<html lang="ko">
<style type="text/css">
</style>
<%
    int idx = Integer.parseInt(request.getParameter("idx"));
    int count = 0;
    Statement stmt_work = null;

    ResultSet rs_work = null;

    String sql_work = null;

    try{
        sql_work = "SELECT idx, summary, date, worker, remark FROM work_plan WHERE work_plan.change_idx="+idx;
        stmt_work = conn.createStatement();
        rs_work = stmt_work.executeQuery(sql_work);
%>

<head>
    <title>변경관리</title>
    <%@include file="/common_header.jsp"%>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
        google.charts.load('current', {'packages':['timeline']});
        google.charts.setOnLoadCallback(drawChart2);
        function drawChart2() {
            var container = document.getElementById('gantt2');
            var chart = new google.visualization.Timeline(container);
            var dataTable = new google.visualization.DataTable();

            dataTable.addColumn({ type: 'string', id: 'item' });
            dataTable.addColumn({ type: 'date', id: 'start' });
            dataTable.addColumn({ type: 'date', id: 'end' });

            <%

            while(rs_work.next()){
            //index, summary, date, worker, remark
                int index = rs_work.getInt(1);
                String summary = rs_work.getString(2);
                String date = rs_work.getString(3);
                String worker = rs_work.getString(4);
                String remark = rs_work.getString(5);
            %>
            dataTable.addRows([
                ['<%=index%>',
                    new Date(<%=date.substring(0,4)%>, <%=Integer.parseInt(date.substring(5,7)) - 1%>, <%=date.substring(8,10)%>,
                        <%=Integer.parseInt(date.substring(11,13))%>, <%=date.substring(14,16)%>, <%=date.substring(17,19)%>),
                    new Date(<%=date.substring(0,4)%>, <%=Integer.parseInt(date.substring(5,7)) - 1%>, <%=date.substring(8,10)%>,
                        <%=Integer.parseInt(date.substring(11,13))+1%>, <%=date.substring(14,16)%>, <%=date.substring(17,19)%>)]
            ]);
            <%
            }
            rs_work.first();
            rs_work.previous();
            %>
            chart.draw(dataTable);
        }
    </script>
</head>
<body>
<form class="form-horizontal">
    <div class="form-group">
        <label class="col-sm-1 control-label">작업일정</label>
        <div class="col-sm-7"></div>
        <div class="col-sm-1">
            <a class="btn btn-default"
               onclick="window.open('../worker_popup/worker_workplan_add.jsp?idx=<%=idx%>', '작업일정 추가',''); return false;" target="_blank">추가</a>
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-1"></div>
        <div class="col-sm-8">
            <table class="table table-striped">
                <thead>
                <tr>
                    <th>번호</th>
                    <th>구분</th>
                    <th>일시</th>
                    <th>작업자</th>
                    <th>비고</th>
                </tr>
                </thead>
                <tbody>
                <%
                    while(rs_work.next()){
                        //index, summary, date, worker, remark
                %>
                <tr>
                    <th><%=rs_work.getInt(1)%></th>
                    <td><%=rs_work.getString(2)%></td>
                    <td><%=rs_work.getString(3)%></td>
                    <td><%=rs_work.getString(4)%></td>
                    <td><%=rs_work.getString(5)%></td>
                </tr>
                <%
                            count++;
                        }
                        rs_work.close();
                        stmt_work.close();
                    }catch (Exception e3){
                        e3.toString();
                    }
                %>


                </tbody>
            </table>
        </div>
    </div>
    <div class="col-sm-1"></div>
    <div class="col-sm-8" id="gantt2"></div>
    <div class="col-sm-3"></div>
    <div class="col-sm-12"></div>
    <%
        for(int i = 0; i < count ; i++){
    %><br><br><br><%
    }
%>
</form>

<%@include file="/common_footer.jsp"%>
</body>
</html>