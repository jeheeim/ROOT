<%@ page language ="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include page="../dbLogin.jspf"%>

<%
int service_requested = 0;
int service_new = 1;
int service_assigned = 2;
int service_onProgress = 3;
int service_finished = 4;

// 클라이언트 아이디가 세션의 user_id인 경우에서 전체 갯수를 검색
String sql = "SELECT COUNT FROM kms WHERE 클라이언트 아이디 = 사용자 id";
stmt = conn.createStatement();
rs = stmt.executeQuery(sql);
%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<%@ include file="../common_header.jsp"%>

    <title>client main page</title>
</head>

<body>
	<div class="col-sm-1"></div>
	<div class="col-sm-9">
   		<table class="table table-striped">
			<thead>
				<tr><th colspan = "4"><p class="text-center">서비스 요청 현황</th></tr>
			</thead>

			<tbody>
				<tr><td colspan = "4"><p class="text-center"><%=service_requested%></td></tr>
			</tbody>
			
			<thead>
				<tr>
					<th><p class="text-center">신규</th>
					<th><p class="text-center">접수</th>
					<th><p class="text-center">작업중</th>
					<th><p class="text-center">완료</th>
				</tr>
			</thead>
			
			<tbody>
				<td><p class="text-center"><%=service_new%></td>
				<td><p class="text-center"><%=service_assigned%></td>
				<td><p class="text-center"><%=service_onProgress%></td>
				<td><p class="text-center"><%=service_finished%></td>
			</tbody>
		</table>
	</div>

	<%@ include file="../common_footer.jsp"%>

  </body>
</html>