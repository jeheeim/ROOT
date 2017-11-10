<%@ page language ="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../dbLogin.jspf"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>인시던트</title>
	<%@include file="/common_header.jsp"%>
</head>
<%
	int idx = Integer.parseInt(request.getParameter("idx"));
	try{
		stmt = conn.createStatement();

		sql = "SELECT title, reception_path, customer, registration_date, deadline, "
		+ "problem_scope, urgency, priority, content, IFNULL(action_details,'내용없음'), status FROM incident_management WHERE incident_management.idx=" + idx;
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
<body onload="init();">
	<form class="form-horizontal">
		<div class="form-group">
			<label class="col-sm-1 control-label">번호</label>
			<div class="col-sm-2">
				<div class="well well-sm"><%=idx%></div>
			</div>
			<label class="col-sm-1 control-label">제목</label>
			<div class="col-sm-5">
				<div class="well well-sm"><%=title%></div>
			</div>
		</div>

		<div class="form-group">
			<label class="col-sm-1 control-label">고객</label>
			<div class="col-sm-2">
				<div class="well well-sm">...</div>
			</div>
			<label class="col-sm-1 control-label">접수경로</label>
			<div class="col-sm-2">
				<div class="well well-sm">
					<%switch (reception_path){
						case 1:
						    %>전화<%
						    break;
						case 2:
						    %>회의<%
						    break;
						case 3:
						    %>이메일<%
						    break;
						case 4:
						    %>기타<%
						    break;
					}
					%>
				</div>
			</div>

			<label class="col-sm-1 control-label">접수자</label>
			<div class="col-sm-2">
				<div class="well well-sm"><%=customer%></div>
			</div>
		</div>

		<div class="form-group">
			<label class="col-sm-1 control-label">요청일시</label>
			<div class="col-sm-2">
				<div class="well well-sm"><%=registration_data%></div>
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
		<%switch(status){
		    case 0:
		%>
			<a class="btn btn-default"
			   onclick="window.open('submitToIncident.jsp?idx=<%=idx%>', '인시던트로 변경',''); return false;" target="_blank">작업시작</a><%
			break;
			case 1:
		        %>
				<button type="submit" class="btn btn-default">수정</button>
				<a class="btn btn-default"
			   onclick="window.open('incidentToComplete.jsp?idx=<%=idx%>', '작업완료로 변경',''); return false;" target="_blank">작업완료</a>
				<a class="btn btn-default"
			   onclick="window.open('incidentToComplete.jsp?idx=<%=idx%>', '변경관리로 변경',''); return false;" target="_blank">변경이관</a>
				<%
			break;
		}%>
		</div>
	</form>
	<%@include file="/common_footer.jsp"%>
</body>
<%
		}
	}catch (Exception e){
		}
%>
</html>