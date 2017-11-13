<%@ page language ="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../dbLogin.jspf"%>
<!DOCTYPE html>
<html lang="ko">
<style type="text/css">
</style>
<%
    int idx = Integer.parseInt(request.getParameter("idx"));
    int count = 0;
    Statement stmt_test = null;

    ResultSet rs_test = null;

    String sql_test = null;

    try{
        sql_test = "SELECT idx, date, manager, remark, test_case, expected_result FROM test_plan WHERE test_plan.change_idx="+idx;
        stmt_test = conn.createStatement();
        rs_test = stmt_test.executeQuery(sql_test);
%>

<head>
    <title>변경관리</title>
    <%@include file="/common_header.jsp"%>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
        google.charts.load('current', {'packages':['timeline']});
        google.charts.setOnLoadCallback(drawChart3);
        function drawChart3() {
            var container = document.getElementById('gantt3');
            var chart = new google.visualization.Timeline(container);
            var dataTable = new google.visualization.DataTable();

            dataTable.addColumn({ type: 'string', id: 'item' });
            dataTable.addColumn({ type: 'date', id: 'start' });
            dataTable.addColumn({ type: 'date', id: 'end' });

            <%

            while (rs_test.next()){
                //index, date, manager, remark, test_case, expected_result
                int index = rs_test.getInt(1);
                String date =rs_test.getString(2);
                String manager = rs_test.getString(3);
                String remark = rs_test.getString(4);
                String test_case = rs_test.getString(5);
                String expected_result = rs_test.getString(6);
            %>
            dataTable.addRows([
                ['<%=index%>',
                    new Date(<%=date.substring(0,4)%>, <%=date.substring(5,7)%>, <%=date.substring(8,10)%>),
                    new Date(<%=date.substring(0,4)%>, <%=date.substring(5,7)%>, <%=date.substring(8,10)%> + 1)]
            ]);
            <%
            }
            rs_test.first();
            rs_test.previous();
            %>
            chart.draw(dataTable);
        }
    </script>
</head>
<body>
<form class="form-horizontal">
    <div class="form-group">
        <label class="col-sm-1 control-label">테스트 계획</label>
        <div class="col-sm-7"></div>
        <div class="col-sm-1">
            <a class="btn btn-default"
               onclick="window.open('../worker_popup/worker_testplan_add.jsp?idx=<%=idx%>', '테스트계획 추가',''); return false;" target="_blank">추가</a>
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-1"></div>
        <div class="col-sm-8">
            <table class="table table-striped">
                <thead>
                <th>번호</th>
                <th>계획일자</th>
                <th>담당자</th>
                <th>비고</th>
                <th>테스트 케이스</th>
                <th>예상결과</th>
                </thead>
                <tbody>
                <%
                    while (rs_test.next()){
                        //index, date, manager, remark, test_case, expected_result
                %>
                <tr>
                    <th><%=rs_test.getInt(1)%></th>
                    <td><%=rs_test.getString(2)%></td>
                    <td><%=rs_test.getString(3)%></td>
                    <td><%=rs_test.getString(4)%></td>
                    <td><%=rs_test.getString(5)%></td>
                    <td><%=rs_test.getString(6)%></td>
                </tr>
                <%
                            count++;
                        }
                        rs_test.close();
                        stmt_test.close();
                    }catch (Exception e4){
                        e4.toString();
                    }
                %>

                </tbody>
            </table>
        </div>
    </div>
</form>
<div class="col-sm-1"></div>
<div class="col-sm-8" id="gantt3"></div>
<div class="col-sm-3"></div>
<div class="col-sm-12"></div>
<%
    for(int i = 0; i < count ; i++){
%><br><br><br><%
    }
%>
<%@include file="/common_footer.jsp"%>
</body>
</html>