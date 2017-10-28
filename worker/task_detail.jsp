<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../dbLogin.jspf"%>

<%
/*
업무 확인 창.
이 창은 업무의 세부 사항을 출력하는 화면.
업무의 상태가 신규업무, 접수(배정)된 업무, (여기서부터 작업중) 인시던트, 변경관리, 릴리즈, 완료 상태에 따라 세부 사항이 달라진다.

kms 테이블에서 idx값이 패러미터 param인 항목을 찾아야한다.
그 항목의 incident_idx값과, 만약 있다면 change_idx값을 각각 incidentFrame과 changeFrame에서 호출할 페이지에
패러미터로 넘겨야한다.
*/

int param = Integer.parseInt(request.getParameter("param"));
if(param < 1){
    out.println("KMS에 DATA가 없습니다.");
}
else{
int incident_param = 0;
int change_param = 0;

boolean changeState = false;
try {
	sql = "SELECT incident_index, change_index FROM kms WHERE kms_index = " + param;
	stmt = conn.createStatement();
}catch (Exception e){
    out.println(e.toString());
}
try{
	rs = stmt.executeQuery(sql);
}catch (SQLException e){
    out.println(e.toString());
}
try{
	if (rs.next()) {
		incident_param = rs.getInt(1);
		out.println("inci idx" + incident_param);
		if(rs.getInt(2) != 0) {
			change_param = rs.getInt(2);
			changeState = true;
			out.println("chan idx " + change_param);
		}
		else{
		    changeState = false;
		}
	}
}
catch (Exception e2){
}
/*
쿼리문을 실행해 incident_param에 incident_idx, change_param에 change_idx를 입력할것.
*/

String incident_page = "incident.jsp?idx=" + incident_param;
String change_page = "change.jsp?idx=" + change_param;
out.println(incident_page);
//~~~ incident param과 change param에 값을 넣어줄 쿼리문 실행할것
// status 값도 구해서 넣을것
%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<%@include file="../common_header.jsp"%>
	<title>Task Detail</title>
</head>
<body>
	<h1>업무 상세보기</h1>
	<div id="incidentFrame">
		<jsp:include page="<%=incident_page%>" flush="true"/>
	</div>

	<div id="changeFrame">
		<%
			if(changeState){
			    %><jsp:include page="<%=change_page%>" flush="true"/><%
			}
		}
	%>

	</div>

</body>
</html>