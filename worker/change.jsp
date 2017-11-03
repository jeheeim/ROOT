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
    try{
        stmt = conn.createStatement();

        sql = "SELECT status FROM incident_management WHERE incident_management.index=" + idx;
        rs = stmt.executeQuery(sql);

        if(rs.next()){
            int status = rs.getInt(1);
%>
<!--
well{
	min-height:20px;
	padding:19px;
	margin-bottom:20px;
	background-color:#f5f5f5;
	border:1px solid #e3e3e3;
	border-radius:4px;
	-webkit-box-shadow:inset 0 1px 1px rgba(0,0,0,.05);
	box-shadow:inset 0 1px 1px rgba(0,0,0,.05)
}
.well blockquote{
	border-color:#ddd;
	border-color:rgba(0,0,0,.15)
}
.well-lg{
	padding:24px;
	border-radius:6px
}.well-sm{
	padding:9px;
	border-radius:3px
}
-->
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
                    <tr>
                        <th>No.SP</th>
                        <td>Sample Target</td>
                        <td>Sample Date</td>
                        <td>Sample Time</td>
                        <td>Sample Worker</td>
                        <td>Sample Equipment</td>
                    </tr>
                    <tr>
                        <th>No.SP</th>
                        <td>Sample Target</td>
                        <td>Sample Date</td>
                        <td>Sample Time</td>
                        <td>Sample Worker</td>
                        <td>Sample Equipment</td>
                    </tr>
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
                <tr>
                    <th>No. Sp</th>
                    <td>Sample target</td>
                    <td>Sample Time</td>
                    <td>Sample Worker</td>
                    <td>Sample Note</td>
                </tr>
                <tr>
                    <th>No. Sp</th>
                    <td>Sample target</td>
                    <td>Sample Time</td>
                    <td>Sample Worker</td>
                    <td>Sample Note</td>
                </tr>
                <tr>
                    <th>No. Sp</th>
                    <td>Sample target</td>
                    <td>Sample Date</td>
                    <td>Sample Worker</td>
                    <td>Sample Note</td>
                </tr>
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
        <tr>
            <th>No.Sp</th>
            <td>Sample Date</td>
            <td>Sample Worker</td>
            <td>Sample Note</td>
            <td>Sample Case</td>
            <td>Sample Result</td>
        </tr>
        <tr>
            <th>No.Sp</th>
            <td>Sample Date</td>
            <td>Sample Worker</td>
            <td>Sample Note</td>
            <td>Sample Case</td>
            <td>Sample Result</td>
        </tr>
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
                    <tr>
                        <td>No.Sp</td>
                        <td>S Target</td>
                        <td>S Time</td>
                        <td>S Worker</td>
                        <td>S Note</td>
                    </tr>
                    <tr>
                        <td>No.Sp</td>
                        <td>S Target</td>
                        <td>S Time</td>
                        <td>S Worker</td>
                        <td>S Note</td>
                    </tr>
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
        <%switch (status){
            case 0:
            case 1:
                break;
            case 2:
                %><button type="submit" class="btn btn-default">다음단계</button><%
                break;
            case 3:
                %><button type="submit" class="btn btn-default">완료</button><%
        }%>
    </div>
</form>
    <!--검토사항 끝-->
<%@include file="/common_footer.jsp"%>
</body>
<%  }//if
}catch (Exception e){
}%>
</html>