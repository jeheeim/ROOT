<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../dbLogin.jspf"%>

<%
int service_inQueue = 0;
int service_new = 1;
int service_assigned = 2;
int service_onProgress = 3;
int service_finished = 4;

int number_incident;
int number_change;
int number_release;

try
{
	stmt = conn.createStatement();

	sql = "SELECT COUNT(*) COUNT(if(status=0, status, NULL)), COUNT(if(status=1, status, NULL)), COUNT(if(status = 2, status, NULL), COUNT(if(status = 3, status, NULL)), COUNT(if(status = 4, status, NULL)), COUNT(if(status = 5, status, NULL)) FROM incident_management";
	rs = stmt.executeQuery(sql);

	if(rs.next())
	{
		service_inQueue  = rs.getInt(1);
		service_new		 = rs.getInt(2);
		service_assigned = rs.getInt(3);
		number_incident  = rs.getInt(4);
		number_change 	 = rs.getInt(5);
		number_release 	 = rs.getInt(6);
		service_finished = rs.getInt(7);
	}
}
catch(SQLException sqle)
{
	out.println(sqle.toString());
}
catch(Exception e)
{
	out.println(e.toString());
}
finally
{
	rs.close();
	stmt.close();
	conn.close();
}
%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<%@ include file="../common_header.jsp"%>	
	<title>client main body</title>
</head>

<body>
	<div class="col-sm-1"></div>
	<div class="col-sm-9">
		<form class="form-horizontal">
			<table class="table table-striped">
				<thead>
					<tr><th colspan = "4"><p class="text-center">서비스 요청 현황</th></tr>
				</thead>
				
				<%
				/*
				url에 있는 param의 의미
				0 또는 없는 경우 : 내가 요구한 모든 일 검색
				1: 아직 배정되지않은 서비스 검색
				2: 배정은 됐지만 아직 작업에 들어가지않은 서비스
				3: 지금 작업중인 서비스
				4: 작업 완료된 서비스
				*/
				%>
				<tbody><tr style="cursor:pointer" onClick="location.href='/mainPage.jsp?mod=2'"><td colspan = "4"><p class="text-center"><%=service_inQueue%></td></tr></tbody>
				
				<thead>
					<tr>
						<th><p class="text-center">신규</th>
						<th><p class="text-center">접수</th>
						<th><p class="text-center">작업중</th>
						<th><p class="text-center">완료</th>
					</tr>
				</thead>

				<tbody>
					<tr>
						<td style="cursor:pointer" onClick="location.href='/mainPage.jsp?mod=2&param=1'"><p class="text-center"><%=service_new%></td>
						<td style="cursor:pointer" onClick="location.href='/mainPage.jsp?mod=2&param=2'"><p class="text-center"><%=service_assigned%></td>
						<td style="cursor:pointer" onClick="location.href='/mainPage.jsp?mod=2&param=3'"><p class="text-center"><%=service_onProgress%></td>
						<td style="cursor:pointer" onClick="location.href='/mainPage.jsp?mod=2&param=4'"><p class="text-center"><%=service_finished%></td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
	<%@ include file="../common_footer.jsp"%>
</body>
</html>