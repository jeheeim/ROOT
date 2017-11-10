<%@ page language ="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../dbLogin.jspf"%>
<!DOCTYPE html>
<html lang="ko">
<style type="text/css">
    wall{
        min-height:20px;
        padding:19px;
        margin-bottom:20px;
        background-color:#d0d0d0;
        border:1px solid #e3e3e3;
        border-radius:4px;
        -webkit-box-shadow:inset 0 1px 1px rgba(0,0,0,.05);
        box-shadow:inset 0 1px 1px rgba(0,0,0,.05)
    }
</style>
<%
    int idx = Integer.parseInt(request.getParameter("idx"));
    Statement stmt_backup = null;
    Statement stmt_work = null;
    Statement stmt_test = null;
    Statement stmt_recovery = null;

    ResultSet rs_backup = null;
    ResultSet rs_work = null;
    ResultSet rs_test = null;
    ResultSet rs_recovery = null;

    String sql_backup = null;
    String sql_work = null;
    String sql_test = null;
    String sql_recovery = null;

    try{


        sql = "SELECT status FROM incident_management WHERE incident_management.index=" + idx;
        sql_backup = "SELECT idx, date, time, worker, equipment FROM back_up_plan WHERE back_up_plan.change_idx=" + idx;
        sql_work = "SELECT idx, summary, date, worker, remark FROM work_plan WHERE work_plan.change_idx="+idx;
        sql_test = "SELECT idx, date, manager, remark, test_case, expected_result FROM test_plan WHERE test_plan.change_idx="+idx;
        sql_recovery = "SELECT idx, target, time, worker, remark FROM recovery_plan WHERE recovery_plan.change_idx="+idx;

%>

<head>
    <title>변경관리</title>
    <%@include file="/common_header.jsp"%>
    <script>
        var observe;
        if (window.attachEvent)
        {
            observe = function (element, event, handler)
            {
                element.attachEvent('on'+event, handler);
            };
        }
        else
        {
            observe = function (element, event, handler)
            {
                element.addEventListener(event, handler, false);
            };
        }
        function init ()
        {
            var text = document.getElementById('text');
            function resize ()
            {
                text.style.height = 'auto';
                text.style.height = text.scrollHeight+'px';
            }
            /* 0-timeout to get the already changed text */

            function delayedResize ()
            {
                window.setTimeout(resize, 0);
            }

            observe(text, 'change',  resize);
            observe(text, 'cut',     delayedResize);
            observe(text, 'paste',   delayedResize);
            observe(text, 'drop',    delayedResize);
            observe(text, 'keydown', delayedResize);

            text.focus();
            text.select();
            resize();
        }
    </script>
</head>
<body onload="init();">
    <!-- 백업 계획-->
    <form class="form-horizontal">
        <div class="form-group">
            <label class="col-sm-1 control-label">백업 계획</label>
            <div class="col-sm-7"></div>
            <div class="col-sm-1">
                <a class="btn btn-default"
                   onclick="window.open('../worker_popup/worker_backup_add.jsp', '백업계획 추가',''); return false;" target="_blank">추가</a>
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
                        try{
                            stmt_backup = conn.createStatement();
                            rs_backup = stmt_backup.executeQuery(sql_backup);
                        while(rs_backup.next()){
                            //index, date, time, worker, equipment WHERE back_up_plan.change_idx=
                            int index = rs_backup.getInt(1);
                            String date = "0";//rs_backup.getString(2);
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
    </form>
    <!--작업 일정 시작-->
    <form class="form-horizontal">
    <div class="form-group">
        <label class="col-sm-1 control-label">작업일정</label>
        <div class="col-sm-7"></div>
        <div class="col-sm-1">
            <a class="btn btn-default"
               onclick="window.open('../worker_popup/worker_workplan_add.jsp', '작업일정 추가',''); return false;" target="_blank">추가</a>
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
                    try{
                        stmt_work = conn.createStatement();
                        rs_work = stmt_work.executeQuery(sql_work);
                    while(rs_work.next()){
                        //index, summary, date, worker, remark
                %>
                <tr>
                    <th><%=rs_work.getInt(1)%></th>
                    <td>Sample target</td>
                    <td>Sample date</td>
                    <td><%=rs_work.getString(4)%></td>
                    <td><%=rs_work.getString(5)%></td>
                </tr>
                <%
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
    </form>
    <!--작업 일정 끝-->
    <!--테스트 계획 시작-->
<form class="form-horizontal">
    <div class="form-group">
        <label class="col-sm-1 control-label">테스트 계획</label>
        <div class="col-sm-7"></div>
        <div class="col-sm-1">
            <a class="btn btn-default"
               onclick="window.open('../worker_popup/worker_testplan_add.jsp', '테스트계획 추가',''); return false;" target="_blank">추가</a>
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
            try{
                stmt_test = conn.createStatement();
                rs_test = stmt_test.executeQuery(sql_test);
            while (rs_test.next()){
                //index, date, manager, remark, test_case, expected_result
        %>
        <tr>
            <th><%=rs_test.getInt(1)%></th>
            <td>Sample date</td>
            <td><%=rs_test.getString(3)%></td>
            <td><%=rs_test.getString(4)%></td>
            <td><%=rs_test.getString(5)%></td>
            <td><%=rs_test.getString(6)%></td>
        </tr>
        <%
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
    <!--테스트 계획 끝-->
    <!--복구 계획 시작-->
<form class="form-horizontal">
    <div class="form-group">
        <label class="col-sm-1 control-label">복구 계획</label>
        <div class="col-sm-7"></div>
        <div class="col-sm-1">
            <a class="btn btn-default"
               onclick="window.open('../worker_popup/worker_recovery_add.jsp', '복구 계획 추가',''); return false;" target="_blank">추가</a>
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
                    try{
                        stmt_recovery = conn.createStatement();
                        rs_recovery = stmt_recovery.executeQuery(sql_recovery);
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
    <!--복구 계획 끝-->
    <!--검토사항 시작-->
<form class="form-horizontal">
    <div class="form-group">
        <label for="inputReview" class="col-sm-1 control-label">검토사항</label>
    </div>
    <div class="form-group">
        <div class="col-sm-1"></div>
        <div class="col-sm-8">
            <div class="well well-sm">검토사항 내용을 넣으면 됩니다.</div>
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-1"></div>
        <%
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);
            if(rs.next()){
                int status = rs.getInt(1);
                switch (status){
                case 0:
                case 1:
                    break;
                case 2:
                    %><button type="submit" class="btn btn-default">다음단계<%=status%></button><%
                    break;
                case 3:
                    %><button type="submit" class="btn btn-default">완료</button><%
        }
        }%>
    </div>
</form>
    <!--검토사항 끝-->
<%@include file="/common_footer.jsp"%>
</body>
<%
}catch (SQLException e){
        e.toString();
}%>
</html>