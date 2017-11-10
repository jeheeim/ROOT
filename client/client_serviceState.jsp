<%@ page language ="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../dbLogin.jspf"%>

<%
int param = Integer.parseInt(request.getParameter("param"));

int index = 0;
int incident_index = 0;
int change_index = 0;

String title = "";
int statusNum = 0;
String status = "";
String client_name = "";
String client_company = "";
String client_rank = "";
String client_phone = "";

int routeNum = 0;
String route = "";

int problem_scope = 0;
String problem_range = "";

int urgencyNum = 0;
String urgency = "";

int priority = 0;

String workerName = "";
String workerDept = "";
String workerRank = "";
String workerPhone = "";

String problemDetail = "";
String comment = "";

String regi_date = "";
String deadline = "";
String startdate = "";
String end_date = "";

String result = "";

try
{
	stmt = conn.createStatement();
	sql = "SELECT kms_index, incident_index, change_index, inci.title, inci.status, clients.name, clientCompany.companyName as clientCompany, "
		+ "clients.rank, clients.phone, inci.reception_path, inci.problem_scope, inci.urgency, inci.priority, worker.name, worker_dept.department, "
		+ "worker.rank, worker.phone, inci.content, inci.receptionist_opion, inci.registration_date, inci.deadline, inci.start_date, inci.end_date, "
		+ "inci.action_details FROM kms "
		+ "LEFT JOIN incident_management as inci ON incident_index=inci.idx "
		+ "LEFT JOIN account as clients ON inci.customer=clients.idx "
		+ "LEFT JOIN company as clientCompany ON clients.company_name=clientCompany.idx "
		+ "LEFT JOIN account as worker ON kms.workerIdx=worker.idx "
		+ "LEFT JOIN company_department as worker_dept ON worker.department=worker_dept.idx "
		+ "WHERE kms_index=" + param;
	rs = stmt.executeQuery(sql);

	if(rs.next())
	{
		index = rs.getInt(1);

		incident_index = rs.getInt(2);
		change_index = rs.getInt(3);

		title = rs.getString(4);
		statusNum = rs.getInt(5);

		client_name = rs.getString(6);
		client_company = rs.getString(7);
		client_rank = rs.getString(8);
		client_phone = rs.getString(9);

		routeNum = rs.getInt(10);

		problem_scope = rs.getInt(11);
		urgencyNum = rs.getInt(12);
		priority = rs.getInt(13);

		workerName = rs.getString(14);
		if(workerName == null)
		{
			workerName = "(미배정)";
		}

		workerDept = rs.getString(15);
		if(workerDept == null)
		{
			workerDept = "(미배정)";
		}

		workerRank = rs.getString(16);
		if(workerRank == null)
		{
			workerRank = "(미배정)";
		}

		workerPhone = rs.getString(17);
		if(workerPhone == null)
		{
			workerPhone = "(미배정)";
		}

		problemDetail = rs.getString(18);
		comment = rs.getString(19);
		if(comment == null)
		{
			comment = "아직 접수되지 않았습니다.";
		}

		regi_date = rs.getString(20);
		if(regi_date == null)
		{
			regi_date = "";
		}

		deadline = rs.getString(21);
		if(deadline == null)
		{
			deadline = "";
		}

		startdate = rs.getString(22);
		if(startdate == null)
		{
			startdate = "";
		}

		end_date = rs.getString(23);
		if(end_date == null)
		{
			end_date = "";
		}

		result = rs.getString(24);
		if(result == null)
		{
			result = "";
		}
	}

	switch(statusNum)
	{
	case 0:
		status = "신규";
		break;
	case 1:
		status = "접수";
		break;
	case 2:
		status = "인시던트";
		break;
	case 3:
		status = "변경관리";
		break;
	case 4:
		status = "릴리즈관리";
		break;
	case 5:
		status = "완료";
		break;
	}
	
	switch(routeNum)
	{
	case 1:
		route = "전화";
		break;
	case 2:
		route = "회의";
		break;
	case 3:
		route = "이메일";
		break;
	case 4:
		route = "기타";
		break;
	case 5:
		route = "온라인";
		break;
	}
	
	switch(problem_scope)
	{
	case 1:
		problem_range = "전 회사";
		break;
	case 2:
		problem_range = "부서";
		break;
	case 3:
		problem_range = "개인";
		break;
	}
	
	switch(urgencyNum)
	{
	case 1:
		urgency = "긴급";
		break;
	case 2:
		urgency = "중요";
		break;
	case 3:
		urgency = "경미";
		break;
	}

}
catch(SQLException sqle)
{
	out.println(sqle.toString());
}
%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<title>Service Detail</title>
	<%@ include file="../common_header.jsp"%>
</head>

<body>
	<form class="form-horizontal">
		<div class="form-group">
			<label for="inputNumber" class="col-sm-1 control-label">번호</label>
			<div class="col-sm-2">
				<p><%=index%></p>
			</div>
		
			<label for="inputTitle" class="col-sm-1 control-label">제목</label>
			<div class="col-sm-5">
				<p><%=title%></p>
			</div>
		
			<label for="inputState" class="col-sm-1 control-label">상태</label>
			<div class="col-sm-2">
				<p><%=status%></p>
			</div>
		</div>

		<div class="form-group">
			<label for="inputClient" class="col-sm-1 control-label">요청자</label>
			<div class="col-sm-2">
				<p><%=client_name%></p>
			</div>

			<label for="inputClient_Company" class="col-sm-1 control-label">고객사</label>
			<div class="col-sm-2">
				<p><%=client_company%></p>
			</div>

			<label for="inputClient_rank" class="col-sm-1 control-label">직급</label>
			<div class="col-sm-2">
				<p><%=client_rank%></p>
			</div>

			<label for="inputPhone" class="col-sm-1 control-label">연락처</label>
			<div class="col-sm-2">
				<p><%=client_phone%></p>
			</div>
		</div>

		<div class="form-group">
			<label for="inputRoot" class="col-sm-1 control-label">접수경로</label>
			<div class="col-sm-2">
				<p><%=route%></p>
			</div>
			<label for="inputRange" class="col-sm-1 control-label">문제범위</label>
			<div class="col-sm-2">
				<p><%=problem_range%></p>
			</div>

			<label for="inputEmergency" class="col-sm-1 control-label">긴급도</label>
			<div class="col-sm-2">
				<p><%=urgency%></p>
			</div>

			<label for="inputPriority" class="col-sm-1 control-label">우선순위</label>
			<div class="col-sm-2">
				<p><%=priority%></p>
			</div>
		</div>

		<div class="form-group">
			<label for="inputWorker" class="col-sm-1 control-label">담당자</label>
			<div class="col-sm-2">
				<p><%=workerName%></p>
			</div>

			<label for="inputWorker_depart" class="col-sm-1 control-label">소속</label>
			<div class="col-sm-2">
				<p><%=workerDept%></p>
			</div>

			<label for="inputWorker_rank" class="col-sm-1 control-label">직급</label>
			<div class="col-sm-2">
				<p><%=workerRank%></p>
			</div>

			<label for="inputWorker_Phone" class="col-sm-1 control-label">연락처</label>
			<div class="col-sm-2">
				<p><%=workerPhone%></p>
			</div>
		</div>

		<div class="form-group">
			<label for="inputDeatail" class="col-sm-1 control-label">내용</label>
			<div class="col-sm-11">
				<textarea name = "detail" class="form-control" rows="5" placeholder="내용을 입력해주세요" readonly style="resize:vertical;"><%=problemDetail%></textarea>
			</div>
		</div>

		<div class="form-group">
			<label for="inputComment" class="col-sm-1 control-label">접수자 의견</label>
			<div class="col-sm-11">
				<textarea name = "comment" class="form-control" rows="3" placeholder="접수자의 의견이 들어갑니다." readonly style="resize:vertical;"><%=comment%></textarea>
			</div>
		</div>

		<div class="form-group">
			<label for="inputDate_regist1" class="col-sm-1 control-label">등록일자</label>
			<div class="col-sm-2">
				<input type="date" class="form-control" id="inputDate_regist" value="<%=regi_date%>">
			</div>

			<label for="inputDate_deadline1" class="col-sm-1 control-label">기한일자</label>
			<div class="col-sm-2">
				<input type="date" class="form-control" id="inputDate_deadline1" value="<%=deadline%>">
			</div>

			<label for="inputDate_accept1" class="col-sm-1 control-label">접수일자</label>
			<div class="col-sm-2">
				<input type="date" class="form-control" id="inputDate_accept1" value="<%=startdate%>">
			</div>

			<label for="inputDate_complete1" class="col-sm-1 control-label">완료일자</label>
			<div class="col-sm-2">
				<input type="date" class="form-control" id="inputDate_complete" value="<%=end_date%>">
			</div>
		</div>

		<div class="form-group">
			<label for="inputResult" class="col-sm-1 control-label">조치내역</label>
			<div class="col-sm-11">
				<textarea name = "result" class="form-control" rows="3" placeholder="결과 내용" readonly style="resize:vertical;"><%=result%></textarea>
			</div>
		</div>

		<div class="form-group">
			<div class="col-sm-1"></div>
			<div class="col-sm-1">
				<button class="btn btn-default" type="submit">목록으로</button>
			</div>
		</div>
	</form>

	<%@ include file="../common_footer.jsp"%>
</body>
</html>