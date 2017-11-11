<%@ page language ="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../dbLogin.jspf"%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<title>인시던트</title>
	<%@include file="/common_header.jsp"%>
</head>
<%
	int param = 0;
	int index = 0;

	String title = "";
	String client_name = "";
	
	int reception_path = 0;
	String route = "";
	
	String receptionist = "";
	String registration_date = "";
	String deadline = "";
	
	int problem_scope_value = 0;
	String problem_scope = "";
	
	int urgency_value = 0;
	String urgency = "";

	int priority_value = 0;
	String priority = "";
	
	String content = "";
	String action_details = "";
	int status = 0;
	
	
	
	param = Integer.parseInt(request.getParameter("param"));

	try{
		stmt = conn.createStatement();

		sql = "SELECT kms.kms_index, title, client.name, reception_path, receptionist, registration_date, deadline, problem_scope, urgency, priority, content, IFNULL(action_details,'내용없음'), "
			+ "status FROM incident_management "
			+ "LEFT JOIN kms ON incident_management.idx=kms.incident_index "
			+ "LEFT JOIN account as client ON incident_management.customer=client.idx "
			+ "WHERE incident_management.idx=" + param;
		rs = stmt.executeQuery(sql);

		if(rs.next()){
			index = rs.getInt(1);
			title = rs.getString(2);
			client_name = rs.getString(3);
			reception_path = rs.getInt(4);
			receptionist = rs.getString(5);
			registration_date = rs.getString(6);
			deadline = rs.getString(7);
			problem_scope_value = rs.getInt(8);
			urgency_value = rs.getInt(9);
			priority_value = rs.getInt(10);
			content = rs.getString(11);
			action_details = rs.getString(12);
			status = rs.getInt(13);

			route = "";

			switch(reception_path)
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
				route = "시스템";
				break;
			}

			switch(problem_scope_value)
			{
			case 1:
				problem_scope = "전 회사";
				break;
			case 2:
				problem_scope = "부서";
				break;
			case 3:
				problem_scope = "개인";
				break;
			}

			switch(urgency_value)
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

			switch(priority_value)
			{
			case 1:
				priority = "상";
				break;
			case 2:
				priority = "중";
				break;
			case 3:
				priority = "하";
				break;
			}

%>
<body>
	<form class="form-horizontal">
		<div class="form-group">
			<label class="col-sm-1 control-label">번호</label>
			<div class="col-sm-2">
				<div class="well well-sm"><%=index%></div>
			</div>
			<label class="col-sm-1 control-label">제목</label>
			<div class="col-sm-5">
				<div class="well well-sm"><%=title%></div>
			</div>
		</div>

		<div class="form-group">
			<label class="col-sm-1 control-label">고객</label>
			<div class="col-sm-2">
				<div class="well well-sm"><%=client_name%></div>
			</div>
			<label class="col-sm-1 control-label">접수경로</label>
			<div class="col-sm-2">
				<div class="well well-sm"><%=route%></div>
			</div>

			<label class="col-sm-1 control-label">접수자</label>
			<div class="col-sm-2">
				<div class="well well-sm"><%=client_name%></div>
			</div>
		</div>

		<div class="form-group">
			<label class="col-sm-1 control-label">요청일시</label>
			<div class="col-sm-2">
				<div class="well well-sm"><%=registration_date%></div>
			</div>
			<div class="col-sm-3"></div>
			<label class="col-sm-1 control-label">목표기한</label>
			<div class="col-sm-2">
				<div class="well well-sm"><%=deadline%></div>
			</div>
		</div>

		<div class="form-group">
			<label class="col-sm-1 control-label">문제범위</label>
			<div class="col-sm-2">
				<div class="well well-sm"><%=problem_scope%></div>
			</div>
			<label class="col-sm-1 control-label">긴급도</label>
			<div class="col-sm-2">
				<div class="well well-sm"><%=urgency%></div>
			</div>
			<label class="col-sm-1 control-label">우선순위</label>
			<div class="col-sm-2">
				<div class="well well-sm"><%=priority%></div>
			</div>
		</div>

		<div class="form-group">
			<label class="col-sm-1 control-label">내용</label>
			<div class="col-sm-8">
				<div class="well well-sm"><%=content%></div>
			</div>
		</div>

		<div class="form-group">
			<label class="col-sm-1 control-label">담당자 의견</label>
			<div class="col-sm-8">
				<div class="well well-sm"><%=action_details%></div>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-1"></div>
		<% switch(status){
		    case 0:
		%>
			<a class="btn btn-default"
			   href="/worker/submitToIncident.jsp?idx=<%=param%>">작업시작</a><%
			break;
			case 1:
		        %>
				<button type="submit" class="btn btn-default">수정</button>
				<a class="btn btn-default"
			   onclick="window.open('/worker/incidentToComplete.jsp?idx=<%=param%>', '작업완료로 변경',''); return false;" target="_blank">작업완료</a>
				<a class="btn btn-default"
			   onclick="window.open('/worker/incidentToComplete.jsp?idx=<%=param%>', '변경관리로 변경',''); return false;" target="_blank">변경이관</a>
				<%
			break;
		}%>
		</div>
	</form>
	<%@include file="/common_footer.jsp"%>
</body>
<%
		}
	}
	catch (SQLException sqle) { out.println(sqle.toString()); }
	catch (Exception e) { out.println(e.toString()); }
%>
</html>